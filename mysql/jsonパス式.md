gronコマンドいんすこ

```
[root❣ab9938775985 (月 12月 09 00:01:50) /home/root/script_scratch/mysql]$curl -LO https://github.com/tomnomnom/gron/releases/download/v0.6.0/gron-linux-amd64-0.6.0.tgz
[root❣ab9938775985 (月 12月 09 00:02:28) /home/root/script_scratch/mysql]$tar xzf gron-linux-amd64-0.6.0.tgz
[root❣ab9938775985 (月 12月 09 00:02:51) /home/root/script_scratch/mysql]$mv gron /usr/local/bin/

```

テストデータ準備

```
[root❣ab9938775985 (日 12月 08 22:26:11) ~]$mysql -uroot -pMysql3306 -Dtestdb
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 20
Server version: 8.0.18 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create table test_tbl(tgt json);
Query OK, 0 rows affected (0.06 sec)

mysql> insert into test_tbl values('["a", {"b": [1, 2]}, [3, 4],[{"c": [11, 12]},{"d": [111, 112]}]]');
Query OK, 1 row affected (0.01 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from test_tbl;
+--------------------------------------------------------------------+
| tgt                                                                |
+--------------------------------------------------------------------+
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] |
+--------------------------------------------------------------------+
1 row in set (0.00 sec)

[root❣ab9938775985 (日 12月 08 23:48:34) /home/root/script_scratch/mysql]$mysql -uroot -pMysql3306 -Dtestdb
mysql: [Warning] Using a password on the command line interface can be insecure.
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 84
Server version: 8.0.18 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create table test_tbl2(tgt json);
Query OK, 0 rows affected (0.05 sec)

mysql> insert into test_tbl2 values('["a", {"b": [1, 2]}, [3, 4],[{"c": [11, 12]},{"d": [111, 112]}]]');
Query OK, 1 row affected (0.01 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from test_tbl2;                                                                                                    
+--------------------------------------------------------------------+
| tgt                                                                |
+--------------------------------------------------------------------+
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] |
+--------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> ^DBye

```

```
[root❣ab9938775985 (日 12月 08 23:39:57) /home/root/script_scratch/mysql]$mysql -uroot -pMysql3306 -Dtestdb
mysql: [Warning] Using a password on the command line interface can be insecure.
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 76
Server version: 8.0.18 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> select tgt,json_extract(tgt,'$') as ele,'$' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[0]') as ele,'$[0]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[1]') as ele,'$[1]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[1].b') as ele,'$[1].b' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[1].b[0]') as ele,'$[1].b[0]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[1].b[1]') as ele,'$[1].b[1]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[2]') as ele,'$[2]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[2][0]') as ele,'$[2][0]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[2][1]') as ele,'$[2][1]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[3]') as ele,'$[3]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[3][0]') as ele,'$[3][0]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[3][0].c') as ele,'$[3][0].c' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[3][0].c[0]') as ele,'$[3][0].c[0]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[3][0].c[1]') as ele,'$[3][0].c[1]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[3][1]') as ele,'$[3][1]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[3][1].d') as ele,'$[3][1].d' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[3][1].d[0]') as ele,'$[3][1].d[0]' as path_exp from test_tbl union all
    -> select tgt,json_extract(tgt,'$[3][1].d[1]') as ele,'$[3][1].d[1]' as path_exp from test_tbl ;
+--------------------------------------------------------------------+--------------------------------------------------------------------+--------------+
| tgt                                                                | ele                                                                | path_exp     |
+--------------------------------------------------------------------+--------------------------------------------------------------------+--------------+
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | $            |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | "a"                                                                | $[0]         |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | {"b": [1, 2]}                                                      | $[1]         |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [1, 2]                                                             | $[1].b       |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 1                                                                  | $[1].b[0]    |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 2                                                                  | $[1].b[1]    |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [3, 4]                                                             | $[2]         |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 3                                                                  | $[2][0]      |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 4                                                                  | $[2][1]      |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [{"c": [11, 12]}, {"d": [111, 112]}]                               | $[3]         |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | {"c": [11, 12]}                                                    | $[3][0]      |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [11, 12]                                                           | $[3][0].c    |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 11                                                                 | $[3][0].c[0] |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 12                                                                 | $[3][0].c[1] |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | {"d": [111, 112]}                                                  | $[3][1]      |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [111, 112]                                                         | $[3][1].d    |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 111                                                                | $[3][1].d[0] |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 112                                                                | $[3][1].d[1] |
+--------------------------------------------------------------------+--------------------------------------------------------------------+--------------+
18 rows in set (0.00 sec)

```


