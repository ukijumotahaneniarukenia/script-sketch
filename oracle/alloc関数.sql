create or replace type args_grp_alloc is object(
    grp_key            number
    , grpseq_key       number
    , enable_cnt       number
);
/

create or replace type args_grp_liz_alloc is table of args_grp_alloc;
/

create or replace type rt_grp_alloc is object(
    grp_key             number
    , grpseq_key        number
    , enable_cnt        number
    , remain_cnt        number
    , carry_over_cnt    number
    , upd_cnt           number
);
/

create or replace type rt_grp_liz_alloc is table of rt_grp_alloc;
/

create or replace function alloc(tgt args_grp_liz_alloc,upper_limit_cnt number)
return rt_grp_liz_alloc
as
rt rt_grp_liz_alloc;
begin
    select
        cast(collect(rt_grp_alloc(grp, grpseq, enable_cnt, remain_cnt, carry_over_cnt, upd_cnt)) as rt_grp_liz_alloc)
    into rt
    from(
        select grp_key as grp, grpseq_key as grpseq, enable_cnt, remain_cnt, carry_over_cnt, upd_cnt
        from table(tgt)
        model
            partition by(grp_key)
            dimension by(grpseq_key)
            measures(
                enable_cnt
                ,case
                    when grpseq_key=1 and enable_cnt - upper_limit_cnt >0 then enable_cnt - upper_limit_cnt
                    when grpseq_key=1 and enable_cnt - upper_limit_cnt <=0 then 0
                    else 0
                end as remain_cnt
                ,case
                    when grpseq_key=1 and enable_cnt - upper_limit_cnt >0 then 0
                    when grpseq_key=1 and enable_cnt - upper_limit_cnt <=0 then abs(enable_cnt - upper_limit_cnt)
                    else 0
                end as carry_over_cnt
                ,case
                    when grpseq_key=1 and enable_cnt - upper_limit_cnt >0 then to_number(upper_limit_cnt)
                    when grpseq_key=1 and enable_cnt - upper_limit_cnt <=0 then enable_cnt
                    else 0
                end as upd_cnt
            )
            rules automatic order(
                remain_cnt[grpseq_key>1]=case
                    when enable_cnt[cv()]-carry_over_cnt[cv()-1]>0 then enable_cnt[cv()]-carry_over_cnt[cv()-1]
                    when enable_cnt[cv()]-carry_over_cnt[cv()-1]<=0 then 0
                end
                ,carry_over_cnt[grpseq_key>1]=case
                    when enable_cnt[cv()]-carry_over_cnt[cv()-1]>0 then 0
                    when enable_cnt[cv()]-carry_over_cnt[cv()-1]<=0 then abs(enable_cnt[cv()]-carry_over_cnt[cv()-1])
                end
                ,upd_cnt[grpseq_key>1]=case
                    when enable_cnt[cv()]-carry_over_cnt[cv()-1]>0 then carry_over_cnt[cv()-1]
                    when enable_cnt[cv()]-carry_over_cnt[cv()-1]<=0 then enable_cnt[cv()]
                end
            )
        );
    return rt;
end;
/

create or replace function alloc_std(tgt args_grp_liz_alloc,upper_limit number)
return rt_grp_liz_alloc
as
rt rt_grp_liz_alloc;
begin
    with rec(grp_key,grpseq_key,enable_cnt,remain_cnt,carry_over_cnt,upd_cnt)as(
        select grp_key, grpseq_key, enable_cnt
            ,case
                when grpseq_key=1 and enable_cnt - upper_limit >0 then enable_cnt - upper_limit
                when grpseq_key=1 and enable_cnt - upper_limit <=0 then 0
                else 0
            end as remain_cnt
            ,case
                when grpseq_key=1 and enable_cnt - upper_limit >0 then 0
                when grpseq_key=1 and enable_cnt - upper_limit <=0 then abs(enable_cnt - upper_limit)
                else 0
            end as carry_over_cnt
            ,case
                when grpseq_key=1 and enable_cnt - upper_limit >0 then to_number(upper_limit)
                when grpseq_key=1 and enable_cnt - upper_limit <=0 then enable_cnt
                else 0
            end as upd_cnt
        from table(tgt) where grpseq_key=1
        union all
        select s1.grp_key
            ,s1.grpseq_key
            ,s1.enable_cnt
            ,case
                when s1.enable_cnt-s0.carry_over_cnt>0 then s1.enable_cnt-s0.carry_over_cnt
                when s1.enable_cnt-s0.carry_over_cnt<=0 then 0
            end
            ,case
                when s1.enable_cnt-s0.carry_over_cnt>0 then 0
                when s1.enable_cnt-s0.carry_over_cnt<=0 then abs(s1.enable_cnt-s0.carry_over_cnt)
            end
            ,case
                when s1.enable_cnt-s0.carry_over_cnt>0 then s0.carry_over_cnt
                when s1.enable_cnt-s0.carry_over_cnt<=0 then s1.enable_cnt
            end
        from rec s0,table(tgt) s1
        where s0.grp_key=s1.grp_key
        and s0.grpseq_key+1=s1.grpseq_key
    )
    select
        cast(collect(rt_grp_alloc(grp_key,grpseq_key,enable_cnt,remain_cnt,carry_over_cnt,upd_cnt)) as rt_grp_liz_alloc)
        into rt
    from (select grp_key,grpseq_key,enable_cnt,remain_cnt,carry_over_cnt,upd_cnt from rec);
    return rt;
