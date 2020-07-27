
mysqlが入っていないこと
実行バイナリでコンフリクト起きる

mysqlユーザー登録

1001 mysql 1001 mysql

mariadbインストール

centos-7-6-18-10-install-mariadb.sh


サーバー側のデフォルト文字コードの設定変更

https://mariadb.com/ja/resources/blog/install-mariadb-server-centos7/

**[mariadb]**セクションに**character-set-server=utf8**を追加

```
grep -n '\[mariadb\]' /etc/my.cnf.d/server.cnf | while read n;do echo sed -i "'${n/:*/}acharacter-set-server=utf8'" /etc/my.cnf.d/server.cnf;done | bash
```

mariadbプロセスデーモン起動

mysqlユーザーで実行

```
$ /usr/sbin/mariadbd 1>$HOME/launch-mariadb.log 2>&1 &
```


データベース作成

rootユーザーで実行


```
$mysql -uroot < /usr/local/src/script-repo/centos-7-6-18-10-config-mariadb.sql
```

ヘルスチェック

rootユーザーで実行

```
$mysql -uroot -pMysql3306 -Dtestdb < /usr/local/src/script-repo/centos-7-6-18-10-healthcheck-mariadb.sql
```

mysqlユーザーで実行

```
$mysql -umysql -pMysql3306 -Dtestdb < /usr/local/src/script-repo/centos-7-6-18-10-healthcheck-mariadb.sql
```

実行者ユーザーはrootないしmysqlユーザー以外でもよい

```
$mysql -uuser01 -pMysql3306 -Dtestdb < /usr/local/src/script-repo/centos-7-6-18-10-healthcheck-mariadb.sql
```


バックアップ

rootユーザーで実行

```
$mariadb-dump -uroot -pMysql3306 --databases testdb >mariadb-dump-testdb-$(date "+%Y-%m-%dT%H-%M-%S").sql
$ls -l mariadb-dump-testdb-2020-05-20T13-33-48.sql
-rw-r--r--. 1 root root 3002  5月 20 13:33 mariadb-dump-testdb-2020-05-20T13-33-48.sql
```

リストア

rootユーザーで実行

```
$mariadb -uroot -pMysql3306 -e 'show databases;'
$mariadb -uroot -pMysql3306 -e 'drop database testdb;'
$mariadb -uroot -pMysql3306 -e 'show databases;'

$mariadb -uroot -pMysql3306 < mariadb-dump-testdb-2020-05-20T13-33-48.sql

$mariadb -uroot -pMysql3306 -e 'show databases;'

$mariadb -uroot -pMysql3306 -Dtestdb -e 'select * from test_tbl;'

$mariadb -uuser01 -pMysql3306 -Dtestdb -e 'select * from test_tbl;'

mysqlユーザーで実行

$mariadb -umysql -pMysql3306 -Dtestdb -e 'select * from test_tbl;'
```

データファイル等を誤って削除した

```
$ls -l /var/lib/mysql/
total 122936
-rw-rw----. 1 mysql mysql    24576  5月 20 13:09 aria_log.00000001
-rw-rw----. 1 mysql mysql       52  5月 20 12:23 aria_log_control
-rw-rw----. 1 mysql mysql        4  5月 20 13:01 doc-centos-7-6-18-10-vim.pid
-rw-rw----. 1 mysql mysql      972  5月 20 12:23 ib_buffer_pool
-rw-rw----. 1 mysql mysql 50331648  5月 20 14:06 ib_logfile0
-rw-rw----. 1 mysql mysql 50331648  5月 20 12:23 ib_logfile1
-rw-rw----. 1 mysql mysql 12582912  5月 20 14:06 ibdata1
-rw-rw----. 1 mysql mysql 12582912  5月 20 13:01 ibtmp1
-rw-rw-r--. 1 mysql mysql     2233  5月 20 13:11 launch-mariadb.log
-rw-rw----. 1 mysql mysql        0  5月 20 12:52 multi-master.info
drwx------. 2 mysql mysql     4096  5月 20 12:23 mysql
srwxrwxrwx. 1 mysql mysql        0  5月 20 13:01 mysql.sock
drwx------. 2 mysql mysql     4096  5月 20 12:23 performance_schema
drwx------. 2 mysql mysql     4096  5月 20 12:23 test
drwx------. 2 mysql mysql     4096  5月 20 14:06 testdb

$rm -rf  /var/lib/mysql/
$ls -l /var/lib/mysql/
ls: cannot access /var/lib/mysql/: No such file or directory

$mkdir -p /var/lib/mysql/
$chown -R mysql:mysql /var/lib/mysql/
```


プロセスの停止

