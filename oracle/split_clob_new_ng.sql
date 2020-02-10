create or replace type args_map is object (
    grp_key  number
    ,tgt clob
);
/

create or replace type args_map_liz is table of args_map;
/

create or replace type rt_map is object (
    grp              number
    , start_grp        number
    , end_grp          number
    , subgrp           number
    , start_pos        number
    , end_pos          number
    , elelen           number
    , chanklen         number
    , seq              number
    , start_chankpos   number
    , end_chankpos     number
    , chank            varchar2(4000)
);
/

create or replace type rt_map_liz is table of rt_map;
/

create table test_tbl as
with sub as(
    select ceil(level/3) as grp_key, row_number()over(partition by ceil(level/3) order by level) as grpseq, dbms_random.string('X',trunc(dbms_random.value(4,11))) as str from dual connect by level<=10
)select grp_key,to_clob(listagg(str, ',') within group (order by grpseq)) as tgt from sub group by grp_key;

with sub as(select cast(collect(args_map(grp_key,tgt)) as args_map_liz) as nnn from test_tbl
),rec(grp_key,tgt,grp,start_grp,end_grp,start_pos,end_pos,elelen,split_chank_size) as (
        select
            grp_key
            ,tgt
            ,1
            ,1
            ,ceil((nvl(nullif(dbms_lob.instr(tgt,',',1,1),0),dbms_lob.getlength(tgt)+1)-(nvl(dbms_lob.instr(tgt,',',1,0),0)+1))/(greatest(nvl(nullif(dbms_lob.instr(tgt,',',1,1),0),dbms_lob.getlength(tgt)+1)-(nvl(dbms_lob.instr(tgt,',',1,0),0)+1),cast(:split_chank_size as number))))
            ,nvl(dbms_lob.instr(tgt,',',1,0),0)+1
            ,nvl(nullif(dbms_lob.instr(tgt,',',1,1),0)-1,dbms_lob.getlength(tgt))
            ,nvl(nullif(dbms_lob.instr(tgt,',',1,1),0),dbms_lob.getlength(tgt)+1)-(nvl(dbms_lob.instr(tgt,',',1,0),0)+1)
            ,cast (:split_chank_size as number)
        from
            (select * from sub,table(nnn))
        union all
        select
            s1.grp_key
            ,s1.tgt
            ,s1.grp+1
            ,s1.start_grp
            ,s1.end_grp
            ,nvl(dbms_lob.instr(s1.tgt,',',1,s1.grp),0)+1
            ,nvl(nullif(dbms_lob.instr(s1.tgt,',',1,s1.grp+1),0)-1,dbms_lob.getlength(s1.tgt))
            ,nvl(nullif(dbms_lob.instr(s1.tgt,',',1,s1.grp+1),0),dbms_lob.getlength(s1.tgt)+1)-(nvl(dbms_lob.instr(s1.tgt,',',1,s1.grp),0)+1)
            ,s1.split_chank_size
        from rec s1
        ,(select * from sub,table(nnn)) s2
        where s1.grp+1 <=dbms_lob.getlength(s1.tgt)-dbms_lob.getlength(replace(s1.tgt,',',''))+1
        and s1.grp_key=s2.grp_key
    )
    select * from rec;
--    ,recc(grp_key,tgt,grp,start_grp,end_grp,subgrp,start_pos,end_pos,elelen,split_chank_size)as(
--        select grp_key,tgt, grp, start_grp, end_grp, start_grp,start_pos, end_pos, elelen,:split_chank_size from rec
--        union all
--        select s1.grp_key,s1.tgt, s1.grp, s1.start_grp, s1.end_grp, s1.subgrp+1,s1.start_pos, s1.end_pos, s1.elelen,s1.split_chank_size
--        from recc s1
--            ,rec s2--ORA-32036: 問合せ名をWITH句にインラインする場合はサポートされないケースです ORA-06512:
----            ,table(rsv_args) s2
--        where s1.grp_key=s2.grp_key and s1.grp=s2.grp and s1.subgrp+1<=s1.end_grp
--    )
    select * from recc order by grp_key,grp,subgrp;
    select
        cast(collect(rt_map(grp, start_grp, end_grp, subgrp, start_pos, end_pos, elelen, chanklen, seq, start_chankpos, end_chankpos, chank)) as rt_map_liz)
    from(
        select
            grp_key,tgt,grp, start_grp, end_grp, subgrp, start_pos, end_pos, elelen, least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))) as chanklen
            ,row_number()over(order by grp_key,grp,subgrp) as seq
            ,case
                when 1=start_pos and 1=subgrp then 1
                when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))+1
                when 1<>start_pos and 1=subgrp then start_pos
                when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))
            end as start_chankpos
            ,least(case
                when 1=start_pos and 1=subgrp then least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key)))
                when 1=start_pos and 1<>subgrp then subgrp*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key)))
                when 1<>start_pos and 1=subgrp then start_pos+least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key)))-1
                when 1<>start_pos and 1<>subgrp then start_pos+subgrp*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key)))-1
            end,end_pos) as end_chankpos
            ,case
                when 0=instr(dbms_lob.substr(
                            tgt
                            ,least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key)))
                            ,case
                                when 1=start_pos and 1=subgrp then 1
                                when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))+1
                                when 1<>start_pos and 1=subgrp then start_pos
                                when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))
                            end
                        ),',') then dbms_lob.substr(
                                        tgt
                                        ,least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key)))
                                        ,case
                                            when 1=start_pos and 1=subgrp then 1
                                            when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))+1
                                            when 1<>start_pos and 1=subgrp then start_pos
                                            when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))
                                        end
                                    )
                else substr(dbms_lob.substr(
                                tgt
                                ,least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key)))
                                ,case
                                    when 1=start_pos and 1=subgrp then 1
                                    when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))+1
                                    when 1<>start_pos and 1=subgrp then start_pos
                                    when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))
                                end
                            )
                            ,1
                            ,instr(dbms_lob.substr(
                                    tgt
                                    ,least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key)))
                                    ,case
                                        when 1=start_pos and 1=subgrp then 1
                                        when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))+1
                                        when 1<>start_pos and 1=subgrp then start_pos
                                        when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(elelen,greatest(:split_chank_size,max(elelen)over(partition by grp_key))))
                                    end
                            ),',')-1
                            )
            end as chank
        from recc
        order by grp_key,grp, subgrp
        );