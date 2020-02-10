drop table emoji purge;
create table emoji (
    emo varchar2(4000 char)
);
set define off;
insert into emoji (emo) values ( '🐭,🐮,🐱,🐵,🐿,👀,👆,👇,👈,👉,👊' );
commit;

create or replace type liz_dec4utf16 is table of varchar2(4000);
/

create or replace function split_dec4utf16(rsv_args varchar2)
return liz_dec4utf16
as
rt liz_dec4utf16;
begin
    select
        cast(collect(substr(rsv_args,decode(level-1,0,0,instr(rsv_args,',',1,level-1))+1,decode(instr(rsv_args,',',1,level),0,4000,instr(rsv_args,',',1,level))-decode(level-1,0,0,instr(rsv_args,',',1,level-1))-1)) as liz_dec4utf16)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
    return rt;
end;
/

create or replace function dec4utf16(tgt varchar2)
return varchar2
as
rt varchar2(4000);
begin
    with sub as(
        select
            rownum as seq
            ,unistr(column_value) as done--option factoring
        from table(split_dec4utf16(tgt))
    )select 
        listagg(done,',')within group (order by seq)
        into rt
    from sub;
    return rt;
end;
/

select enc2utf16('a,b,c,d')as rt from dual;
select dec4utf16('\0061,\0062,\0063,\0064') as rt from dual;
select dec4utf16(enc2utf16('a,b,c,d')) as rt from dual;

select enc2utf16('あ,い,う,え,お')as rt from dual;
select dec4utf16('\3042,\3044,\3046,\3048,\304a') as rt from dual;
select dec4utf16(enc2utf16('あ,い,う,え,お')) as rt from dual;

select enc2utf16((select emo from emoji))as rt from dual;
select dec4utf16('\d83d\dc2d,\d83d\dc2e,\d83d\dc31,\d83d\dc35,\d83d\dc3f,\d83d\dc40,\d83d\dc46,\d83d\dc47,\d83d\dc48,\d83d\dc49,\d83d\dc4a') as rt from dual;
select dec4utf16(enc2utf16((select emo from emoji))) as rt from dual;
