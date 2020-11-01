select level as rn from dual connect by level <= 5;


create or replace type liz_single as table of number;


with sub as( select level as rn from dual connect by level <= 5 )select cast(collect(rn) as liz_single) as liz from sub; with sub as( select level as rn from dual connect by level <= 5 ),coll as( select cast(collect(rn) as liz_single) as liz from sub )select * from table(select liz from coll);
