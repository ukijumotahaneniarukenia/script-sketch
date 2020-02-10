create or replace type liz is table of varchar2(4000);
/

create or replace function split(rsv_args varchar2)
return liz
as
rt liz;
begin
    select
        cast(collect(substr(rsv_args,decode(level-1,0,0,instr(rsv_args,',',1,level-1))+1,decode(instr(rsv_args,',',1,level),0,4000,instr(rsv_args,',',1,level))-decode(level-1,0,0,instr(rsv_args,',',1,level-1))-1)) as liz)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
    return rt;
end;
/

create or replace function rev_split(rsv_args varchar2)
return liz
as
rt liz;
begin
    select
        cast(collect(substr(rsv_args,instr(rsv_args,',',-1,level)+1,decode(level-1,0,4000,instr(rsv_args,',',-1,level-1))-instr(rsv_args,',',-1,level)-1)) as liz)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
    return rt;
end;
/

create or replace function shift(rsv_args liz)
return varchar2
as
rt varchar2(4000);
begin
    select
        case
            when 0<(select count(*) from table(rsv_args)) then (with sub as(select rownum as seq,first_value(column_value)over(order by rownum) as ele from table(rsv_args))select ele from sub where seq=1)
            else null
        end
    into rt from dual;       
    return rt;
end;
/

create or replace function pop(rsv_args liz)
return varchar2
as
rt varchar2(4000);
begin
    select
        case
            when 0<(select count(*) from table(rsv_args)) then (with sub as(select rownum as seq,first_value(column_value)over(order by rownum desc) as ele from table(rsv_args))select ele from sub where seq=1)
            else null
        end
    into rt from dual;       
    return rt;
end;
/

create or replace function unshift(tgt_ele varchar2,rsv_args liz)
return liz
as
rt liz;
begin
    select liz(tgt_ele) multiset union all rsv_args into rt from dual;
    return rt;
end;
/

create or replace function push(tgt_ele varchar2,rsv_args liz)
return liz
as
rt liz;
begin
    select rsv_args multiset union all liz(tgt_ele) into rt from dual;
    return rt;
end;
/

create or replace function del_ele(tgt_ele varchar2,rsv_args liz)
return liz
as
rt liz;
begin
    select
        case
            when trim(tgt_ele) is not null and exists(select 1 from table(rsv_args) where column_value = tgt_ele) then (select cast(collect(column_value)as liz) from table(rsv_args) where column_value <> tgt_ele)
            else rsv_args
        end
    into rt
    from dual;
    return rt;
end;
/

create or replace function cnt(rsv_args liz)
return number
as
rt number;
begin
    select count(*) into rt from table(rsv_args);
    return rt;
end;
/

create or replace function strliz(rsv_args liz)
return varchar2
as
rt varchar2(4000);
begin
    select listagg(column_value,',')within group(order by rownum) into rt from table(rsv_args);
    return rt;
end;
/

select shift(split(' , ')) from dual;
select pop(split('')) from dual;
select unshift('zzzz',(split('a,bb,ccc,dddd'))) from dual;
select push(null,(split('a,bb,ccc,dddd'))) from dual;
select del_ele(null,split('a,bb,ccc,dddd')) from dual;
select cnt(split('')) from dual;