使用
```
[root❣ab9938775985 (日 12月 08 23:56:45) /home/root/script_scratch/mysql]$./パス式.sh test_tbl{,2} | mysql -uroot -pMysql3306 -Dtestdb 2>/dev/null
tgt	ele	path_exp
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	$
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	"a"	$[0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	{"b": [1, 2]}	$[1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[1, 2]	$[1].b
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	1	$[1].b[0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	2	$[1].b[1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[3, 4]	$[2]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	3	$[2][0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	4	$[2][1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[{"c": [11, 12]}, {"d": [111, 112]}]	$[3]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	{"c": [11, 12]}	$[3][0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[11, 12]	$[3][0].c
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	11	$[3][0].c[0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	12	$[3][0].c[1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	{"d": [111, 112]}	$[3][1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[111, 112]	$[3][1].d
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	111	$[3][1].d[0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	112	$[3][1].d[1]
tgt	ele	path_exp
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	$
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	"a"	$[0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	{"b": [1, 2]}	$[1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[1, 2]	$[1].b
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	1	$[1].b[0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	2	$[1].b[1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[3, 4]	$[2]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	3	$[2][0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	4	$[2][1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[{"c": [11, 12]}, {"d": [111, 112]}]	$[3]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	{"c": [11, 12]}	$[3][0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[11, 12]	$[3][0].c
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	11	$[3][0].c[0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	12	$[3][0].c[1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	{"d": [111, 112]}	$[3][1]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	[111, 112]	$[3][1].d
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	111	$[3][1].d[0]
["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]	112	$[3][1].d[1]

```

シンプルに生きることにした

```
$./パス式.sh test_tbl | mysql -uroot -pMysql3306 -Dtestdb 2>/dev/null | \
sed 's;\t;\x27),(\x27;g;s;^;(\x27;;s;$;\x27);;s;$;,;g' | sed '$ s;,$;;' | \
sed 's;(\x27tgt\x27),(\x27ele\x27),(\x27path_exp\x27),;insert into test_tbl_done(tgt,ele,path_exp)values;;s;),(;,;g;' |sed '$ s;$;\;;'
```


```
insert into test_tbl_done(tgt,ele,path_exp)values
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','$'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','"a"','$[0]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','{"b": [1, 2]}','$[1]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[1, 2]','$[1].b'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','1','$[1].b[0]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','2','$[1].b[1]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[3, 4]','$[2]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','3','$[2][0]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','4','$[2][1]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[{"c": [11, 12]}, {"d": [111, 112]}]','$[3]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','{"c": [11, 12]}','$[3][0]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[11, 12]','$[3][0].c'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','11','$[3][0].c[0]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','12','$[3][0].c[1]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','{"d": [111, 112]}','$[3][1]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[111, 112]','$[3][1].d'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','111','$[3][1].d[0]'),
('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','112','$[3][1].d[1]');
```

```
[root❣ab9938775985 (月 12月 09 00:39:50) /home/root/script_scratch/mysql]$mysql -uroot -pMysql3306 -Dtestdb
mysql: [Warning] Using a password on the command line interface can be insecure.
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 163
Server version: 8.0.18 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create table test_tbl_done(tgt json,ele json,path_exp text);
Query OK, 0 rows affected (0.06 sec)

mysql> insert into test_tbl_done(tgt,ele,path_exp)values
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','$'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','"a"','$[0]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','{"b": [1, 2]}','$[1]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[1, 2]','$[1].b'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','1','$[1].b[0]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','2','$[1].b[1]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[3, 4]','$[2]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','3','$[2][0]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','4','$[2][1]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[{"c": [11, 12]}, {"d": [111, 112]}]','$[3]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','{"c": [11, 12]}','$[3][0]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[11, 12]','$[3][0].c'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','11','$[3][0].c[0]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','12','$[3][0].c[1]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','{"d": [111, 112]}','$[3][1]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','[111, 112]','$[3][1].d'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','111','$[3][1].d[0]'),
    -> ('["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]]','112','$[3][1].d[1]');
Query OK, 18 rows affected (0.02 sec)
Records: 18  Duplicates: 0  Warnings: 0

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from test_tbl_done;
+--------------------------------------------------------------------+--------------------------------------------------------------------+--------------+
| tgt                                                                | ele                                                                | path_exp     |
+--------------------------------------------------------------------+--------------------------------------------------------------------+--------------+
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | $            |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | "a"                                                                | $[0]         |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | {"b": [1, 2]}                                                      | $[1]         |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [1, 2]                                                             | $[1].b       |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 1                                                                  | $[1].b[0]    |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 2                                                                  | $[1].b[1]    |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [3, 4]                                                             | $[2]         |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 3                                                                  | $[2][0]      |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 4                                                                  | $[2][1]      |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [{"c": [11, 12]}, {"d": [111, 112]}]                               | $[3]         |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | {"c": [11, 12]}                                                    | $[3][0]      |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [11, 12]                                                           | $[3][0].c    |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 11                                                                 | $[3][0].c[0] |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 12                                                                 | $[3][0].c[1] |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | {"d": [111, 112]}                                                  | $[3][1]      |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | [111, 112]                                                         | $[3][1].d    |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 111                                                                | $[3][1].d[0] |
| ["a", {"b": [1, 2]}, [3, 4], [{"c": [11, 12]}, {"d": [111, 112]}]] | 112                                                                | $[3][1].d[1] |
+--------------------------------------------------------------------+--------------------------------------------------------------------+--------------+
18 rows in set (0.00 sec)


```