end;
/

create or replace function alloc_str(tgt varchar2,upper_limit_cnt number)
return varchar2
as
rt varchar2(4000);
begin
    select
        listagg(tgt)within group(order by grp_key) as tgt
        into rt
    from(
        select
            grp_key
            ,max(tgt) as tgt
        from(
            select
                grp_key,sys_connect_by_path(grp_key||':'||grpseq_key||':'||enable_cnt||':'||remain_cnt||':'||carry_over_cnt||':'||upd_cnt,',') as tgt
            from(
                select grp_key, grpseq_key, enable_cnt, remain_cnt, carry_over_cnt, upd_cnt
                from(
                    select
                        cast(regexp_substr(s1.tgt,  ',(\d+):(\d+):(\d+)', 1, level, '', 1) as number) as grp_key
                        ,cast(regexp_substr(s1.tgt,  ',(\d+):(\d+):(\d+)', 1, level, '', 2) as number) as grpseq_key
                        ,cast(regexp_substr(s1.tgt,  ',(\d+):(\d+):(\d+)', 1, level, '', 3) as number) as enable_cnt
                    from (select tgt from dual) s1
                    connect by level<=length(s1.tgt)-length(replace(s1.tgt,',',''))
                )
                model
                partition by(grp_key)
                dimension by(grpseq_key)
                measures(
                    enable_cnt
                    ,case
                        when grpseq_key=1 and enable_cnt - upper_limit_cnt >0 then enable_cnt - upper_limit_cnt
                        when grpseq_key=1 and enable_cnt - upper_limit_cnt <=0 then 0
                        else 0
                    end as remain_cnt
                    ,case
                        when grpseq_key=1 and enable_cnt - upper_limit_cnt >0 then 0
                        when grpseq_key=1 and enable_cnt - upper_limit_cnt <=0 then abs(enable_cnt - upper_limit_cnt)
                        else 0
                    end as carry_over_cnt
                    ,case
                        when grpseq_key=1 and enable_cnt - upper_limit_cnt >0 then to_number(upper_limit_cnt)
                        when grpseq_key=1 and enable_cnt - upper_limit_cnt <=0 then enable_cnt
                        else 0
                    end as upd_cnt
                )
                rules automatic order(
                    remain_cnt[grpseq_key>1]=case
                        when enable_cnt[cv()]-carry_over_cnt[cv()-1]>0 then enable_cnt[cv()]-carry_over_cnt[cv()-1]
                        when enable_cnt[cv()]-carry_over_cnt[cv()-1]<=0 then 0
                    end
                    ,carry_over_cnt[grpseq_key>1]=case
                        when enable_cnt[cv()]-carry_over_cnt[cv()-1]>0 then 0
                        when enable_cnt[cv()]-carry_over_cnt[cv()-1]<=0 then abs(enable_cnt[cv()]-carry_over_cnt[cv()-1])
                    end
                    ,upd_cnt[grpseq_key>1]=case
                        when enable_cnt[cv()]-carry_over_cnt[cv()-1]>0 then carry_over_cnt[cv()-1]
                        when enable_cnt[cv()]-carry_over_cnt[cv()-1]<=0 then enable_cnt[cv()]
                    end
                )
            )
            start with grpseq_key=1
            connect by prior grp_key=grp_key and prior grpseq_key+1=grpseq_key
        )
        group by grp_key
    );
    return rt;
