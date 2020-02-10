drop table emoji purge;
create table emoji (
    emo varchar2(4000 char)
);
set define off;
insert into emoji (emo) values ( '🐭,🐮,🐱,🐵,🐿,👀,👆,👇,👈,👉,👊' );
commit;

create or replace type liz_dec4utf8 is table of varchar2(4000);
/

create or replace function split_dec4utf8(rsv_args varchar2)
return liz_dec4utf8
as
rt liz_dec4utf8;
begin
    select
        cast(collect(substr(rsv_args,decode(level-1,0,0,instr(rsv_args,',',1,level-1))+1,decode(instr(rsv_args,',',1,level),0,4000,instr(rsv_args,',',1,level))-decode(level-1,0,0,instr(rsv_args,',',1,level-1))-1)) as liz_dec4utf8)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
    return rt;
end;
/

create or replace function dec4utf8(tgt varchar2)
return varchar2
as
rt varchar2(4000);
begin
    select
        utl_raw.cast_to_varchar2(hextoraw(tgt))
        into rt
    from dual;
    return rt;
end;
/

--select enc2utf8('a,b,c,d') as rt from dual;
--select dec4utf8('61626364') as rt from dual;
--select dec4utf8(enc2utf8('a,b,c,d')) as rt from dual;
--
--select enc2utf8('あ,い,う,え,お') as rt from dual;
--select dec4utf8('e38182e38184e38186e38188e3818a') as rt from dual;
--select dec4utf8(enc2utf8('あ,い,う,え,お')) as rt from dual;
--
--select enc2utf8((select emo from emoji)) as rt from dual;
--select dec4utf8('f09f90adf09f90aef09f90b1f09f90b5f09f90bff09f9180f09f9186f09f9187f09f9188f09f9189f09f918a') as rt from dual;
--select dec4utf8(enc2utf8((select emo from emoji))) as rt from dual;