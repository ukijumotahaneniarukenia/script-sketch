create or replace type liz_enc2utf8 is table of varchar2(4000);
/

create or replace function split_enc2utf8(rsv_args varchar2)
return liz_enc2utf8
as
rt liz_enc2utf8;
begin
    select
        cast(collect(substr(rsv_args,decode(level-1,0,0,instr(rsv_args,',',1,level-1))+1,decode(instr(rsv_args,',',1,level),0,4000,instr(rsv_args,',',1,level))-decode(level-1,0,0,instr(rsv_args,',',1,level-1))-1)) as liz_enc2utf8)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
    return rt;
end;
/

create or replace type rt_grp_enc2utf8 is object(grp number,gram varchar2(4000),utf8 varchar2(4000));
/

create or replace type rt_grp_liz_enc2utf8 is table of rt_grp_enc2utf8;
/

create or replace function enc2utf8_tbl(tgt varchar2)
return rt_grp_liz_enc2utf8
as
rt rt_grp_liz_enc2utf8;
begin
    with sub as(
        select
            rownum as grp
            ,column_value as gram
            ,replace(regexp_substr(dump(convert(column_value,'AL32UTF8'),1016),':.*'),': ','') as utf8
        from table(split_enc2utf8(tgt))
    )select
        cast(collect(rt_grp_enc2utf8(grp,gram,utf8)) as rt_grp_liz_enc2utf8)
        into rt
    from sub;
    return rt;
end;
/

create or replace function base(i_dec number,baze number)
return varchar2
as
rt varchar2(4000);
begin
    with sub as(
        select
            idx, n, baze, modulo, quotient, rez, pool
        from dual
        model
        dimension by(1 as idx)
        measures(i_dec as n,mod(i_dec,baze) as modulo,trunc(i_dec/baze) as quotient,cast(null as varchar2(4000)) as rez,'0123456789ABCDEF' as pool)
        rules iterate(4294967295) until(n[iteration_number+2]=0)(
            rez[iteration_number+2]=substr(pool[1],mod(n[iteration_number+1],baze)+1,1)||rez[iteration_number+1]
            ,modulo[iteration_number+2]=mod(n[iteration_number+1],baze)
            ,pool[iteration_number+2]=pool[1]
            ,quotient[iteration_number+2]=trunc(n[iteration_number+1]/baze)
            ,n[iteration_number+2]=trunc(n[iteration_number+1]/baze)
        )
    )select case when s1.baze not in (2,8,16) then 'you input '||s1.baze||'.'||'please enter 2,8,16.' else s1.rez end
        into rt
    from sub s1 where not exists (select 1 from sub s2 where nvl(length(s1.rez),0)<nvl(length(s2.rez),0));
    return rt;
end;
/

create or replace function xxx2dec(tgt varchar2,baze number)
return number
as
rt number;
begin
    with sub as(
        select
            tgt as tgt
            ,level as digit
            ,substr(tgt,level,1) as gram
            ,instr('0123456789ABCDEF',upper(substr(tgt,level,1)),1)-1 as pos
            ,decode(level,1,max(level)over(),max(level)over()-(level-1))-1 as wgt
            ,case
                when length(tgt)=1 then  instr('0123456789ABCDEF',substr(tgt,level,1),1)-1
                else power(baze,decode(level,1,max(level)over(),max(level)over()-(level-1))-1)*(instr('0123456789ABCDEF',upper(substr(tgt,level,1)),1)-1)
            end as done
            ,'0123456789ABCDEF' as pool
        from dual
        connect by level<=length(tgt)
    )select sum(done) into rt from sub;
    return rt;
end;
/

create or replace type rt_grp_str2unicode is object(grp number,gram varchar2(4000),unicode varchar2(4000));
/

create or replace type rt_grp_liz_str2unicode is table of rt_grp_str2unicode;
/

create or replace function str2unicode(tgt varchar2)
return rt_grp_liz_str2unicode
as
rt rt_grp_liz_str2unicode;
begin
    with sub as(
    select
        s1.grp
        ,s1.gram
        ,case
            when xxx2dec(s2.column_value,16) between 0 and 127 then 'U+'||lpad(s1.utf8,6,0)
            else 'U+'||lpad(base(xxx2dec(listagg(substr(base(xxx2dec(s2.column_value,16),2),length(regexp_substr(base(xxx2dec(s2.column_value,16),2), '^1*0'))+1))within group(order by rownum)over(partition by grp),2),16),6,0)
        end as unicode
    from
        table(enc2utf8_tbl(tgt)) s1
        ,table(split_enc2utf8(s1.utf8)) s2
    )select
        cast(collect(rt_grp_str2unicode(grp, gram, unicode)) as rt_grp_liz_str2unicode)
        into rt
    from (select grp, gram, unicode from sub group by grp, gram, unicode);
    return rt;
