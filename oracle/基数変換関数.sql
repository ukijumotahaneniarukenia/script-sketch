create or replace function dec2bin (i_dec number)
return varchar2
as
o_bin varchar2(32);
begin
    with sub as(
        select
            to_char(sign(bitand(i_dec, power(2, 32 - 1))))|| to_char(sign(bitand(i_dec, power(2, 31 - 1))))|| to_char(sign(bitand(i_dec, power(2, 30 - 1))))|| to_char(sign(bitand(i_dec, power(2, 29 - 1))))|| to_char(sign(bitand(i_dec, power(2, 28 - 1))))|| to_char(sign(bitand(i_dec, power(2, 27 - 1))))|| to_char(sign(bitand(i_dec, power(2, 26 - 1))))|| to_char(sign(bitand(i_dec, power(2, 25 - 1))))
            || to_char(sign(bitand(i_dec, power(2, 24 - 1))))|| to_char(sign(bitand(i_dec, power(2, 23 - 1))))|| to_char(sign(bitand(i_dec, power(2, 22 - 1))))|| to_char(sign(bitand(i_dec, power(2, 21 - 1))))|| to_char(sign(bitand(i_dec, power(2, 20 - 1))))|| to_char(sign(bitand(i_dec, power(2, 19 - 1))))|| to_char(sign(bitand(i_dec, power(2, 18 - 1))))|| to_char(sign(bitand(i_dec, power(2, 17 - 1))))
            || to_char(sign(bitand(i_dec, power(2, 16 - 1))))|| to_char(sign(bitand(i_dec, power(2, 15 - 1))))|| to_char(sign(bitand(i_dec, power(2, 14 - 1))))|| to_char(sign(bitand(i_dec, power(2, 13 - 1))))|| to_char(sign(bitand(i_dec, power(2, 12 - 1))))|| to_char(sign(bitand(i_dec, power(2, 11 - 1))))|| to_char(sign(bitand(i_dec, power(2, 10 - 1))))|| to_char(sign(bitand(i_dec, power(2, 9 - 1))))
            || to_char(sign(bitand(i_dec, power(2, 8 - 1))))|| to_char(sign(bitand(i_dec, power(2, 7 - 1))))|| to_char(sign(bitand(i_dec, power(2, 6 - 1))))|| to_char(sign(bitand(i_dec, power(2, 5 - 1))))|| to_char(sign(bitand(i_dec, power(2, 4 - 1))))|| to_char(sign(bitand(i_dec, power(2, 3 - 1))))|| to_char(sign(bitand(i_dec, power(2, 2 - 1))))|| to_char(sign(bitand(i_dec, power(2, 1 - 1))))as all_bin
        from dual
    )select
        case
            when all_bin = '00000000000000000000000000000000' then '0'
            else regexp_replace(all_bin,'([^1]+)(.+)','\2')
        end
    into o_bin
    from sub;
    return o_bin;
end;
/

--seq 32  | xargs -I@ printf "when mymap.digit=%s then mymap.bit%s\n" @ | xargs
create or replace function bin2dec(tgt varchar2)
return number
as
rt number;
i_bin32 varchar2(1):=0;i_bin31 varchar2(1):=0;i_bin30 varchar2(1):=0;i_bin29 varchar2(1):=0;i_bin28 varchar2(1):=0;i_bin27 varchar2(1):=0;i_bin26 varchar2(1):=0;i_bin25 varchar2(1):=0;
i_bin24 varchar2(1):=0;i_bin23 varchar2(1):=0;i_bin22 varchar2(1):=0;i_bin21 varchar2(1):=0;i_bin20 varchar2(1):=0;i_bin19 varchar2(1):=0;i_bin18 varchar2(1):=0;i_bin17 varchar2(1):=0;
i_bin16 varchar2(1):=0;i_bin15 varchar2(1):=0;i_bin14 varchar2(1):=0;i_bin13 varchar2(1):=0;i_bin12 varchar2(1):=0;i_bin11 varchar2(1):=0;i_bin10 varchar2(1):=0;i_bin9 varchar2(1):=0;
i_bin8 varchar2(1):=0;i_bin7 varchar2(1):=0;i_bin6 varchar2(1):=0;i_bin5 varchar2(1):=0;i_bin4 varchar2(1):=0;i_bin3 varchar2(1):=0;i_bin2 varchar2(1):=0;i_bin1 varchar2(1):=0;
begin
    with sub as(
    select
        level as digit
        ,nvl(substr(lpad(tgt,32,0),level,1),0) as bit
    from dual
    connect by level<=32
    )select
        cast(digit32 as number),cast(digit31 as number),cast(digit30 as number),cast(digit29 as number),cast(digit28 as number),cast(digit27 as number),cast(digit26 as number),cast(digit25 as number)
        ,cast(digit24 as number),cast(digit23 as number),cast(digit22 as number),cast(digit21 as number),cast(digit20 as number),cast(digit19 as number),cast(digit18 as number),cast(digit17 as number)
        ,cast(digit16 as number),cast(digit15 as number),cast(digit14 as number),cast(digit13 as number),cast(digit12 as number),cast(digit11 as number),cast(digit10 as number),cast(digit9 as number)
        ,cast(digit8 as number),cast(digit7 as number),cast(digit6 as number),cast(digit5 as number),cast(digit4 as number),cast(digit3 as number),cast(digit2 as number),cast(digit1 as number)
    into
        i_bin32,i_bin31,i_bin30,i_bin29,i_bin28,i_bin27,i_bin26,i_bin25
        ,i_bin24,i_bin23,i_bin22,i_bin21,i_bin20,i_bin19,i_bin18,i_bin17
        ,i_bin16,i_bin15,i_bin14,i_bin13,i_bin12,i_bin11,i_bin10,i_bin9
        ,i_bin8,i_bin7,i_bin6,i_bin5,i_bin4,i_bin3,i_bin2,i_bin1
    from sub pivot(max(bit) for digit in (
        1 as digit32,2 as digit31,3 as digit30,4 as digit29,5 as digit28,6 as digit27,7 as digit26,8 as digit25
        ,9 as digit24,10 as digit23,11 as digit22,12 as digit21,13 as digit20,14 as digit19,15 as digit18,16 as digit17
        ,17 as digit16,18 as digit15,19 as digit14,20 as digit13,21 as digit12,22 as digit11,23 as digit10,24 as digit9
        ,25 as digit8,26 as digit7,27 as digit6,28 as digit5,29 as digit4,30 as digit3,31 as digit2,32 as digit1
    ));
    select bin_to_num(
            i_bin32,i_bin31,i_bin30,i_bin29,i_bin28,i_bin27,i_bin26,i_bin25
            ,i_bin24,i_bin23,i_bin22,i_bin21,i_bin20,i_bin19,i_bin18,i_bin17
            ,i_bin16,i_bin15,i_bin14,i_bin13,i_bin12,i_bin11,i_bin10,i_bin9
            ,i_bin8,i_bin7,i_bin6,i_bin5,i_bin4,i_bin3,i_bin2,i_bin1
    )into rt from dual;
    return rt;
