drop table emoji purge;
create table emoji (
    emo varchar2(4000 char)
);
set define off;
insert into emoji (emo) values ( '🐭,🐮,🐱,🐵,🐿,👀,👆,👇,👈,👉,👊' );
commit;

create or replace type liz_dec4base64 is table of varchar2(4000);
/

create or replace function split_dec4base64(rsv_args varchar2)
return liz_dec4base64
as
rt liz_dec4base64;
begin
    select
        cast(collect(substr(rsv_args,decode(level-1,0,0,instr(rsv_args,',',1,level-1))+1,decode(instr(rsv_args,',',1,level),0,4000,instr(rsv_args,',',1,level))-decode(level-1,0,0,instr(rsv_args,',',1,level-1))-1)) as liz_dec4base64)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
    return rt;
end;
/

create or replace function dec4base64(tgt varchar2)
return varchar2
as
rt varchar2(4000);
begin
    with sub as(
        select
            rownum as seq
            ,cast(utl_raw.cast_to_varchar2(
                utl_encode.base64_decode(
                  utl_raw.cast_to_raw(column_value)
                )
              ) as varchar2(4000)) as done
      from table(split_dec4base64(tgt))
    )select 
        listagg(done,',')within group (order by seq)
        into rt
    from sub;
    return rt;
end;
/

select enc2base64('a,b,c,d') as rt from dual;
select dec4base64('YQ==,Yg==,Yw==,ZA==') as rt from dual;
select dec4base64(enc2base64('a,b,c,d')) as rt from dual;
--echo YQ==,Yg==,Yw==,ZA== | tr ',' '\n' | printf '%s\n' $(base64 -d)

select enc2base64('あ,い,う,え,お') as rt from dual;
select dec4base64('44GC,44GE,44GG,44GI,44GK') as rt from dual;
select dec4base64(enc2base64('あ,い,う,え,お')) as rt from dual;
--echo 44GC,44GE,44GG,44GI,44GK | tr ',' '\n' | printf '%s\n' $(base64 -d)

select enc2base64((select emo from emoji)) as rt from dual;
select dec4base64('8J+QrQ==,8J+Qrg==,8J+QsQ==,8J+QtQ==,8J+Qvw==,8J+RgA==,8J+Rhg==,8J+Rhw==,8J+RiA==,8J+RiQ==,8J+Rig==') as rt from dual;
select dec4base64(enc2base64((select emo from emoji))) as rt from dual;
--echo 8J+QrQ==,8J+Qrg==,8J+QsQ==,8J+QtQ==,8J+Qvw==,8J+RgA==,8J+Rhg==,8J+Rhw==,8J+RiA==,8J+RiQ==,8J+Rig== | tr ',' '\n' | printf '%s\n' $(base64 -d)