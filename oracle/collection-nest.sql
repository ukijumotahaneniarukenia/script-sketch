drop type val force;

drop type item force;

drop type liz force;

create or replace type val is object(val clob);

create or replace type item is object(rn number,vl val);

create or replace type liz is table of item;

with sub as( select mod(level,2) as rn,lpad(row_number()over(partition by mod(level,2) order by level),3,0) as str from dual connect by level <= 7 )select * from sub;


with sub as( select mod(level,2) as rn,lpad(row_number()over(partition by mod(level,2) order by level),3,0) as str from dual connect by level <= 7 )select rn,val(str) as val from sub;


with sub as( select mod(level,2) as rn,lpad(row_number()over(partition by mod(level,2) order by level),3,0) as str from dual connect by level <= 7 )select item(rn,val(str)) as item from sub;

with sub as( select mod(level,2) as rn,lpad(row_number()over(partition by mod(level,2) order by level),3,0) as str from dual connect by level <= 7 )select rn,cast(collect(item(rn,val(str))) as liz) as liz from sub group by rn;



with sub as( select mod(level,2) as rn,lpad(row_number()over(partition by mod(level,2) order by level),3,0) as str from dual connect by level <= 7 )select cast(collect(item(rn,val(str))) as liz) as liz from sub;
