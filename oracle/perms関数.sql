create or replace type liz_perms is table of varchar2(4000);
/

create or replace type rt_grp_perms is object(grp number,rt liz_perms,remain liz_perms);
/

create or replace type rt_grp_liz_perms is table of rt_grp_perms;
/

create or replace function del_ele_perms(tgt_ele varchar2,rsv_args liz_perms)
return liz_perms
as
rt liz_perms;
begin
    select
        case
            when trim(tgt_ele) is not null and exists(select 1 from table(rsv_args) where column_value = tgt_ele) then (select cast(collect(column_value)as liz_perms) from table(rsv_args) where column_value <> tgt_ele)
            else rsv_args
        end
    into rt
    from dual;
    return rt;
end;
/

create or replace function split_perms(rsv_args varchar2)
return liz_perms
as
rt liz_perms;
begin
    select
        cast(collect(substr(rsv_args,decode(level-1,0,0,instr(rsv_args,',',1,level-1))+1,decode(instr(rsv_args,',',1,level),0,4000,instr(rsv_args,',',1,level))-decode(level-1,0,0,instr(rsv_args,',',1,level-1))-1)) as liz_perms)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
    return rt;
end;
/

create or replace function strliz_perms(rsv_args liz_perms)
return varchar2
as
rt varchar2(4000);
begin
    select listagg(column_value,',')within group(order by rownum) into rt from table(rsv_args);
    return rt;
end;
/

create or replace function perm (tgt rt_grp_liz_perms,n number)
return rt_grp_liz_perms
as
rt rt_grp_liz_perms :=tgt;
begin
    select
        case
            when n = 0 then rt_grp_liz_perms(rt_grp_perms(null,null,null))
            else rt multiset union all perm(rtliz,n-1)
        end
    into rt
    from(
        select 
            cast(collect(rt_grp_perms(grp,rt,remain)) as rt_grp_liz_perms) as rtliz 
        from (
            select
                grp+1 as grp
                ,rt multiset union all liz_perms(column_value) as rt
                ,del_ele_perms(column_value,remain) as remain
            from
                table(tgt),table(remain)
            )
        );
    return rt;
end;
/

create or replace function perms(tgt varchar2,n number)
return liz_perms
as
rt liz_perms;
begin
    select cast(collect(strliz_perms(rt)) as liz_perms) into rt from table(perm(rt_grp_liz_perms(rt_grp_perms(0,liz_perms(''),split_perms(tgt))),n+1)) where grp=n;
    return rt;
end;
/

select * from table(perm(rt_grp_liz_perms(rt_grp_perms(0,liz_perms(''),split_perms('a,b,c,d'))),:n+1)) where grp=:n;

select grp,strliz_perms(rt) as rt,strliz_perms(remain) as remain from table(perm(rt_grp_liz_perms(rt_grp_perms(0,liz_perms(''),split_perms('a,b,c,d'))),:n+1)) where grp=:n;

select * from table(perms('a,b,c,d',1));