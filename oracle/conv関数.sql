create or replace type liz_conv is table of varchar2(4000);
/

create or replace function conv(tgt varchar2,n number)
return liz_conv
as
rt liz_conv;
begin
    select
        cast(collect(substr(tgt,level,n)) as liz_conv) into rt
    from dual
    connect by level<=length(tgt);
    return rt;
end;
/

select column_value from table(conv('abcba',null));
select column_value from table(conv('abcba',-1));

select column_value from table(conv('abcba',0));
select column_value from table(conv('abcba',1));
select column_value from table(conv('abcba',2));
select column_value from table(conv('abcba',3));
select column_value from table(conv('abcba',4));
select column_value from table(conv('abcba',5));
select column_value from table(conv('abcba',6));
select column_value from table(conv('🐭,🐮,🐱,🐵,',1));