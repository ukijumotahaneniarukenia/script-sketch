create or replace type rt_map is object (grpseq_key number,chank varchar2(4000));
/

create or replace type rt_map_liz is table of rt_map;
/

create or replace function fixstrsplit(tgt clob,len number)
return rt_map_liz
as
rt rt_map_liz;
begin
    with rec(rn,tgt,chank,start_pos,len) as(
        select 1,tgt as tgt,dbms_lob.substr(tgt,len,1),1,len from (select tgt from dual)
        union all
        select s1.rn+1,s1.tgt,dbms_lob.substr(s1.tgt,s1.len,s1.len+s1.start_pos),s1.len+s1.start_pos,s1.len from rec s1, (select tgt from dual) s2
        where dbms_lob.substr(s1.tgt,s1.len,s1.len+s1.start_pos) is not null
    )select cast(collect(rt_map(rn,chank)) as rt_map_liz) into rt from rec;
    return rt;
end;
/

with sub as(
    select dbms_random.STRING('X',TRUNC(dbms_random.value(4000,4001))) as tgt from dual
),subb as(
    select
        replace(rtrim(xmlagg(xmlelement(e,tgt,',').extract('//text()')).getclobval(),','),',','') as tgt
    from sub
    connect by level<=4
)select length(s1.tgt),length(s2.chank),sum(length(s2.chank))over(order by s2.grpseq_key) from subb s1,table(fixstrsplit(s1.tgt,3000)) s2;