```
with recursive rec (grp,rsv_args,ele)as(
  select 1,@rsv_args,json_extract(@rsv_args,concat(concat('$[',0),']'))
  union all
  select grp+1,rsv_args,json_extract(@rsv_args,concat(concat('$[',grp),']')) from rec
  where grp+1<=json_length(@rsv_args)
)select
  s1.*
  ,json_type(s1.ele)
  ,json_object(concat('key',s1.grp),s1.ele) as done
from rec s1
;


mysql> set @rsv_args='["a", {"b": [1, 2]}, [3, 4]]';
Query OK, 0 rows affected (0.00 sec)

mysql> with recursive rec (grp,rsv_args)as(   select 1,@rsv_args   union all   select grp+1,rsv_args from rec   where grp+1<=json_length(@rsv_args) )select * from rec;
+------+------------------------------+
| grp  | rsv_args                     |
+------+------------------------------+
|    1 | ["a", {"b": [1, 2]}, [3, 4]] |
|    2 | ["a", {"b": [1, 2]}, [3, 4]] |
|    3 | ["a", {"b": [1, 2]}, [3, 4]] |
+------+------------------------------+
3 rows in set (0.00 sec)



mysql> with recursive rec (grp,rsv_args,ele)as(
    ->   select 1,@rsv_args,json_extract(@rsv_args,concat(concat('$[',0),']'))
    ->   union all
    ->   select grp+1,rsv_args,json_extract(@rsv_args,concat(concat('$[',grp),']')) from rec
    ->   where grp+1<=json_length(@rsv_args)
    -> )select * from rec;
+------+------------------------------+---------------+
| grp  | rsv_args                     | ele           |
+------+------------------------------+---------------+
|    1 | ["a", {"b": [1, 2]}, [3, 4]] | "a"           |
|    2 | ["a", {"b": [1, 2]}, [3, 4]] | {"b": [1, 2]} |
|    3 | ["a", {"b": [1, 2]}, [3, 4]] | [3, 4]        |
+------+------------------------------+---------------+
3 rows in set (0.00 sec)



mysql> with recursive rec (grp,rsv_args,ele)as(   select 1,@rsv_args,json_extract(@rsv_args,concat(concat('$[',0),']'))   union all   select grp+1,rsv_args,json_extract(@rsv_args,concat(concat('$[',grp),']')) from rec   where grp+1<=json_length(@rsv_args) )select s1.*,json_type(s1.ele) from rec s1;
+------+------------------------------+---------------+-------------------+
| grp  | rsv_args                     | ele           | json_type(s1.ele) |
+------+------------------------------+---------------+-------------------+
|    1 | ["a", {"b": [1, 2]}, [3, 4]] | "a"           | STRING            |
|    2 | ["a", {"b": [1, 2]}, [3, 4]] | {"b": [1, 2]} | OBJECT            |
|    3 | ["a", {"b": [1, 2]}, [3, 4]] | [3, 4]        | ARRAY             |
+------+------------------------------+---------------+-------------------+
3 rows in set (0.00 sec)

mysql> with recursive rec (grp,rsv_args,ele)as(
    ->   select 1,@rsv_args,json_extract(@rsv_args,concat(concat('$[',0),']'))
    ->   union all
    ->   select grp+1,rsv_args,json_extract(@rsv_args,concat(concat('$[',grp),']')) from rec
    ->   where grp+1<=json_length(@rsv_args)
    -> )select
    ->   s1.*
    ->   ,json_type(s1.ele)
    ->   ,json_object(concat('key',s1.grp),s1.ele) as done
    -> from rec s1
    -> ;
+------+------------------------------+---------------+-------------------+-------------------------+
| grp  | rsv_args                     | ele           | json_type(s1.ele) | done                    |
+------+------------------------------+---------------+-------------------+-------------------------+
|    1 | ["a", {"b": [1, 2]}, [3, 4]] | "a"           | STRING            | {"key1": "a"}           |
|    2 | ["a", {"b": [1, 2]}, [3, 4]] | {"b": [1, 2]} | OBJECT            | {"key2": {"b": [1, 2]}} |
|    3 | ["a", {"b": [1, 2]}, [3, 4]] | [3, 4]        | ARRAY             | {"key3": [3, 4]}        |
+------+------------------------------+---------------+-------------------+-------------------------+
3 rows in set (0.00 sec)


mysql> set @rsv_args='["a", {"b": [1, 2]}, [3, 4],[{"c": [11, 12]},{"d": [111, 112]}]]';
Query OK, 0 rows affected (0.00 sec)

mysql> with recursive rec (grp,rsv_args,ele)as(   select 1,@rsv_args,json_extract(@rsv_args,concat(concat('$[',0),']'))   union all   select grp+1,rsv_args,json_extract(@rsv_args,concat(concat('$[',grp),']')) from rec   where grp+1<=json_length(@rsv_args) )select   s1.*   ,json_type(s1.ele)   ,json_object(concat('key',s1.grp),s1.ele) as done from rec s1;
+------+------------------------------------------------------------------+--------------------------------------+-------------------+------------------------------------------------+
| grp  | rsv_args                                                         | ele                                  | json_type(s1.ele) | done                                           |
+------+------------------------------------------------------------------+--------------------------------------+-------------------+------------------------------------------------+
|    1 | ["a", {"b": [1, 2]}, [3, 4],[{"c": [11, 12]},{"d": [111, 112]}]] | "a"                                  | STRING            | {"key1": "a"}                                  |
|    2 | ["a", {"b": [1, 2]}, [3, 4],[{"c": [11, 12]},{"d": [111, 112]}]] | {"b": [1, 2]}                        | OBJECT            | {"key2": {"b": [1, 2]}}                        |
|    3 | ["a", {"b": [1, 2]}, [3, 4],[{"c": [11, 12]},{"d": [111, 112]}]] | [3, 4]                               | ARRAY             | {"key3": [3, 4]}                               |
|    4 | ["a", {"b": [1, 2]}, [3, 4],[{"c": [11, 12]},{"d": [111, 112]}]] | [{"c": [11, 12]}, {"d": [111, 112]}] | ARRAY             | {"key4": [{"c": [11, 12]}, {"d": [111, 112]}]} |
+------+------------------------------------------------------------------+--------------------------------------+-------------------+------------------------------------------------+
4 rows in set (0.00 sec)
```
