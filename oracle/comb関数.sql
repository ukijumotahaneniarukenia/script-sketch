drop table emoji purge;
create table emoji (
    emo varchar2(4000 char)
);
set define off;
insert into emoji ( emo ) values ( '🐭,🐮,🐱,🐵,🐿,👀,👆,👇,👈,👉,👊' );
commit;

create or replace type liz_comb is table of varchar2(4000);
/

create or replace type rt_grp_comb as object (grp number,value liz_comb);
/

create or replace type rt_grp_liz_comb is table of rt_grp_comb;
/

create or replace function split_comb(rsv_args varchar2)
return liz_comb
as
rt liz_comb;
begin
    select
        cast(collect(substr(rsv_args,decode(level-1,0,0,instr(rsv_args,',',1,level-1))+1,decode(instr(rsv_args,',',1,level),0,4000,instr(rsv_args,',',1,level))-decode(level-1,0,0,instr(rsv_args,',',1,level-1))-1)) as liz_comb)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
    return rt;
end;
/

create or replace function strliz_comb(rsv_args liz_comb)
return varchar2
as
rt varchar2(4000);
begin
    select listagg(column_value,',')within group(order by rownum) into rt from table(rsv_args);
    return rt;
end;
/

create or replace function comb(tgt varchar2,r number)
return rt_grp_liz_comb
as
rt rt_grp_liz_comb;
begin
    with sub as(
        select column_value as ele,rownum as rn from table(split_comb(tgt))
    ),rec(grp,ele,liz_comb) as(
        select 1,ele,ele from sub
        union all
        select s0.grp+1,s1.ele,s0.liz_comb||','||s1.ele from rec s0,sub s1
        where s0.ele < s1.ele
    )select cast(collect(rt_grp_comb(rownum,split_comb(s1.liz_comb))) as rt_grp_liz_comb) into rt from rec s1 where grp=r;
    return rt;
end;
/

select * from table(comb('a,b,c,d',2));

select grp,strliz_comb(value) as cmb from table(comb('a,b,c,d',2));

select grp,strliz_comb(value) from table(comb((select emo from emoji),2));