```
$ ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14380  2012 pts/0    Ss+  12:20   0:00 /bin/bash
kuraine     19  0.0  0.0  14380  2052 pts/1    Ss   12:21   0:00 /bin/bash
root       320  0.0  0.0  87268  2620 pts/1    S    12:51   0:00 su mysql
mysql      321  0.0  0.0  14380  1888 pts/1    S    12:51   0:00 bash
mysql      323  0.1  0.2 1829972 77320 pts/1   Sl   12:52   0:00 /usr/sbin/mariadbd
mysql      362  0.0  0.0  54308  1868 pts/1    R+   13:00   0:00 ps aux

$ kill -9 323

$ ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14380  2012 pts/0    Ss+  12:20   0:00 /bin/bash
kuraine     19  0.0  0.0  14380  2052 pts/1    Ss   12:21   0:00 /bin/bash
root       320  0.0  0.0  87268  2620 pts/1    S    12:51   0:00 su mysql
mysql      321  0.0  0.0  14380  1896 pts/1    S    12:51   0:00 bash
mysql      363  0.0  0.0  54308  1868 pts/1    R+   13:01   0:00 ps aux
[1]+  Killed                  /usr/sbin/mariadbd
```

データファイル等の作成

mysqlユーザーで実行

```
$su mysql

$mariadb-install-db --datadir=/var/lib/mysql
Installing MariaDB/MySQL system tables in '/var/lib/mysql' ...
OK

To start mysqld at boot time you have to copy
support-files/mysql.server to the right place for your system


Two all-privilege accounts were created.
One is root@localhost, it has no password, but you need to
be system 'root' user to connect. Use, for example, sudo mysql
The second is mysql@localhost, it has no password either, but
you need to be the system 'mysql' user to connect.
After connecting you can set the password, if you would need to be
able to connect as any of these users with a password and without sudo

See the MariaDB Knowledgebase at http://mariadb.com/kb or the
MySQL manual for more instructions.

You can start the MariaDB daemon with:
cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'

You can test the MariaDB daemon with mysql-test-run.pl
cd '/usr/mysql-test' ; perl mysql-test-run.pl

Please report any problems at http://mariadb.org/jira

The latest information about MariaDB is available at http://mariadb.org/.
You can find additional information about the MySQL part at:
http://dev.mysql.com
Consider joining MariaDB's strong and vibrant community:
https://mariadb.org/get-involved/
```

プロセスの起動

mysqlユーザーで実行


```
$ mysqld_safe --datadir='/var/lib/mysql' 1>$HOME/launch-mariadb.log 2>&1 &
[1] 701

$ ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14380  2012 pts/0    Ss+  12:20   0:00 /bin/bash
kuraine     19  0.0  0.0  14380  2052 pts/1    Ss   12:21   0:00 /bin/bash
root       403  0.0  0.0  87268  2616 pts/1    S    13:05   0:00 su root
root       404  0.0  0.0  14380  2152 pts/1    S    13:05   0:01 bash
root       524  0.0  0.0  84536  2316 pts/1    S    14:13   0:00 su mysql
mysql      525  0.0  0.0  14384  1908 pts/1    S    14:13   0:00 bash
kuraine    677  0.0  0.0  14380  2052 pts/2    Ss+  14:16   0:00 /bin/bash
mysql      701  0.0  0.0  12260  1684 pts/1    S    14:18   0:00 /bin/sh /bin/mysqld_safe --datadir=/var/lib/mysql
mysql      771  0.8  0.2 1764140 76392 pts/1   Sl   14:18   0:00 //sbin/mysqld --basedir=/ --datadir=/var/lib/mysql --plugin-dir=//lib64/mysql/plugin --log-error=/var/lib/mysql/doc-centos-7-6-18-10-vim.err --pid
mysql      803  0.0  0.0  54308  1868 pts/1    R+   14:19   0:00 ps aux
```

データベース作成

rootユーザーで実行

```
$mysql -uroot < /usr/local/src/script-repo/centos-7-6-18-10-config-mariadb.sql

$mariadb -uroot -pMysql3306 -e 'show databases;'
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
| testdb             |
+--------------------+
$mariadb -uroot -pMysql3306 -e 'drop database testdb;'

$mariadb -uroot -pMysql3306 -e 'show databases;'
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+

```

リストア

rootユーザーで実行

```
$mariadb -uroot -pMysql3306 < mariadb-dump-testdb-2020-05-20T13-33-48.sql
$mariadb -uroot -pMysql3306 -e 'show databases;'
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
| testdb             |
+--------------------+
$mariadb -uroot -pMysql3306 -Dtestdb -e 'select * from test_tbl;'
+--------------+
| col          |
+--------------+
| うんこ       |
| もりもり     |
| 森鴎外       |
+--------------+

```


