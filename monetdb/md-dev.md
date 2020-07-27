実行ユーザーにmonetdbさんはいれんくて良いみたい

dbeaverつなげられた

初めての列指向データベース

monetdb

[ソースダウンロード](https://www.monetdb.org/downloads/sources/Nov2019-SP3/)



```
$cd /usr/local/src
$curl -LO https://www.monetdb.org/downloads/sources/Nov2019-SP3/MonetDB-11.35.19.tar.bz2
```

[ソースコンパイル](https://www.monetdb.org/Developers/SourceCompile)

```
$tar xvf MonetDB-11.35.19.tar.bz2
$./configure
$make -j12
$make -j12 install
```

```
$monetdbd --version
MonetDB Database Server v11.35.19 (Nov2019-SP3)


$monetdbd --help
usage: monetdbd [ command [ command-options ] ] <dbfarm>
  where command is one of:
    create, start, stop, get, set, version or help
  use the help command to get help for a particular command
  The dbfarm to operate on must always be given to
  monetdbd explicitly.
```


```
$monetdb --version
MonetDB Database Server Toolkit v11.35.19 (Nov2019-SP3)

$monetdb --help
Usage: monetdb [options] command [command-options-and-arguments]
  where command is one of:
    create, destroy, lock, release
    status, start, stop, kill
    profilerstart, profilerstop
    set, get, inherit
    discover, help, version
  options can be:
    -q       suppress status output
    -h host  hostname to contact (remote merovingian)
    -p port  port to contact
    -P pass  password to use to login at remote merovingian
  use the help command to get help for a particular command
```

[チュートリアル](https://www.monetdb.org/Documentation/UserGuide/Tutorial)

```
apache doc-centos-7-6-18-10-apache-vim ~$monetdbd create testdb
apache doc-centos-7-6-18-10-apache-vim ~$ls
dotfile  launch-fcitx.log  testdb
apache doc-centos-7-6-18-10-apache-vim ~$tree testdb/
testdb/

0 directories, 0 files

apache doc-centos-7-6-18-10-apache-vim ~$monetdbd start testdb
apache doc-centos-7-6-18-10-apache-vim ~$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
apache       1  0.0  0.0  14240  1420 pts/0    Ss   15:29   0:00 bash /etc/init/run.sh
apache       8  0.0  0.0 237236 18420 ?        S    15:29   0:04 fcitx
apache       9  0.0  0.0  14380  2020 pts/0    S+   15:29   0:00 bash
apache      28  0.0  0.0  58908   880 ?        S    15:29   0:00 dbus-launch --autolaunch bc74deaa9e044c079ed6fc963d084157 --binary-syntax --close-stderr
apache      29  0.0  0.0  58004  1364 ?        Ss   15:29   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --session
apache      34  0.0  0.0  58004  1468 ?        Ss   15:29   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
apache      38  0.0  0.0  51300   784 ?        SN   15:29   0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-XVAnEIpZSZ,guid=1e5d71e01f62ccb74b266c665ebf8836 34
apache     117  0.0  0.0  14380  2096 pts/1    Ss   16:26   0:00 /bin/bash
apache   17030  0.0  0.0 322532  1984 ?        Ssl  19:16   0:00 monetdbd start testdb
apache   17034  0.0  0.0  54308  1856 pts/1    R+   19:16   0:00 ps aux


#パスワードはmonetdbと入力

apache doc-centos-7-6-18-10-apache-vim ~$monetdb create voc
created database in maintenance mode: voc
apache doc-centos-7-6-18-10-apache-vim ~$monetdb release voc
taken database out of maintenance mode: voc
apache doc-centos-7-6-18-10-apache-vim ~$mclient -u monetdb -d voc
password:
Welcome to mclient, the MonetDB/SQL interactive terminal (Nov2019-SP3)
Database: MonetDB v11.35.19 (Nov2019-SP3), 'mapi:monetdb://doc-centos-7-6-18-10-apache-vim:50000/voc'
FOLLOW US on https://twitter.com/MonetDB or https://github.com/MonetDB/MonetDB
Type \q to quit, \? for a list of available commands
auto commit mode: on


sql>
sql>
sql>
sql>SELECT 'hello world';
+-------------+
| L2          |
+=============+
| hello world |
+-------------+
1 tuple
sql>apache doc-centos-7-6-18-10-apache-vim ~$


```

実行ユーザーとデータベースプロセスはユーザ依存ないみたい

```
apache doc-centos-7-6-18-10-apache-vim ~$ll | grep testdb
drwxr-xr-x. 3 apache apache 4096  5月 16 19:20 testdb/
apache doc-centos-7-6-18-10-apache-vim ~$ll testdb
total 36
drwxr-xr-x. 3 apache apache 4096  5月 16 19:20 ./
drwx------. 1 apache apache 4096  5月 16 19:16 ../
-rw-rw-r--. 1 apache apache    0  5月 16 19:16 .merovingian_lock
-rw-rw-r--. 1 apache apache  122  5月 16 19:16 .merovingian_properties
-rw-------. 1 apache apache 5276  5月 16 19:24 merovingian.log
-rw-rw-r--. 1 apache apache    6  5月 16 19:16 merovingian.pid
drwx------. 4 apache apache 4096  5月 16 19:21 voc/
```


monetdbユーザ以外を作成

monetdbユーザーはデフォルトで存在している

```
CREATE USER "voc" WITH PASSWORD 'voc' NAME 'VOC Explorer' SCHEMA "sys";
CREATE SCHEMA "voc" AUTHORIZATION "voc";
ALTER USER "voc" SET SCHEMA "voc";
```


```
apache doc-centos-7-6-18-10-apache-vim ~$mclient -u monetdb -d voc
password:
Welcome to mclient, the MonetDB/SQL interactive terminal (Nov2019-SP3)
Database: MonetDB v11.35.19 (Nov2019-SP3), 'mapi:monetdb://doc-centos-7-6-18-10-apache-vim:50000/voc'
FOLLOW US on https://twitter.com/MonetDB or https://github.com/MonetDB/MonetDB
Type \q to quit, \? for a list of available commands
auto commit mode: on
sql>
sql>
sql>CREATE USER "voc" WITH PASSWORD 'voc' NAME 'VOC Explorer' SCHEMA "sys";
operation successful
sql>CREATE SCHEMA "voc" AUTHORIZATION "voc";
operation successful
sql>ALTER USER "voc" SET SCHEMA "voc";
operation successful
sql>\q
```



ログインユーザー単位でテーブル作成できるそう

```
apache doc-centos-7-6-18-10-apache-vim ~$mclient -u voc -d voc
password:
Welcome to mclient, the MonetDB/SQL interactive terminal (Nov2019-SP3)
Database: MonetDB v11.35.19 (Nov2019-SP3), 'mapi:monetdb://doc-centos-7-6-18-10-apache-vim:50000/voc'
FOLLOW US on https://twitter.com/MonetDB or https://github.com/MonetDB/MonetDB
Type \q to quit, \? for a list of available commands
auto commit mode: on
sql>START TRANSACTION;
auto commit mode: off
sql>CREATE TABLE test (id int, data varchar(30));
operation successful
sql>\d
TABLE  voc.test
sql>\d test
CREATE TABLE "voc"."test" (
	"id"   INTEGER,
	"data" VARCHAR(30)
);
sql>CREATE TABLE "voc"."test" ("id" int, "data" varchar(30));
CREATE TABLE: name 'test' already in use
sql>ROLLBACK;
auto commit mode: on
sql>\d
sql>\q
```



ダンプデータを投入



```
$curl -sSLO http://dev.monetdb.org/Assets/VOC/voc_dump.sql.gz

$gunzip voc_dump.sql.gz

```

なかみ

```
apache doc-centos-7-6-18-10-apache-vim ~$head -n30 voc_dump.sql
START TRANSACTION;

CREATE TABLE "voyages" (
	"number"            integer	NOT NULL,
	"number_sup"        char(1)	NOT NULL,
	"trip"              integer,
	"trip_sup"          char(1),
	"boatname"          varchar(50),
	"master"            varchar(50),
	"tonnage"           integer,
	"type_of_boat"      varchar(30),
	"built"             varchar(15),
	"bought"            varchar(15),
	"hired"             varchar(15),
	"yard"              char(1),
	"chamber"           char(1),
	"departure_date"    date,
	"departure_harbour" varchar(30),
	"cape_arrival"      date,
	"cape_departure"    date,
	"cape_call"         boolean,
	"arrival_date"      date,
	"arrival_harbour"   varchar(30),
	"next_voyage"       integer,
	"particulars"       varchar(1285)
);

INSERT INTO "voyages" VALUES (1, '', 1, '', 'AMSTERDAM', 'Jan Jakobsz. Schellinger', 260, NULL, '1594', NULL, NULL, 'A', NULL, '1595-04-02', 'Texel', NULL, NULL, true, '1596-06-06', 'Engano', NULL, 'from 04-08 till 11-08 in the Mosselbaai; from 13-09 till 07-10 in the Ampalazabaai; from 09-10 till 13-12 in S. Augustins Bay, where before departure 127 of the 249 men were still alive; 11-01 till 21-01 at Ste. Marie I.; from 23-01 till 12-02 in the Bay of Antongil. The AMSTERDAM was set on fire near Bawean, 11-01-1597.');
INSERT INTO "voyages" VALUES (2, '', 1, '', 'DUIFJE', 'Simon Lambrechtsz. Mau', 50, 'pinas', '1594', NULL, NULL, 'A', NULL, '1595-04-02', 'Texel', NULL, NULL, true, '1596-06-06', 'Engano', 5001, 'HOLLANDIA on 26-10-1595; he was succeeded by Hendrik Jansz.');
INSERT INTO "voyages" VALUES (3, '', 1, '', 'HOLLANDIA', 'Jan Dignumsz. van Kwadijk+', 460, NULL, '1594', NULL, NULL, 'A', NULL, '1595-04-02', 'Texel', NULL, NULL, true, '1596-06-06', 'Engano', 5002, 'Jan Dignumsz. died on 29-05-1595 and Mau was his successor.');

```



```
apache doc-centos-7-6-18-10-apache-vim ~$tail -n30 voc_dump.sql
INSERT INTO "total" VALUES (8392, '', 1, '', 125, 1, NULL, NULL, NULL, NULL);
INSERT INTO "total" VALUES (8393, '', 1, '', 103, 1, 1, NULL, NULL, NULL);
INSERT INTO "total" VALUES (8394, '', 1, '', 100, 2, 3, NULL, NULL, NULL);
INSERT INTO "total" VALUES (8395, '', 2, '', 107, NULL, 3, NULL, NULL, NULL);
INSERT INTO "total" VALUES (8398, '', 2, '', 40, NULL, NULL, NULL, NULL, NULL);

ALTER TABLE "voyages" ADD PRIMARY KEY ("number", "number_sup");
ALTER TABLE "craftsmen" ADD PRIMARY KEY ("number", "number_sup");
ALTER TABLE "impotenten" ADD PRIMARY KEY ("number", "number_sup");
ALTER TABLE "passengers" ADD PRIMARY KEY ("number", "number_sup");
ALTER TABLE "seafarers" ADD PRIMARY KEY ("number", "number_sup");
ALTER TABLE "soldiers" ADD PRIMARY KEY ("number", "number_sup");
ALTER TABLE "total" ADD PRIMARY KEY ("number", "number_sup");

ALTER TABLE "craftsmen" ADD FOREIGN KEY ("number", "number_sup")
	REFERENCES "voyages" ("number", "number_sup");
ALTER TABLE "impotenten" ADD FOREIGN KEY ("number", "number_sup")
	REFERENCES "voyages" ("number", "number_sup");
ALTER TABLE "invoices" ADD FOREIGN KEY ("number", "number_sup")
	REFERENCES "voyages" ("number", "number_sup");
ALTER TABLE "passengers" ADD FOREIGN KEY ("number", "number_sup")
	REFERENCES "voyages" ("number", "number_sup");
ALTER TABLE "seafarers" ADD FOREIGN KEY ("number", "number_sup")
	REFERENCES "voyages" ("number", "number_sup");
ALTER TABLE "soldiers" ADD FOREIGN KEY ("number", "number_sup")
	REFERENCES "voyages" ("number", "number_sup");
ALTER TABLE "total" ADD FOREIGN KEY ("number", "number_sup")
	REFERENCES "voyages" ("number", "number_sup");

COMMIT;

```



いざ投入

標準出力はミュートしておいたほうがいいかも


```

$mclient -u voc -d voc < voc_dump.sql

1 affected row
1 affected row
operation successful
operation successful
operation successful
operation successful
operation successful
operation successful
operation successful
operation successful
operation successful
operation successful
operation successful
operation successful
operation successful
operation successful
auto commit mode: on

```


確認

ログインユーザーのvocにテーブルが紐付いているので、ユーザー名はテーブル名を指定する際に省略できる模様

```
apache doc-centos-7-6-18-10-apache-vim ~$mclient -u voc -d voc
password:
Welcome to mclient, the MonetDB/SQL interactive terminal (Nov2019-SP3)
Database: MonetDB v11.35.19 (Nov2019-SP3), 'mapi:monetdb://doc-centos-7-6-18-10-apache-vim:50000/voc'
FOLLOW US on https://twitter.com/MonetDB or https://github.com/MonetDB/MonetDB
Type \q to quit, \? for a list of available commands
auto commit mode: on
sql>\d
TABLE  voc.craftsmen
TABLE  voc.impotenten
TABLE  voc.invoices
TABLE  voc.passengers
TABLE  voc.seafarers
TABLE  voc.soldiers
TABLE  voc.total
TABLE  voc.voyages

sql>SELECT count(*) FROM voyages;
+------+
| L2   |
+======+
| 8131 |
+------+
1 tuple
sql>SELECT count(*) FROM craftsmen;
+------+
| L2   |
+======+
| 2349 |
+------+
1 tuple
sql>SELECT count(*) FROM soldiers;
+------+
| L2   |
+======+
| 4177 |
+------+
1 tuple

```

[さーばー用途](https://www.monetdb.org/Documentation/monetdbd)


```
apache doc-centos-7-6-18-10-apache-vim ~$lsof -i:50000
COMMAND    PID   USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
monetdbd 17030 apache   17u  IPv4 27443113      0t0  TCP localhost:50000 (LISTEN)
monetdbd 17030 apache   19u  IPv4 27443119      0t0  UDP localhost:50000
```

溶け込んでいる感じがあってR、pythonなどのバンドルもあってかるくていい感じ


ユーザー定義関数のバリエーションがすごいcppもかけるらしい

なによりサンプルが丁寧

https://www.monetdb.org/blog/JIT_C_C%252B%252B_UDFs_in_MonetDB


with select句もある

https://www.monetdb.org/Documentation/Manuals/SQLreference/SQLSyntaxOverview


バンドル数おおいな
csharpとかからも接続できそう
https://www.monetdb.org/Documentation/Manuals/SQLreference/Programming

カラムナデータベースでハンディなデータベースと出会えたような気がする。


コンパクトすぎてすごい


pythonバインドの使用例

https://github.com/MonetDB/MonetDBLite-Python

Rバインドの使用例

https://github.com/hannesmuehleisen/MonetDBLite-R


javaバインドの使用例

https://www.monetdb.org/blog/monetdblite-for-java

