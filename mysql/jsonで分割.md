```
mysql> select ele from json_table(split_table('[1, 2, 3]'),"$[*]" columns(ele json path "$.key")) s1;
+-------+
| ele   |
+-------+
| "[1"  |
| " 2"  |
| " 3]" |
+-------+
3 rows in set (0.00 sec)

mysql> select json_unquote(ele) from json_table(split_table('[1, 2, 3]'),"$[*]" columns(ele json path "$.key")) s1;
+-------------------+
| json_unquote(ele) |
+-------------------+
| [1                |
|  2                |
|  3]               |
+-------------------+
3 rows in set (0.01 sec)

mysql> select ele from json_table(split_table('{"id": 87, "name": "carrot"}'),"$[*]" columns(ele json path "$.key")) s1;
+--------------------------+
| ele                      |
+--------------------------+
| "{\"id\": 87"            |
| " \"name\": \"carrot\"}" |
+--------------------------+
2 rows in set (0.00 sec)

mysql> select json_unquote(ele) from json_table(split_table('{"id": 87, "name": "carrot"}'),"$[*]" columns(ele json path "$.key")) s1;
+--------------------+
| json_unquote(ele)  |
+--------------------+
| {"id": 87          |
|  "name": "carrot"} |
+--------------------+
2 rows in set (0.01 sec)

```

こういうのも
```
mysql> select ele from json_table(split_table(concat(concat("'",JSON_ARRAY(1, "abc", NULL, TRUE, CURTIME())),"'")),"$[*]" columns(ele json path "$.key")) s1;
+--------------------------+
| ele                      |
+--------------------------+
| "'[1"                    |
| " \"abc\""               |
| " null"                  |
| " true"                  |
| " \"21:24:45.000000\"]'" |
+--------------------------+
5 rows in set (0.00 sec)

mysql> select json_unquote(ele) from json_table(split_table(concat(concat("'",JSON_ARRAY(1, "abc", NULL, TRUE, CURTIME())),"'")),"$[*]" columns(ele json path "$.key")) s1;
+----------------------+
| json_unquote(ele)    |
+----------------------+
| '[1                  |
|  "abc"               |
|  null                |
|  true                |
|  "21:25:03.000000"]' |
+----------------------+
5 rows in set (0.00 sec)

mysql> select ele from json_table(split_table(JSON_ARRAY(1, "abc", NULL, TRUE, CURTIME())),"$[*]" columns(ele json path "$.key")) s1;
+-------------------------+
| ele                     |
+-------------------------+
| "[1"                    |
| " \"abc\""              |
| " null"                 |
| " true"                 |
| " \"21:25:31.000000\"]" |
+-------------------------+
5 rows in set (0.00 sec)

mysql> select json_unquote(ele) from json_table(split_table(JSON_ARRAY(1, "abc", NULL, TRUE, CURTIME())),"$[*]" columns(ele json path "$.key")) s1;
+---------------------+
| json_unquote(ele)   |
+---------------------+
| [1                  |
|  "abc"              |
|  null               |
|  true               |
|  "21:25:44.000000"] |
+---------------------+
5 rows in set (0.00 sec)


```


```
mysql> select ele from json_table(split_table(JSON_OBJECT('id', 87, 'name', 'carrot')),"$[*]" columns(ele json path "$.key")) s1;
+--------------------------+
| ele                      |
+--------------------------+
| "{\"id\": 87"            |
| " \"name\": \"carrot\"}" |
+--------------------------+
2 rows in set (0.00 sec)

mysql> select json_unquote(ele) from json_table(split_table(JSON_OBJECT('id', 87, 'name', 'carrot')),"$[*]" columns(ele json path "$.key")) s1;
+--------------------+
| json_unquote(ele)  |
+--------------------+
| {"id": 87          |
|  "name": "carrot"} |
+--------------------+
2 rows in set (0.00 sec)


```


```
mysql> SELECT JSON_KEYS('{"a": 1, "b": {"c": 30}}');
+---------------------------------------+
| JSON_KEYS('{"a": 1, "b": {"c": 30}}') |
+---------------------------------------+
| ["a", "b"]                            |
+---------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT json_type(JSON_KEYS('{"a": 1, "b": {"c": 30}}'));
+--------------------------------------------------+
| json_type(JSON_KEYS('{"a": 1, "b": {"c": 30}}')) |
+--------------------------------------------------+
| ARRAY                                            |
+--------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT JSON_KEYS('{"a": 1, "b": {"c": 30}}');
+---------------------------------------+
| JSON_KEYS('{"a": 1, "b": {"c": 30}}') |
+---------------------------------------+
| ["a", "b"]                            |
+---------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT json_type(JSON_KEYS('{"a": 1, "b": {"c": 30}}'));
+--------------------------------------------------+
| json_type(JSON_KEYS('{"a": 1, "b": {"c": 30}}')) |
+--------------------------------------------------+
| ARRAY                                            |
+--------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT json_length(JSON_KEYS('{"a": 1, "b": {"c": 30}}'));
+----------------------------------------------------+
| json_length(JSON_KEYS('{"a": 1, "b": {"c": 30}}')) |
+----------------------------------------------------+
|                                                  2 |
+----------------------------------------------------+
1 row in set (0.00 sec)


```
