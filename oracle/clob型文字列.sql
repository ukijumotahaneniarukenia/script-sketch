create or replace type item_clob is object(item clob);
/

create or replace type item_clob_liz is table of item_clob;
/

create or replace type args_map is object (sort_key number,val item_clob_liz);
/

create or replace type args_map_liz is table of args_map;
/

with sub as(
    select cast(collect(args_map(level,item_clob_liz(item_clob(chr(level+96))))) as args_map_liz) as tgt from dual connect by level<=10
)select * from sub s1,table(tgt) s2,table(s2.val);


