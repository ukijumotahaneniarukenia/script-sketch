create or replace type args_grp_each_slice is object (
    grp_key            number
    , grpseq_key       number
    , enable_cnt       number
);
/

create or replace type args_grp_liz_each_slice is table of args_grp_each_slice;
/

create or replace type rt_grp_each_slice is object (
    grp_key            number
    , grpseq_key       number
    , enable_cnt       number
    , cum_cnt          number
    , over_flg         number
    , subgrp_key       number
);
/

create or replace type rt_grp_liz_each_slice is table of rt_grp_each_slice;
/

create or replace function each_slice(tgt args_grp_liz_each_slice,upper_limit_cnt number)
return rt_grp_liz_each_slice
as
rt rt_grp_liz_each_slice;
begin
select
    cast(collect(rt_grp_each_slice(grp_key,grpseq_key,enable_cnt,cum_cnt, over_flg, subgrp_key)) as rt_grp_liz_each_slice)
    into rt
from(
    select
        grp_key,grpseq_key,enable_cnt,cum_cnt, over_flg, subgrp_key
    from table(tgt)
    model
        partition by (grp_key)
        dimension by (case when grp_key is null then row_number()over(order by grpseq_key) else grpseq_key end as grpseq_key)
        measures (enable_cnt,enable_cnt as cum_cnt,1 as over_flg,cast(null as number) as subgrp_key)
        rules
        (
            cum_cnt[grpseq_key>1]=case
                    when cum_cnt[cv()-1] + enable_cnt[cv()] > upper_limit_cnt or enable_cnt[cv()] > upper_limit_cnt then enable_cnt[cv()]
                    when cum_cnt[cv()-1] + enable_cnt[cv()] <= upper_limit_cnt or enable_cnt[cv()] <= upper_limit_cnt then cum_cnt[cv()-1] + enable_cnt[cv()]
                end
            ,over_flg[grpseq_key>1]=case
                    when cum_cnt[cv()-1] + enable_cnt[cv()] > upper_limit_cnt or enable_cnt[cv()] > upper_limit_cnt then 1
                    when cum_cnt[cv()-1] + enable_cnt[cv()] <= upper_limit_cnt or enable_cnt[cv()] <= upper_limit_cnt then 0
                end
            ,subgrp_key[any]=sum(over_flg)over(partition by grp_key order by grpseq_key)
        )
    );
    return rt;
end;
/


create or replace function each_slice_std(tgt args_grp_liz_each_slice,upper_limit_cnt number)
return rt_grp_liz_each_slice
as
rt rt_grp_liz_each_slice;
begin
    with sub as(
        select
            grp_key
            ,case
                when grp_key is null then row_number()over(order by grpseq_key)
                else grpseq_key
            end as grpseq_key
            ,enable_cnt
        from table(tgt)
    ),rec(grp_key,grpseq_key,enable_cnt,cum_cnt, over_flg) as(
        select grp_key,grpseq_key,enable_cnt,enable_cnt,1 from sub where grpseq_key=1
        union all
        select s2.grp_key,s2.grpseq_key,s2.enable_cnt
            ,case
                when s1.cum_cnt + s2.enable_cnt > upper_limit_cnt or s2.enable_cnt > upper_limit_cnt then s2.enable_cnt
                when s1.cum_cnt + s2.enable_cnt <= upper_limit_cnt or s2.enable_cnt <= upper_limit_cnt then s1.cum_cnt + s2.enable_cnt
            end
            ,case
                when s1.cum_cnt + s2.enable_cnt > upper_limit_cnt or s2.enable_cnt > upper_limit_cnt then 1
                when s1.cum_cnt + s2.enable_cnt <= upper_limit_cnt or s2.enable_cnt <= upper_limit_cnt then 0
            end
        from rec s1,sub s2
        where
            nvl(s1.grp_key,1)=nvl(s2.grp_key,1)
        and s1.grpseq_key+1=s2.grpseq_key
    )
    select
        cast(collect(rt_grp_each_slice(grp_key,grpseq_key,enable_cnt,cum_cnt, over_flg, subgrp_key)) as rt_grp_liz_each_slice)
        into rt
    from(
        select
            grp_key
            ,grpseq_key
            ,enable_cnt
            ,cum_cnt
            ,over_flg
            ,sum(over_flg)over(partition by grp_key order by grpseq_key) as subgrp_key
        from(
            select
                grp_key,grpseq_key,enable_cnt,cum_cnt, over_flg
            from rec
            )
        );
    return rt;
end;
/

drop table test_stock purge;
create table test_stock (
    item          varchar2(8 byte)
    , whs_dtm       date
    , epr_dtm       date
    , stk_qty       number
    , rsv_stk_qty   number
);

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
),stock_args as(
    select cast(collect(args_grp_each_slice(null,grpseq_key,enable_cnt)) as args_grp_liz_each_slice) as tgt
    from stock_detail
)
select
    s2.grp_key, s2.grpseq_key, s2.enable_cnt, s2.cum_cnt,700 as upper_limit_cnt, s2.over_flg, s2.subgrp_key
    ,min(s2.cum_cnt)over(partition by s2.grp_key,s2.subgrp_key) as mn_cum_cnt
    ,max(s2.cum_cnt)over(partition by s2.grp_key,s2.subgrp_key) as mx_cum_cnt
from stock_args s1
,table(each_slice(s1.tgt,700)) s2
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
),stock_args as(
    select cast(collect(args_grp_each_slice(grp_key,grpseq_key,enable_cnt)) as args_grp_liz_each_slice) as tgt
    from stock_detail
)
select 
    s2.grp_key, s2.grpseq_key, s2.enable_cnt, s2.cum_cnt,700 as upper_limit_cnt, s2.over_flg, s2.subgrp_key
    ,min(s2.cum_cnt)over(partition by s2.grp_key,s2.subgrp_key) as mn_cum_cnt
    ,max(s2.cum_cnt)over(partition by s2.grp_key,s2.subgrp_key) as mx_cum_cnt
from stock_args s1
,table(each_slice(s1.tgt,700)) s2
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
),stock_args as(
    select cast(collect(args_grp_each_slice(null,grpseq_key,enable_cnt)) as args_grp_liz_each_slice) as tgt
    from stock_detail
)
select 
    s2.grp_key, s2.grpseq_key, s2.enable_cnt, s2.cum_cnt,700 as upper_limit_cnt, s2.over_flg, s2.subgrp_key
    ,min(s2.cum_cnt)over(partition by s2.grp_key,s2.subgrp_key) as mn_cum_cnt
    ,max(s2.cum_cnt)over(partition by s2.grp_key,s2.subgrp_key) as mx_cum_cnt
from stock_args s1
,table(each_slice_std(s1.tgt,700)) s2
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
),stock_args as(
    select cast(collect(args_grp_each_slice(grp_key,grpseq_key,enable_cnt)) as args_grp_liz_each_slice) as tgt
    from stock_detail
)
select 
    s2.grp_key, s2.grpseq_key, s2.enable_cnt, s2.cum_cnt,700 as upper_limit_cnt, s2.over_flg, s2.subgrp_key
    ,min(s2.cum_cnt)over(partition by s2.grp_key,s2.subgrp_key) as mn_cum_cnt
    ,max(s2.cum_cnt)over(partition by s2.grp_key,s2.subgrp_key) as mx_cum_cnt
from stock_args s1
,table(each_slice_std(s1.tgt,700)) s2
order by s2.grp_key, s2.grpseq_key
;
