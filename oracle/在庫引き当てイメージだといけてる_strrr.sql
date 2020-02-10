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
        max(sys_connect_by_path(grp_key||':'||grpseq_key||':'||prov_inst_qty,',')) as tgt
    from (select * from args_detail where grp_key=1)
    start with grpseq_key=1
    connect by prior grpseq_key+1=grpseq_key
)
,rec(grp_key, grpseq_key, enable_qty, item, prov_inst_qty
    ,remain_cnt, carry_over_cnt, upd_cnt
    ,tgt)as(
    select
        cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 1) as number) as grp_key
        ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 2) as number) as grpseq_key
        ,enable_qty
        ,item
        ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 3) as number) as prov_inst_qty
        ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 4) as number) as remain_cnt
        ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 5) as number) as carry_over_cnt
        ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 6) as number) as upd_cnt
        ,tgt
    from(select max(s1.tgt) as tgt,max(s2.item) as item,max(s2.enable_qty) as enable_qty,max(alloc_str(s1.tgt,s2.enable_qty)) as done from args_summary s1,args_detail s2 where s2.grp_key=1)
    connect by level<=length(done)-length(replace(done,',',''))
    union all
    select
        s3.grp_key,s3.grpseq_key,s3.enable_qty,s3.item,s3.prov_inst_qty
        ,s3.remain_cnt,s3.carry_over_cnt,s3.upd_cnt
        ,s3.tgt
    from rec s1
        ,lateral(
                  select
                    cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 1) as number) as grp_key
                    ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 2) as number) as grpseq_key
                    ,enable_qty
                    ,item
                    ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 3) as number) as prov_inst_qty
                    ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 4) as number) as remain_cnt
                    ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 5) as number) as carry_over_cnt
                    ,cast(regexp_substr(done,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 6) as number) as upd_cnt
                    ,tgt
                  from(
                      select
                        max(s1.tgt) as tgt
                        ,max(s2.item) as item
                        ,max(s2.enable_qty) as enable_qty
                        ,max(alloc_str(s1.tgt,s2.enable_qty)) as done
                      from(
                            select
                                --この結果をgrp_key単位でさらにサマリ上げる必要がある。コレクション型だとできないので、文字列で持ち回す必要がある。再帰withは入れ子にできないから、階層で代替しないといけない。
                                (sys_connect_by_path(s1.grp_key||':'||s1.grpseq_key||':'||s1.prov_inst_qty,',')) as tgt
                            from(
                                  --前回結果のうち残指示数が存在する場合は、次の引当ファンクションの引数データを抽出
                                  --存在しない場合は、0件なので、inner joinが失敗し、再帰終了
                                  select
                                      s1.grp_key
                                      ,row_number()over(order by s1.grpseq_key) as grpseq_key
                                      ,s1.remain_cnt as prov_inst_qty
                                  from(
                                        select
                                          s3.grp_key
                                          ,s3.grpseq_key
                                          ,min(s1.grpseq_key)over() as mn_grpseq_key
                                          ,max(s1.grpseq_key)over() as mx_grpseq_key
                                          ,s1.remain_cnt as prov_inst_qty
                                        from
                                            args_detail s3
                                        where
                                          s1.grp_key+1=s3.grp_key
                                        and s1.remain_cnt<>0
                                      )s1
                                  where
                                    s1.grpseq_key between s1.mn_grpseq_key and s1.mx_grpseq_key
                                )s1
                            start with s1.grpseq_key=1
                            connect by prior s1.grpseq_key+1=s1.grpseq_key
                          )s1--args_summary インラインビューの作成
                          ,(
                            --前回結果のうち残指示数が存在する場合は、次の引当ファンクションの明細データを抽出
                            select
                                s3.grp_key
                                ,s3.grpseq_key
                                ,s3.enable_qty,s3.item,s1.remain_cnt as prov_inst_qty
                            from args_detail s3
                            where
                                s1.grp_key+1=s3.grp_key
                            and s1.remain_cnt<>0
                          )s2--args_detail インラインビューの作成
                      where s1.grp_key+1=s2.grp_key
                      )
                    connect by level<=length(done)-length(replace(done,',',''))
                )s3
    where s1.grp_key+1=2--デバッグ用
--    where s1.grp_key+1=s3.grp_key--本番用
)
cycle grp_key,grpseq_key set isloop to 'Y' default 'N'
select * from rec order by grp_key,grpseq_key;