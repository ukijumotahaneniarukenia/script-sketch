select level as rn,level * 5 as qty from dual connect by level <= 5;

create or replace type liz_typ is object (id number,qty number);

create or replace type liz_multi is table of liz_typ;

with sub as( select level as id,level * 5 as qty from dual connect by level <= 5 )select cast(collect(liz_typ(id,qty)) as liz_multi) as liz from sub; with sub as( select level as id,level * 5 as qty from dual connect by level <= 5 ),coll as( select cast(collect(liz_typ(id,qty)) as liz_multi) as liz from sub )select * from table(select liz from coll);
