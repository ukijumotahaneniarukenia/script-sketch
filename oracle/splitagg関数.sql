create or replace type args_grp_splitagg is object (
    grp_key     number
    ,grpseq_key number
    ,item       varchar2(4000)
);
/

create or replace type args_grp_liz_splitagg is table of args_grp_splitagg;
/

create or replace type rt_grp_splitagg is object (
    grp_key     number
    ,grpseq_key number
    ,rez        varchar2(4000)
);
/

create or replace type rt_grp_liz_splitagg is table of rt_grp_splitagg;
/

create or replace function splitagg_std(tgt args_grp_liz_splitagg,sep varchar2,upper_limit_len number)
return rt_grp_liz_splitagg
as
rt rt_grp_liz_splitagg;
begin
    with sub as(
        select
            grp_key
            ,case
                when grp_key is null then row_number()over(order by grpseq_key)
                else grpseq_key
            end as grpseq_key
            ,item
        from table(tgt)
    ),rec(grp_key,grpseq_key,item, sep, sum_item_len, over_flg) as(
        select grp_key,grpseq_key,item,sep,length(sep)+length(item),1 from sub where grpseq_key=1
        union all
        select s2.grp_key,s2.grpseq_key,s2.item,sep
            ,case
                when s1.sum_item_len+length(sep)+length(s2.item) > upper_limit_len or length(sep)+length(s2.item) > upper_limit_len then length(sep)+length(s2.item)
                else s1.sum_item_len+length(sep)+length(s2.item)
            end
            ,case
                when s1.sum_item_len+length(sep)+length(s2.item) > upper_limit_len or length(sep)+length(s2.item) > upper_limit_len then 1
                else 0
            end
        from rec s1,sub s2
        where
            nvl(s1.grp_key,1)=nvl(s2.grp_key,1)
        and s1.grpseq_key+1=s2.grpseq_key
    )
    select
        cast(collect(rt_grp_splitagg(grp_key,subgrp_key,rez)) as rt_grp_liz_splitagg)
        into rt
    from(
        select
            grp_key,subgrp_key
            ,listagg(sep||item)within group(order by grpseq_key) as rez
        from(
            select
                grp_key
                ,sum(over_flg)over(partition by grp_key order by grpseq_key) as subgrp_key
                , grpseq_key
                , item, sep, sum_item_len, over_flg
            from(
                select
                    grp_key, grpseq_key, item, sep, sum_item_len, over_flg
                from rec
                )
        )
        group by
            grp_key,subgrp_key
    );
    return rt;
end;
/

create or replace function splitagg(tgt args_grp_liz_splitagg,sep varchar2,upper_limit_len number)
return rt_grp_liz_splitagg
as
rt rt_grp_liz_splitagg;
begin
    select
        cast(collect(rt_grp_splitagg(grp_key,subgrp_key,rez)) as rt_grp_liz_splitagg)
        into rt
    from(
        select
            grp_key,subgrp_key
            ,listagg(sep||item)within group(order by grpseq_key) as rez
        from(
            select
                grp_key, subgrp_key, grpseq_key, item, sep, sum_item_len, over_flg
            from
                table(tgt)
            model
                partition by(grp_key)
                dimension by(case when grp_key is null then row_number()over(order by grpseq_key) else grpseq_key end as grpseq_key)
                measures(
                    item
                    ,length(item) as sum_item_len
                    ,1 as over_flg
                    ,0 as subgrp_key
                )
                rules automatic order(
                    sum_item_len[grpseq_key>1]order by grpseq_key=case
                            when sum_item_len[cv()-1]+length(sep)+length(item[cv()])>upper_limit_len
                                or length(sep)+length(item[cv()])>upper_limit_len then length(sep)+length(item[cv()])
                            else sum_item_len[cv()-1]+length(sep)+length(item[cv()])
                        end
                    ,over_flg[grpseq_key>1]order by grpseq_key=case
                            when sum_item_len[cv()-1]+length(sep)+length(item[cv()])>upper_limit_len
                                or length(sep)+length(item[cv()])>upper_limit_len then 1
                            else 0
                        end
                    ,subgrp_key[any]=sum(over_flg)over(order by grpseq_key)
                )
            )
        group by 
            grp_key,subgrp_key
    );
    return rt;
end;
/

with sub as(
    select
        level as grpseq
        ,lpad(level,6,0) as item
    from
        dual
    connect by level<=30
),subb as(
    select cast(collect(args_grp_splitagg(null,grpseq,item)) as args_grp_liz_splitagg) as tgt  from sub
)select grp_key, grpseq_key, rez,length(rez) from subb,table(splitagg_std(tgt,',',30));

with sub as(
    select
        ceil(level/7) as grp
        ,row_number()over(partition by ceil(level/7) order by level) as grpseq
        ,lpad(level,6,0) as item
    from
        dual
    connect by level<=30
),subb as(
    select cast(collect(args_grp_splitagg(grp,grpseq,item)) as args_grp_liz_splitagg) as tgt  from sub
)select grp_key, grpseq_key, rez,length(rez) from subb,table(splitagg_std(tgt,',',15));

with sub as(
    select
        ceil(level/900) as grp
        ,row_number()over(partition by ceil(level/900) order by level) as grpseq
        ,lpad(level,6,0) as item
    from
        dual
    connect by level<=2000
),subb as(
    select cast(collect(args_grp_splitagg(grp,grpseq,item)) as args_grp_liz_splitagg) as tgt  from sub
)select grp_key, grpseq_key, substr(rez,1,7) as head,substr(rez,-7) as tail,length(rez) from subb,table(splitagg_std(tgt,',',4000));

with sub as(
    select
        level as grpseq
        ,lpad(level,6,0) as item
    from
        dual
    connect by level<=30
),subb as(
    select cast(collect(args_grp_splitagg(null,grpseq,item)) as args_grp_liz_splitagg) as tgt  from sub
)select grp_key, grpseq_key, rez,length(rez) from subb,table(splitagg(tgt,',',30));

with sub as(
    select
        ceil(level/7) as grp
        ,row_number()over(partition by ceil(level/7) order by level) as grpseq
        ,lpad(level,6,0) as item
    from
        dual
    connect by level<=30
),subb as(
    select cast(collect(args_grp_splitagg(grp,grpseq,item)) as args_grp_liz_splitagg) as tgt  from sub
)select grp_key, grpseq_key, rez,length(rez) from subb,table(splitagg(tgt,',',15));

with sub as(
    select
        ceil(level/900) as grp
        ,row_number()over(partition by ceil(level/900) order by level) as grpseq
        ,lpad(level,6,0) as item
    from
        dual
    connect by level<=2000
),subb as(
    select cast(collect(args_grp_splitagg(grp,grpseq,item)) as args_grp_liz_splitagg) as tgt  from sub
)select grp_key, grpseq_key,substr(rez,1,7) as head,substr(rez,-7) as tail,length(rez) from subb,table(splitagg(tgt,',',4000));