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
    select
        ceil(level/3) as grp_key
        , row_number()over(partition by ceil(level/3) order by level) as grpseq
        , dbms_random.string('X',trunc(dbms_random.value(3,10))) as str
    from dual
    connect by level<=5
)select
    grp_key
    ,to_clob(listagg(str, ',') within group (order by grpseq)) as tgt
from sub
group by grp_key;

create or replace function split_clob(tgt clob,split_chank_size number)
return rt_map_liz
as
rt rt_map_liz;
begin
    with rec(tgt,grp,start_grp,end_grp,start_pos,end_pos,elelen,chanklen) as (
        select
            tgt
            ,1
            ,1
            ,ceil((nvl(nullif(dbms_lob.instr(tgt,',',1,1),0),dbms_lob.getlength(tgt)+1)-(nvl(dbms_lob.instr(tgt,',',1,0),0)+1))/split_chank_size)
            ,nvl(dbms_lob.instr(tgt,',',1,0),0)+1
            ,nvl(nullif(dbms_lob.instr(tgt,',',1,1),0)-1,dbms_lob.getlength(tgt))
            ,nvl(nullif(dbms_lob.instr(tgt,',',1,1),0),dbms_lob.getlength(tgt)+1)-(nvl(dbms_lob.instr(tgt,',',1,0),0)+1)
            ,split_chank_size
        from (select tgt from dual)
        union all
        select
            s1.tgt
            ,s1.grp+1
            ,s1.start_grp
            ,s1.end_grp
            ,nvl(dbms_lob.instr(s1.tgt,',',1,s1.grp),0)+1
            ,nvl(nullif(dbms_lob.instr(s1.tgt,',',1,s1.grp+1),0)-1,dbms_lob.getlength(s1.tgt))
            ,nvl(nullif(dbms_lob.instr(s1.tgt,',',1,s1.grp+1),0),dbms_lob.getlength(s1.tgt)+1)-(nvl(dbms_lob.instr(s1.tgt,',',1,s1.grp),0)+1)
            ,s1.chanklen
        from rec s1,(select tgt from dual) s2
        where s1.grp+1 <=dbms_lob.getlength(s1.tgt)-dbms_lob.getlength(replace(s1.tgt,',',''))+1
    ),recc(tgt,grp,start_grp,end_grp,subgrp,start_pos,end_pos,elelen,chanklen)as(
        select tgt, grp, start_grp, end_grp, start_grp,start_pos, end_pos, elelen,chanklen from rec
        union all
        select s1.tgt, s1.grp, s1.start_grp, s1.end_grp, s1.subgrp+1,s1.start_pos, s1.end_pos, s1.elelen,s1.chanklen
        from recc s1,rec s2
        where s1.grp=s2.grp and s1.subgrp+1<=s1.end_grp
    )
    select
        cast(collect(rt_map(grp, start_grp, end_grp, subgrp, start_pos, end_pos, elelen, chanklen, seq, start_chankpos, end_chankpos, chank)) as rt_map_liz)
        into rt
    from(
        select
            grp, start_grp, end_grp, subgrp, start_pos, end_pos, elelen, chanklen
            ,row_number()over(order by grp,subgrp) as seq
            ,case
                when 1=start_pos and 1=subgrp then 1
                when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(chanklen,elelen))+1
                when 1<>start_pos and 1=subgrp then start_pos
                when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(chanklen,elelen))
            end as start_chankpos
            ,least(case
                when 1=start_pos and 1=subgrp then least(chanklen,elelen)
                when 1=start_pos and 1<>subgrp then subgrp*least(chanklen,elelen)
                when 1<>start_pos and 1=subgrp then start_pos+least(chanklen,elelen)-1
                when 1<>start_pos and 1<>subgrp then start_pos+subgrp*least(chanklen,elelen)-1
            end,end_pos) as end_chankpos
            ,case
                when 0=instr(dbms_lob.substr(
                            tgt
                            ,least(chanklen,elelen)
                            ,case
                                when 1=start_pos and 1=subgrp then 1
                                when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(chanklen,elelen))+1
                                when 1<>start_pos and 1=subgrp then start_pos
                                when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(chanklen,elelen))
                            end
                        ),',') then dbms_lob.substr(
                                        tgt
                                        ,least(chanklen,elelen)
                                        ,case
                                            when 1=start_pos and 1=subgrp then 1
                                            when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(chanklen,elelen))+1
                                            when 1<>start_pos and 1=subgrp then start_pos
                                            when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(chanklen,elelen))
                                        end
                                    )
                else substr(dbms_lob.substr(
                                tgt
                                ,least(chanklen,elelen)
                                ,case
                                    when 1=start_pos and 1=subgrp then 1
                                    when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(chanklen,elelen))+1
                                    when 1<>start_pos and 1=subgrp then start_pos
                                    when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(chanklen,elelen))
                                end
                            )
                            ,1
                            ,instr(dbms_lob.substr(
                                    tgt
                                    ,least(chanklen,elelen)
                                    ,case
                                        when 1=start_pos and 1=subgrp then 1
                                        when 1=start_pos and 1<>subgrp then ((subgrp-1)*least(chanklen,elelen))+1
                                        when 1<>start_pos and 1=subgrp then start_pos
                                        when 1<>start_pos and 1<>subgrp then start_pos+((subgrp-1)*least(chanklen,elelen))
                                    end
                            ),',')-1
                            )
            end as chank
        from recc
        order by grp, subgrp
        );
        return rt;
end;
/

select * from (select * from test_tbl where grp_key=1)s1,table(split_clob(s1.tgt,23)) s2 order by s2.grp,s2.subgrp;