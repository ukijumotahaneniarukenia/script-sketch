- https://mroonga.org/ja/docs/install/centos.html#centos-7-with-the-oracle-mysql-8-0-package

- https://www.slideshare.net/kou/jpmugdbstudy1

インストール

コンテナ入ってから実行

rootユーザーで実行

対話入力はすべてEnterキーを押下するだけ


```
$bash /root/subrun.sh
```

ヘルスチェック

rootユーザーで以下のスクリプトを実行し、
```
$bash /usr/local/src/script-repo/centos-7-6-18-10-healthcheck-mysql-8-X-X-mroonga-X-X-X.sh
```

標準出力になにがしかしゅつりょくされればおｋ

```
mysqld will log errors to /var/log/mysqld.log
mysqld is running as pid 361
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14380  1992 pts/0    Ss+  00:17   0:00 /bin/bash
kuraine     19  0.0  0.0  14380  2028 pts/1    Ss   00:17   0:00 /bin/bash
root        37  0.0  0.0  87268  2620 pts/1    S    00:17   0:00 su root
root        38  0.0  0.0  14380  2104 pts/1    S    00:17   0:00 bash
root       305  0.0  0.0  12120  1440 pts/1    S+   00:27   0:00 bash centos-7-6-18-10-healthcheck-mysql-8-X-X-mroonga-X-X-X.sh
mysql      361  0.0  1.0 1772796 332180 ?      Sl   00:27   0:00 mysqld -D --user=mysql
root       405  0.0  0.0  54308  1868 pts/1    R+   00:27   0:00 ps aux
2020-05-18T15:27:41.702265Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.20) initializing of server in progress as process 314
2020-05-18T15:27:41.706799Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2020-05-18T15:27:42.585175Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2020-05-18T15:27:44.795817Z 6 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: m#WT5ppr1juf
2020-05-18T15:27:49.126302Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.20) starting as process 359
2020-05-18T15:27:49.146906Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2020-05-18T15:27:49.462301Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2020-05-18T15:27:49.572049Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: '/var/run/mysqld/mysqlx.sock' bind-address: '::' port: 33060
2020-05-18T15:27:49.713083Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
2020-05-18T15:27:49.764753Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.20'  socket: '/var/lib/mysql/mysql.sock'  port: 3306  MySQL Community Server - GPL.
mysql: [Warning] Using a password on the command line interface can be insecure.
mysql: [Warning] Using a password on the command line interface can be insecure.
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
+-----------+
| version() |
+-----------+
| 8.0.20    |
+-----------+
+---------------------------------+------+
| rsv_args                        | ele  |
+---------------------------------+------+
| [{"x":"8"},{"x":"3"},{"x":"4"}] | 8    |
| [{"x":"8"},{"x":"3"},{"x":"4"}] | 3    |
| [{"x":"8"},{"x":"3"},{"x":"4"}] | 4    |
+---------------------------------+------+
mysql: [Warning] Using a password on the command line interface can be insecure.
+------------------+
| user()           |
+------------------+
| user01@localhost |
+------------------+
+-----------+
| version() |
+-----------+
| 8.0.20    |
+-----------+
+---------------------------------+------+
| rsv_args                        | ele  |
+---------------------------------+------+
| [{"x":"8"},{"x":"3"},{"x":"4"}] | 8    |
| [{"x":"8"},{"x":"3"},{"x":"4"}] | 3    |
| [{"x":"8"},{"x":"3"},{"x":"4"}] | 4    |
+---------------------------------+------+
mysql: [Warning] Using a password on the command line interface can be insecure.
mysql: [Warning] Using a password on the command line interface can be insecure.
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Engine             | Support | Comment                                                        | Transactions | XA   | Savepoints |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Mroonga            | YES     | CJK-ready fulltext search, column store                        | NO           | NO   | NO         |
| FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
| MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
| InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
| PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           | NO   | NO         |
| MyISAM             | YES     | MyISAM storage engine                                          | NO           | NO   | NO         |
| MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
| BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
| CSV                | YES     | CSV storage engine                                             | NO           | NO   | NO         |
| ARCHIVE            | YES     | Archive storage engine                                         | NO           | NO   | NO         |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
+-----------------+-------+
| Variable_name   | Value |
+-----------------+-------+
| mroonga_version | 10.02 |
+-----------------+-------+
+----+-------------------------+
| id | content                 |
+----+-------------------------+
|  1 | It'll be fine tomorrow. |
+----+-------------------------+
+----+--------------------------------------------------+---------------------------------------------------+
| id | content                                          | MATCH (content) AGAINST ("+fine" IN BOOLEAN MODE) |
+----+--------------------------------------------------+---------------------------------------------------+
|  3 | It's fine today. It'll be fine tomorrow as well. |                                                 2 |
|  1 | It'll be fine tomorrow.                          |                                                 1 |
|  4 | It's fine today. But it'll rain tomorrow.        |                                                 1 |
+----+--------------------------------------------------+---------------------------------------------------+
+----+--------------------------------------------------+-------+
| id | content                                          | score |
+----+--------------------------------------------------+-------+
|  3 | It's fine today. It'll be fine tomorrow as well. |     2 |
|  1 | It'll be fine tomorrow.                          |     1 |
|  4 | It's fine today. But it'll rain tomorrow.        |     1 |
+----+--------------------------------------------------+-------+
+------------+-----------------------------------------+
| day        | content                                 |
+------------+-----------------------------------------+
| 2013-04-23 | ブラックコーヒーを飲んだ。              |
+------------+-----------------------------------------+
+------------+-----------------------------------------+
| day        | content                                 |
+------------+-----------------------------------------+
| 2013-04-23 | ブラックコーヒーを飲んだ。              |
+------------+-----------------------------------------+
+------------+-----------------------------------------+
| day        | content                                 |
+------------+-----------------------------------------+
| 2013-04-23 | ブラックコーヒーを飲んだ。              |
+------------+-----------------------------------------+
ERROR 1026 (HY000) at line 105 in file: 'centos-7-6-18-10-healthcheck-mysql-8-X-X-mroonga-X-X-X.sql': [plugin][register] cannot find plugin file: </usr/lib64/groonga/plugins/token_filters/stem.so>
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Engine             | Support | Comment                                                        | Transactions | XA   | Savepoints |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Mroonga            | YES     | CJK-ready fulltext search, column store                        | NO           | NO   | NO         |
| FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
| MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
| InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
| PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           | NO   | NO         |
| MyISAM             | YES     | MyISAM storage engine                                          | NO           | NO   | NO         |
| MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
| BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
| CSV                | YES     | CSV storage engine                                             | NO           | NO   | NO         |
| ARCHIVE            | YES     | Archive storage engine                                         | NO           | NO   | NO         |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
+-----------------+-------+
| Variable_name   | Value |
+-----------------+-------+
| mroonga_version | 10.02 |
+-----------------+-------+
+----+-------------------------+
| id | content                 |
+----+-------------------------+
|  1 | It'll be fine tomorrow. |
+----+-------------------------+
+----+--------------------------------------------------+---------------------------------------------------+
| id | content                                          | MATCH (content) AGAINST ("+fine" IN BOOLEAN MODE) |
+----+--------------------------------------------------+---------------------------------------------------+
|  3 | It's fine today. It'll be fine tomorrow as well. |                                                 2 |
|  1 | It'll be fine tomorrow.                          |                                                 1 |
|  4 | It's fine today. But it'll rain tomorrow.        |                                                 1 |
+----+--------------------------------------------------+---------------------------------------------------+
+----+--------------------------------------------------+-------+
| id | content                                          | score |
+----+--------------------------------------------------+-------+
|  3 | It's fine today. It'll be fine tomorrow as well. |     2 |
|  1 | It'll be fine tomorrow.                          |     1 |
|  4 | It's fine today. But it'll rain tomorrow.        |     1 |
+----+--------------------------------------------------+-------+
+------------+-----------------------------------------+
| day        | content                                 |
+------------+-----------------------------------------+
| 2013-04-23 | ブラックコーヒーを飲んだ。              |
+------------+-----------------------------------------+
+------------+-----------------------------------------+
| day        | content                                 |
+------------+-----------------------------------------+
| 2013-04-23 | ブラックコーヒーを飲んだ。              |
+------------+-----------------------------------------+
+------------+-----------------------------------------+
| day        | content                                 |
+------------+-----------------------------------------+
| 2013-04-23 | ブラックコーヒーを飲んだ。              |
+------------+-----------------------------------------+
ERROR 1026 (HY000) at line 105 in file: 'centos-7-6-18-10-healthcheck-mysql-8-X-X-mroonga-X-X-X.sql': [plugin][register] cannot find plugin file: </usr/lib64/groonga/plugins/token_filters/stem.so>
```


実行ユーザーはmysqlユーザーないしrootユーザーならmysqlプロセスを実行できる。それ以外はソケットエラー。