end;
/

create or replace function dec2hex(i_dec number)
return varchar2
as
o_hex varchar2(4000);
begin
    select to_char(i_dec,'FMXXXXXX') into o_hex from dual;
    return o_hex;
end;
/
create or replace function hex2dec(i_hex varchar2)
return number
as
o_dec number;
begin
    select utl_raw.cast_to_binary_integer(hextoraw(i_hex))
    into o_dec
    from dual;
    return o_dec;
end;
/

--seq 40 | xargs -I@ dc -e'10i@dpd2opd8opd16op' | xargs -n 4 | keta

select
    level-1 as dec
    ,dec2bin(level-1) as bin
    ,bin2dec(dec2bin(level-1))  as dec_done
    ,dec2hex(level-1) as hex
    ,hex2dec(dec2hex(level-1)) as dec_done2
    ,case when level-1=bin2dec(dec2bin(level-1)) then 0 else 1 end as diff_flg
    ,case when level-1=hex2dec(dec2hex(level-1)) then 0 else 1 end as diff_flg2
from dual
connect by level<=40+1;

create or replace type liz_dec2oct is table of varchar2(4000);
/

select
    idx, n, base, remain, quotient, rt, pool
from dual
model
dimension by(1 as idx)
measures(:tgt as n,:base as base,mod(:tgt,:base) as remain,trunc(:tgt/:base) as quotient,cast(null as varchar2(4000)) as rt,'0123456789ABCDEF' as pool)
rules iterate(4294967295) until(n[iteration_number+2]=0)(
    rt[iteration_number+2]=substr(pool[1],mod(n[iteration_number+1],:base)+1,1)||rt[iteration_number+1]
    ,remain[iteration_number+2]=mod(n[iteration_number+1],:base)
    ,pool[iteration_number+2]=pool[1]
    ,base[iteration_number+2]=base[1]
    ,quotient[iteration_number+2]=trunc(n[iteration_number+1]/:base)
    ,n[iteration_number+2]=trunc(n[iteration_number+1]/:base)
);

with sub as(
    select
        idx, n, base, remain, quotient, rt, pool
    from dual
    model
    dimension by(1 as idx)
    measures(:tgt as n,:base as base,mod(:tgt,:base) as remain,trunc(:tgt/:base) as quotient,cast(null as varchar2(4000)) as rt,'0123456789ABCDEF' as pool)
    rules iterate(4294967295) until(n[iteration_number+2]=0)(
        rt[iteration_number+2]=substr(pool[1],mod(n[iteration_number+1],:base)+1,1)||rt[iteration_number+1]
        ,remain[iteration_number+2]=mod(n[iteration_number+1],:base)
        ,pool[iteration_number+2]=pool[1]
        ,base[iteration_number+2]=base[1]
        ,quotient[iteration_number+2]=trunc(n[iteration_number+1]/:base)
        ,n[iteration_number+2]=trunc(n[iteration_number+1]/:base)
    )
)select s1.* from sub s1 where not exists (select 1 from sub s2 where nvl(length(s1.rt),0)<nvl(length(s2.rt),0));


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

select
    level as n
    ,base(level,2) as bin
    ,base(level,8) as oct
    ,base(level,16) as hex
    ,xxx2dec(base(level,2),2)
    ,xxx2dec(base(level,8),8)
    ,xxx2dec(base(level,16),16)
    ,base(level,7) as msg
from dual
connect by level<=40
;


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
