with order_detail as(
    select
        dense_rank()over(order by item) as grp_key
        ,dense_rank()over(partition by item order by arrive_date,cust_id,seq) as grpseq_key
        ,item
        ,prov_inst_qty
        ,arrive_date
        ,cust_id
        ,seq
    from test_order
)
--select * from order_detail;
,stock_detail as(
    select
        dense_rank()over(order by item) as grp_key
        ,dense_rank()over(partition by item order by whs_dtm,epr_dtm) as grpseq_key
        ,item
        ,whs_dtm
        ,epr_dtm
        ,stk_qty-rsv_stk_qty as enable_qty
    from
        test_stock
)
--select * from stock_detail;
,args_detail as(
    --在庫データを正にしてグループ番号を付与
    select
        dense_rank()over(order by s2.grp_key,s2.grpseq_key) as grp_key
        ,s1.grpseq_key, s1.item, s1.prov_inst_qty, s1.arrive_date, s1.cust_id, s1.seq
        ,s2.whs_dtm, s2.epr_dtm, s2.enable_qty
    from order_detail s1,stock_detail s2
    where s1.grp_key=s2.grp_key
    order by s2.grp_key,s2.grpseq_key,s1.grpseq_key
)
--select * from args_detail;
,args_summary as(
    --在庫データの先頭グループを引数コレクションにする
    select
        cast(collect(args_grp(grp_key,grpseq_key,prov_inst_qty)) as args_grp_liz) as tgt
    from args_detail
    where grp_key=1
)
--select * from args_summary;
,rec(grp_key, grpseq_key, enable_qty, item, prov_inst_qty
    ,remain_cnt, carry_over_cnt, upd_cnt
    ,tgt)as(
    select
        s3.grp_key,s3.grpseq_key,s3.enable_qty,s3.item,s3.prov_inst_qty
        ,s2.remain_cnt,s2.carry_over_cnt,s2.upd_cnt
        ,s1.tgt
    from args_summary s1
        ,args_detail s3
        ,table(alloc(s1.tgt,s3.enable_qty))s2
    where s2.grp_key=s3.grp_key
      and s2.grpseq_key=s3.grpseq_key
    union all
    select
        s3.grp_key,s3.grpseq_key,s3.enable_qty,s3.item,s3.prov_inst_qty
        ,s3.remain_cnt,s3.carry_over_cnt,s3.upd_cnt
        ,s3.tgt
    from rec s1
        ,lateral(
                  select
                      s3.grp_key,s3.grpseq_key,s3.enable_qty,s3.item,s3.prov_inst_qty
                      ,s2.remain_cnt,s2.carry_over_cnt,s2.upd_cnt
                      ,s1.tgt
                  from
                      (
                        select
                            cast(collect(args_grp(s1.grp_key,s1.grpseq_key,s1.prov_inst_qty)) as args_grp_liz) as tgt--この結果をgrp_key単位でさらにサマリ上げる必要がある。コレクション型だとできないので、文字列で持ち回す必要がある。再帰withは入れ子にできないから、階層で代替しないといけない。
                        from
                            (
                              --前回結果のうち残指示数が存在する場合は、次の引当ファンクションの引数データを抽出
                              --存在しない場合は、0件なので、inner joinが失敗し、再帰終了
                              select
                                  s3.grp_key,s3.grpseq_key,s1.remain_cnt as prov_inst_qty
                              from args_detail s3
                              where
                                  s1.grp_key+1=s3.grp_key
                              and s1.grpseq_key=s3.grpseq_key
                              and s1.remain_cnt<>0
                            )s1
                      )s1--args_summary インラインビューの作成
                      ,(
                        --前回結果のうち残指示数が存在する場合は、次の引当ファンクションの明細データを抽出
                        --grpseq_keyをargs_detailインラインビューから新規に取得
                        select
                            s3.grp_key,s3.grpseq_key,s3.enable_qty,s3.item,s1.remain_cnt as prov_inst_qty
                        from args_detail s3
                        where
                            s1.grp_key+1=s3.grp_key
                        and s1.grpseq_key=s3.grpseq_key
                        and s1.remain_cnt<>0
                      )s3--args_detail インラインビューの作成
                      ,table(alloc(s1.tgt,s3.enable_qty))s2--allocファンクションをコール
                  where s2.grp_key=s3.grp_key
                    and s2.grpseq_key=s3.grpseq_key
                )s3
    where s1.grp_key+1=2--デバッグ用
--    where s1.grp_key+1=s3.grp_key--本番用
)
cycle grp_key,grpseq_key set isloop to 'Y' default 'N'
select * from rec order by grp_key,grpseq_key;