end;
/

drop table test_order purge;
create table test_order (
    seq             number
    , item            varchar2(8 byte)
    , prov_inst_qty   number
    , cust_id         varchar2(45 byte)
    , arrive_date     date
);
/

set define off;
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (1,'A0001',98,'c_0001',to_date('19-12-13','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (2,'A0001',88,'c_0001',to_date('19-12-14','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (3,'A0001',52,'c_0001',to_date('19-12-15','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (4,'A0001',83,'c_0002',to_date('19-12-13','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (5,'A0001',89,'c_0002',to_date('19-12-14','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (6,'A0001',58,'c_0002',to_date('19-12-15','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (7,'A0001',62,'c_0003',to_date('19-12-13','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (8,'A0001',38,'c_0003',to_date('19-12-14','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (9,'A0001',34,'c_0003',to_date('19-12-15','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (10,'B0001',17,'c_0001',to_date('19-12-13','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (11,'B0001',42,'c_0001',to_date('19-12-14','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (12,'B0001',50,'c_0001',to_date('19-12-15','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (13,'B0001',35,'c_0002',to_date('19-12-13','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (14,'B0001',54,'c_0002',to_date('19-12-14','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (15,'B0001',26,'c_0002',to_date('19-12-15','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (16,'B0001',76,'c_0003',to_date('19-12-13','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (17,'B0001',13,'c_0003',to_date('19-12-14','RR-MM-DD'));
insert into test_order (seq,item,prov_inst_qty,cust_id,arrive_date) values (18,'B0001',20,'c_0003',to_date('19-12-15','RR-MM-DD'));
commit;
/

drop table test_stock purge;
create table test_stock (
    item          varchar2(8 byte)
    , whs_dtm       date
    , epr_dtm       date
    , stk_qty       number
    , rsv_stk_qty   number
);
/

set define off;
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('A0001',to_date('19-12-09','RR-MM-DD'),to_date('20-01-08','RR-MM-DD'),270,6);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('A0001',to_date('19-12-09','RR-MM-DD'),to_date('20-01-09','RR-MM-DD'),219,9);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('A0001',to_date('19-12-09','RR-MM-DD'),to_date('20-01-10','RR-MM-DD'),168,4);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('A0001',to_date('19-12-10','RR-MM-DD'),to_date('20-01-09','RR-MM-DD'),285,2);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('A0001',to_date('19-12-10','RR-MM-DD'),to_date('20-01-10','RR-MM-DD'),294,8);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('A0001',to_date('19-12-11','RR-MM-DD'),to_date('20-01-10','RR-MM-DD'),175,7);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('B0001',to_date('19-12-09','RR-MM-DD'),to_date('20-01-08','RR-MM-DD'),195,5);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('B0001',to_date('19-12-09','RR-MM-DD'),to_date('20-01-09','RR-MM-DD'),297,3);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('B0001',to_date('19-12-09','RR-MM-DD'),to_date('20-01-10','RR-MM-DD'),185,8);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('B0001',to_date('19-12-10','RR-MM-DD'),to_date('20-01-09','RR-MM-DD'),177,10);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('B0001',to_date('19-12-10','RR-MM-DD'),to_date('20-01-10','RR-MM-DD'),267,10);
insert into test_stock (item,whs_dtm,epr_dtm,stk_qty,rsv_stk_qty) values ('B0001',to_date('19-12-11','RR-MM-DD'),to_date('20-01-10','RR-MM-DD'),161,8);
commit;
/

with stock_detail as(
    select
        dense_rank()over(order by item) as grp_key
        ,dense_rank()over(partition by item order by whs_dtm,epr_dtm) as grpseq_key
        ,item
        ,whs_dtm
        ,epr_dtm
        ,stk_qty-rsv_stk_qty as enable_cnt
    from
        test_stock
),stock_summary as(
    select grp_key,sum(enable_cnt) as sum_enable_cnt
    from stock_detail
    group by grp_key
),order_detail as(
    select SEQ, ITEM, PROV_INST_QTY, CUST_ID, ARRIVE_DATE
        ,dense_rank()over(order by item) as grp_key
        ,dense_rank()over(partition by item order by ARRIVE_DATE,CUST_ID,SEQ) as grpseq_key
    from test_order
),order_args as(
    select cast(collect(args_grp_alloc(grp_key,grpseq_key,prov_inst_qty)) as args_grp_liz_alloc) as tgt
    from order_detail
)
select
    row_number()over(order by s2.grp_key, s2.grpseq_key) as uniq_seq
    ,s2.grp_key, s2.grpseq_key,s2.seq,s2.item,s2.cust_id,s2.arrive_date
    ,s3.sum_enable_cnt
    ,s4.enable_cnt as prov_inst_qty
    ,s4.remain_cnt
    ,s4.carry_over_cnt
    ,s4.upd_cnt
from order_args s1
,order_detail s2
,stock_summary s3
,table(alloc(s1.tgt,s3.sum_enable_cnt)) s4
where s2.grp_key=s3.grp_key
and s3.grp_key=s4.grp_key
and s2.grpseq_key=s4.grpseq_key
order by s2.grp_key, s2.grpseq_key
;

with stock_detail as(
    select
        dense_rank()over(order by item) as grp_key
        ,dense_rank()over(partition by item order by whs_dtm,epr_dtm) as grpseq_key
        ,item
        ,whs_dtm
        ,epr_dtm
        ,stk_qty-rsv_stk_qty as enable_cnt
    from
        test_stock
),stock_summary as(
    select grp_key,sum(enable_cnt) as sum_enable_cnt
    from stock_detail
    group by grp_key
),order_detail as(
    select SEQ, ITEM, PROV_INST_QTY, CUST_ID, ARRIVE_DATE
        ,dense_rank()over(order by item) as grp_key
        ,dense_rank()over(partition by item order by ARRIVE_DATE,CUST_ID,SEQ) as grpseq_key
    from test_order
),order_args as(
    select cast(collect(args_grp_alloc(grp_key,grpseq_key,prov_inst_qty)) as args_grp_liz_alloc) as tgt
    from order_detail
)
select
    row_number()over(order by s2.grp_key, s2.grpseq_key) as uniq_seq
    ,s2.grp_key, s2.grpseq_key,s2.seq,s2.item,s2.cust_id,s2.arrive_date
    ,s3.sum_enable_cnt
    ,s4.enable_cnt as prov_inst_qty
    ,s4.remain_cnt
    ,s4.carry_over_cnt
    ,s4.upd_cnt
from order_args s1
,order_detail s2
,stock_summary s3
,table(alloc_std(s1.tgt,s3.sum_enable_cnt)) s4
where s2.grp_key=s3.grp_key
and s3.grp_key=s4.grp_key
and s2.grpseq_key=s4.grpseq_key
order by s2.grp_key, s2.grpseq_key
;

with stock_detail as(
    select
        dense_rank()over(order by item) as grp_key
        ,dense_rank()over(partition by item order by whs_dtm,epr_dtm) as grpseq_key
        ,item
        ,whs_dtm
        ,epr_dtm
        ,stk_qty-rsv_stk_qty as enable_cnt
    from
        test_stock
),sub as(
    select
        listagg(tgt)within group(order by item) as tgt
    from(
        select
            item
            ,max(tgt) as tgt
        from(
            select item,sys_connect_by_path(grp_key||':'||grpseq_key||':'||enable_cnt,',') as tgt
            from stock_detail
            start with grpseq_key=1
            connect by prior grp_key=grp_key and prior grpseq_key+1=grpseq_key
            )
        group by
            item
    )
)
select grp_key, grpseq_key, enable_cnt, remain_cnt, carry_over_cnt, upd_cnt
from (
    select
        cast(regexp_substr(s1.tgt,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 1) as number) as grp_key
        ,cast(regexp_substr(s1.tgt,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 2) as number) as grpseq_key
        ,cast(regexp_substr(s1.tgt,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 3) as number) as enable_cnt
        ,cast(regexp_substr(s1.tgt,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 4) as number) as remain_cnt
        ,cast(regexp_substr(s1.tgt,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 5) as number) as carry_over_cnt
        ,cast(regexp_substr(s1.tgt,  ',(\d+):(\d+):(\d+):(\d+):(\d+):(\d+)', 1, level, '', 6) as number) as upd_cnt
    from (select alloc_str(tgt,500) as tgt from sub) s1
    connect by level<=length(s1.tgt)-length(replace(s1.tgt,',',''))
)
;