end;
/

create or replace type rt_grp_str2unicode_hex is object(grp number,gram varchar2(4000),unicode_hex varchar2(4000));
/

create or replace type rt_grp_liz_str2unicode_hex is table of rt_grp_str2unicode_hex;
/

create or replace function str2unicode_hex(tgt varchar2)
return rt_grp_liz_str2unicode_hex
as
rt rt_grp_liz_str2unicode_hex;
begin
    with sub as(
    select
        s1.grp
        ,s1.gram
        ,case
            when xxx2dec(s2.column_value,16) between 0 and 127 then s1.utf8
            else base(xxx2dec(listagg(substr(base(xxx2dec(s2.column_value,16),2),length(regexp_substr(base(xxx2dec(s2.column_value,16),2), '^1*0'))+1))within group(order by rownum)over(partition by grp),2),16)
        end as unicode_hex
    from
        table(enc2utf8_tbl(tgt)) s1
        ,table(split_enc2utf8(s1.utf8)) s2
    )select
        cast(collect(rt_grp_str2unicode_hex(grp, gram, unicode_hex)) as rt_grp_liz_str2unicode_hex)
        into rt
    from (select grp, gram, unicode_hex from sub group by grp, gram, unicode_hex);
    return rt;
end;
/

create or replace type rt_grp_str2unicode_dec is object(grp number,gram varchar2(4000),unicode_dec number);
/

create or replace type rt_grp_liz_str2unicode_dec is table of rt_grp_str2unicode_dec;
/

create or replace function str2unicode_dec(tgt varchar2)
return rt_grp_liz_str2unicode_dec
as
rt rt_grp_liz_str2unicode_dec;
begin
    with sub as(
    select
        s1.grp
        ,s1.gram
        ,case
            when xxx2dec(s2.column_value,16) between 0 and 127 then xxx2dec(s2.column_value,16)
            else xxx2dec(listagg(substr(base(xxx2dec(s2.column_value,16),2),length(regexp_substr(base(xxx2dec(s2.column_value,16),2), '^1*0'))+1))within group(order by rownum)over(partition by grp),2)
        end as unicode_dec
    from
        table(enc2utf8_tbl(tgt)) s1
        ,table(split_enc2utf8(s1.utf8)) s2
    )select
        cast(collect(rt_grp_str2unicode_dec(grp, gram, unicode_dec)) as rt_grp_liz_str2unicode_dec)
        into rt
    from (select grp, gram, unicode_dec from sub group by grp, gram, unicode_dec);
    return rt;
end;
/

create or replace type rt_grp_str2unicode_bin is object(grp number,gram varchar2(4000),unicode_bin varchar2(4000));
/

create or replace type rt_grp_liz_str2unicode_bin is table of rt_grp_str2unicode_bin;
/

create or replace function str2unicode_bin(tgt varchar2)
return rt_grp_liz_str2unicode_bin
as
rt rt_grp_liz_str2unicode_bin;
begin
    with sub as(
    select
        s1.grp
        ,s1.gram
        ,case
            when xxx2dec(s2.column_value,16) between 0 and 127 then base(xxx2dec(s2.column_value,16),2)
            else base(xxx2dec(listagg(substr(base(xxx2dec(s2.column_value,16),2),length(regexp_substr(base(xxx2dec(s2.column_value,16),2), '^1*0'))+1))within group(order by rownum)over(partition by grp),2),2)
        end as unicode_dec
    from
        table(enc2utf8_tbl(tgt)) s1
        ,table(split_enc2utf8(s1.utf8)) s2
    )select
        cast(collect(rt_grp_str2unicode_bin(grp, gram, unicode_dec)) as rt_grp_liz_str2unicode_bin)
        into rt
    from (select grp, gram, unicode_dec from sub group by grp, gram, unicode_dec);
    return rt;
end;
/

select * from table(str2unicode(:tgt)) order by grp;
select * from table(str2unicode_hex(:tgt)) order by grp;
select * from table(str2unicode_dec(:tgt)) order by grp;
select * from table(str2unicode_bin(:tgt)) order by grp;