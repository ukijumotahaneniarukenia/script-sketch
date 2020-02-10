drop table emoji purge;
create table emoji (
    emo varchar2(4000 char)
);
set define off;
insert into emoji (emo) values ( '🐭,🐮,🐱,🐵,🐿,👀,👆,👇,👈,👉,👊' );
commit;

create or replace type liz_enc2utf16 is table of varchar2(4000);
/

create or replace function split_enc2utf16(rsv_args varchar2)
return liz_enc2utf16
as
rt liz_enc2utf16;
begin
    select
        cast(collect(substr(rsv_args,decode(level-1,0,0,instr(rsv_args,',',1,level-1))+1,decode(instr(rsv_args,',',1,level),0,4000,instr(rsv_args,',',1,level))-decode(level-1,0,0,instr(rsv_args,',',1,level-1))-1)) as liz_enc2utf16)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
    return rt;
end;
/

create or replace function enc2utf16(tgt varchar2)
return varchar2
as
rt varchar2(4000);
begin
    with sub as(
        select
            rownum as grp
            ,column_value as tgt
            ,split_enc2utf16(replace(regexp_substr(dump(convert(column_value,'AL16UTF16'),1016),':.*'),': ','')) as liz_done
        from table(split_enc2utf16(tgt))
    ),subb as(
        select
            grp
            ,row_number()over(partition by grp order by rownum) as grpseq
            ,case when 3>row_number()over(partition by grp order by rownum) then 1 else 2 end as surrogate_grp
            ,tgt
            ,lpad(column_value,2,0) as item_done
        from
            sub,table(liz_done)
    ),subbb as(
        select
            grp,surrogate_grp,tgt
            ,listagg(item_done)within group (order by grpseq) as surrogate_pair
        from
            subb
        group by
            grp,surrogate_grp,tgt
    ),subbbb as(
        select
            grp,tgt
            ,'\'||listagg(surrogate_pair,'\')within group (order by surrogate_grp) as utf16_item_encode
        from
            subbb
        group by
            grp,tgt
    )select 
        listagg(utf16_item_encode,',')within group (order by grp) as emo_enc
        into rt
    from subbbb;
    return rt;
end;
/

select enc2utf16('a,b,c,d')as rt from dual;
select unistr('\0061,\0062,\0063,\0064') as rt from dual;
select unistr(enc2utf16('a,b,c,d')) as rt from dual;

select enc2utf16('あ,い,う,え,お')as rt from dual;
select unistr('\3042,\3044,\3046,\3048,\304a') as rt from dual;
select unistr(enc2utf16('あ,い,う,え,お')) as rt from dual;

select enc2utf16((select emo from emoji))as rt from dual;
select unistr('\d83d\dc2d,\d83d\dc2e,\d83d\dc31,\d83d\dc35,\d83d\dc3f,\d83d\dc40,\d83d\dc46,\d83d\dc47,\d83d\dc48,\d83d\dc49,\d83d\dc4a') as rt from dual;
select unistr(enc2utf16((select emo from emoji))) as rt from dual;