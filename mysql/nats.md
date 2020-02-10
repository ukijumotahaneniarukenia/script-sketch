```
mysql> select * from json_table(nats(1,5),"$[*]" columns(ele bigint path "$.key")) as s1;
+------+
| ele  |
+------+
|    1 |
|    2 |
|    3 |
|    4 |
|    5 |
+------+
5 rows in set (0.01 sec)
```

デフォルトの再帰深さ制限に1001だと引っかかる。

```
mysql> select max(ele) from json_table(nats(1,1001),"$[*]" columns(ele bigint path "$.key")) as s1;
ERROR 3636 (HY000): Recursive query aborted after 1001 iterations. Try increasing @@cte_max_recursion_depth to a larger value.
```

緩和
```
set session cte_max_recursion_depth = 2000;
```

とれる

```
mysql> set session cte_max_recursion_depth = 2000;
Query OK, 0 rows affected (0.00 sec)

mysql> select max(ele) from json_table(nats(1,1001),"$[*]" columns(ele bigint path "$.key")) as s1;
+----------+
| max(ele) |
+----------+
|     1001 |
+----------+
1 row in set (0.01 sec)
mysql> select max(ele) from json_table(nats(1,2000),"$[*]" columns(ele bigint path "$.key")) as s1;
+----------+
| max(ele) |
+----------+
|     2000 |
+----------+
1 row in set (0.01 sec)

mysql> select max(ele) from json_table(nats(1,2001),"$[*]" columns(ele bigint path "$.key")) as s1;
ERROR 3636 (HY000): Recursive query aborted after 2001 iterations. Try increasing @@cte_max_recursion_depth to a larger value.
```


1000万件。4秒ぐらい。
```
mysql> set session cte_max_recursion_depth = 1000000;
Query OK, 0 rows affected (0.00 sec)

mysql> select max(ele) from json_table(nats(1,1000000),"$[*]" columns(ele bigint path "$.key")) as s1;
+----------+
| max(ele) |
+----------+
|  1000000 |
+----------+
1 row in set (4.21 sec)

```
