create or replace type liz_unicode2utf8 is table of varchar2(4000);
/

create or replace function split_unicode2utf8(rsv_args varchar2)
return liz_unicode2utf8
as
rt liz_unicode2utf8;
begin
    select
        cast(collect(substr(rsv_args,decode(level-1,0,0,instr(rsv_args,',',1,level-1))+1,decode(instr(rsv_args,',',1,level),0,4000,instr(rsv_args,',',1,level))-decode(level-1,0,0,instr(rsv_args,',',1,level-1))-1)) as liz_unicode2utf8)
    into rt
    from
        dual
    connect by
        level <=length(rsv_args) - length(replace(rsv_args,',',''))+1;
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

--https://ja.wikipedia.org/wiki/UTF-8

--4 byte
----http://orange-factory.com/sample/utf8/code4/f090.html#LinearBSyllabary
select
    column_value
    ,'11110'||lpad(reverse(nvl(substr(reverse(base(xxx2dec(column_value,16),2)),19,3),0)),3,0)
    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),13,6)),6,0)
    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),7,6)),6,0)
    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),1,6)),6,0) as a
from
    table(split_unicode2utf8(:tgt))
;
select * from table(str2unicode_hex('𐌸')) order by grp;--F0908CB8,U+10338,&#x10338
select xxx2dec('11110000100100001000110010111000',2) from dual;
select base(xxx2dec('11110000100100001000110010111000',2),16) from dual;

--3 byte
--http://orange-factory.com/sample/utf8/code3/e0.html#Samaritan
select
    column_value
    ,'1110'||lpad(reverse(nvl(substr(reverse(base(xxx2dec(column_value,16),2)),13,4),0)),4,0)
    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),7,6)),6,0)
    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),1,6)),6,0) as a
from
    table(split_unicode2utf8(:tgt))
;
select * from table(str2unicode_hex('இ')) order by grp;--E0AE87,U+0B87,&#x0B87
select xxx2dec('111000001010111010000111',2) from dual;
select base(xxx2dec('111000001010111010000111',2),16) from dual;

--2 byte
--http://orange-factory.com/sample/utf8/code2.html
select
    column_value
    ,'110'||lpad(reverse(nvl(substr(reverse(base(xxx2dec(column_value,16),2)),7,5),0)),5,0)
    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),1,6)),6,0) as a
from
    table(split_unicode2utf8(:tgt))
;
select * from table(str2unicode_hex('®')) order by grp;--C2AE,U+00AE,&#x00AE
select xxx2dec('1100001010101110',2) from dual;
select base(xxx2dec('1100001010101110',2),16) from dual;

--1 byte
--http://orange-factory.com/sample/utf8/code2.html
select
    column_value
    ,'0'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),1,7)),7,0) as a
from
    table(split_unicode2utf8(:tgt))
;
select * from table(str2unicode_hex('A')) order by grp;--41,U+0041,&#x0041
select xxx2dec('01000001',2) from dual;
select base(xxx2dec('01000001',2),16) from dual;

create or replace type rt_grp_unicode2utf8 is object(grp number,unicode varchar2(4000),utf8 varchar2(4000));
/

create or replace type rt_grp_liz_unicode2utf8 is table of rt_grp_unicode2utf8;
/

create or replace function unicode2utf8(tgt varchar2)
return rt_grp_liz_unicode2utf8
as
rt rt_grp_liz_unicode2utf8;
begin
    with sub as(
        select
            rownum as grp
            ,column_value as tgt
            ,case
                when length(base(xxx2dec(column_value,16),2))<=7 then
                    '0'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),1,7)),7,0)
                when length(base(xxx2dec(column_value,16),2))<=11 then
                    '110'||lpad(reverse(nvl(substr(reverse(base(xxx2dec(column_value,16),2)),7,5),0)),5,0)
                    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),1,6)),6,0)
                when length(base(xxx2dec(column_value,16),2))<=16 then
                    '1110'||lpad(reverse(nvl(substr(reverse(base(xxx2dec(column_value,16),2)),13,4),0)),4,0)
                    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),7,6)),6,0)
                    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),1,6)),6,0)
                when length(base(xxx2dec(column_value,16),2))<=21 then
                    '11110'||lpad(reverse(nvl(substr(reverse(base(xxx2dec(column_value,16),2)),19,3),0)),3,0)
                    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),13,6)),6,0)
                    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),7,6)),6,0)
                    ||'10'||lpad(reverse(substr(reverse(base(xxx2dec(column_value,16),2)),1,6)),6,0)
            end as pack
        from
            table(split_unicode2utf8(tgt))
    )select
        cast(collect(rt_grp_unicode2utf8(grp,tgt,base(xxx2dec(pack,2),16))) as rt_grp_liz_unicode2utf8)
        into rt
    from sub;
    return rt;
end;
/

select * from table(unicode2utf8('41,AE,B87,10338'));