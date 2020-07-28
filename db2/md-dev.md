- https://hub.docker.com/r/ibmcom/db2

手順書
- https://qiita.com/skkojiko/items/18bb013cee7ccd4fd3a6


グループ割付確認

- https://qiita.com/niiyz/items/53aa4195dcc69db2052b

作業ユーザはdb2inst1で

```
[root@27fe750bd26e /]# su db2inst1
```

サンプルデータベースに接続
```
[db2inst1@27fe750bd26e /]$ db2 connect to sample

   Database Connection Information

 Database server        = DB2/LINUXX8664 11.5.0.0
 SQL authorization ID   = DB2INST1
 Local database alias   = SAMPLE
```


テーブルリスト確認
```
[db2inst1@27fe750bd26e /]$ db2 list tables

Table/View                      Schema          Type  Creation time
------------------------------- --------------- ----- --------------------------
ACT                             DB2INST1        T     2020-02-17-00.26.32.622827
ADEFUSR                         DB2INST1        S     2020-02-17-00.26.34.487513
CATALOG                         DB2INST1        T     2020-02-17-00.26.37.566257
CL_SCHED                        DB2INST1        T     2020-02-17-00.26.30.008574
CUSTOMER                        DB2INST1        T     2020-02-17-00.26.36.636188
DEPARTMENT                      DB2INST1        T     2020-02-17-00.26.30.144603
DEPT                            DB2INST1        A     2020-02-17-00.26.30.478921
EMP                             DB2INST1        A     2020-02-17-00.26.30.798179
EMPACT                          DB2INST1        A     2020-02-17-00.26.32.619645
EMPLOYEE                        DB2INST1        T     2020-02-17-00.26.30.481034
EMPMDC                          DB2INST1        T     2020-02-17-00.26.34.850516
EMPPROJACT                      DB2INST1        T     2020-02-17-00.26.32.478309
EMP_ACT                         DB2INST1        A     2020-02-17-00.26.32.621360
EMP_PHOTO                       DB2INST1        T     2020-02-17-00.26.30.799749
EMP_RESUME                      DB2INST1        T     2020-02-17-00.26.31.336386
INVENTORY                       DB2INST1        T     2020-02-17-00.26.36.355639
IN_TRAY                         DB2INST1        T     2020-02-17-00.26.32.926732
ORG                             DB2INST1        T     2020-02-17-00.26.33.063819
PRODUCT                         DB2INST1        T     2020-02-17-00.26.35.909239
PRODUCTSUPPLIER                 DB2INST1        T     2020-02-17-00.26.38.473863
PROJ                            DB2INST1        A     2020-02-17-00.26.32.190645
PROJACT                         DB2INST1        T     2020-02-17-00.26.32.192458
PROJECT                         DB2INST1        T     2020-02-17-00.26.31.857329
PURCHASEORDER                   DB2INST1        T     2020-02-17-00.26.37.073382
SALES                           DB2INST1        T     2020-02-17-00.26.33.315710
STAFF                           DB2INST1        T     2020-02-17-00.26.33.192609
STAFFG                          DB2INST1        T     2020-02-17-00.26.34.107313
SUPPLIERS                       DB2INST1        T     2020-02-17-00.26.38.032147
VACT                            DB2INST1        V     2020-02-17-00.26.33.472616
VASTRDE1                        DB2INST1        V     2020-02-17-00.26.33.513841
VASTRDE2                        DB2INST1        V     2020-02-17-00.26.33.523245
VDEPMG1                         DB2INST1        V     2020-02-17-00.26.33.493296
VDEPT                           DB2INST1        V     2020-02-17-00.26.33.433647
VEMP                            DB2INST1        V     2020-02-17-00.26.33.458206
VEMPDPT1                        DB2INST1        V     2020-02-17-00.26.33.503484
VEMPLP                          DB2INST1        V     2020-02-17-00.26.33.609464
VEMPPROJACT                     DB2INST1        V     2020-02-17-00.26.33.486210
VFORPLA                         DB2INST1        V     2020-02-17-00.26.33.564920
VHDEPT                          DB2INST1        V     2020-02-17-00.26.33.449905
VPHONE                          DB2INST1        V     2020-02-17-00.26.33.600671
VPROJ                           DB2INST1        V     2020-02-17-00.26.33.463222
VPROJACT                        DB2INST1        V     2020-02-17-00.26.33.477729
VPROJRE1                        DB2INST1        V     2020-02-17-00.26.33.534204
VPSTRDE1                        DB2INST1        V     2020-02-17-00.26.33.545695
VPSTRDE2                        DB2INST1        V     2020-02-17-00.26.33.554925
VSTAFAC1                        DB2INST1        V     2020-02-17-00.26.33.575769
VSTAFAC2                        DB2INST1        V     2020-02-17-00.26.33.591480

  47 record(s) selected.
```


バージョン確認
```
[db2inst1@27fe750bd26e /]$ cat /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"

[db2inst1@27fe750bd26e /]$ cat /etc/redhat-release
CentOS Linux release 7.6.1810 (Core)
```

登録サービスの確認
```
[root@27fe750bd26e /]# cat /etc/services | grep db2
ibm-db2         523/tcp                 # IBM-DB2
ibm-db2         523/udp                 # IBM-DB2
questdb2-lnchr  5677/tcp                # Quest Central DB2 Launchr
questdb2-lnchr  5677/udp                # Quest Central DB2 Launchr
qdb2service     45825/tcp               # Qpuncture Data Access Service
qdb2service     45825/udp               # Qpuncture Data Access Service
DB2_db2inst1	60000/tcp
DB2_db2inst1_1	60001/tcp
DB2_db2inst1_2	60002/tcp
DB2_db2inst1_3	60003/tcp
DB2_db2inst1_4	60004/tcp
DB2_db2inst1_END	60005/tcp
db2c_db2inst1	50000/tcp
```

db2プロンプトに入る
```
[db2inst1@27fe750bd26e /]$ db2
(c) Copyright IBM Corporation 1993,2007
Command Line Processor for DB2 Client 11.5.0.0

You can issue database manager commands and SQL statements from the command
prompt. For example:
    db2 => connect to sample
    db2 => bind sample.bnd

For general help, type: ?.
For command help, type: ? command, where command can be
the first few keywords of a database manager command. For example:
 ? CATALOG DATABASE for help on the CATALOG DATABASE command
 ? CATALOG          for help on all of the CATALOG commands.

To exit db2 interactive mode, type QUIT at the command prompt. Outside
interactive mode, all commands must be prefixed with 'db2'.
To list the current command option settings, type LIST COMMAND OPTIONS.

For more detailed help, refer to the Online Reference Manual.
```


サンプルデータベースに接続
```
db2 => connect to sample

   Database Connection Information

 Database server        = DB2/LINUXX8664 11.5.0.0
 SQL authorization ID   = DB2INST1
 Local database alias   = SAMPLE

db2 => select count(*) from ACT;

1
-----------
         18

  1 record(s) selected.
```

- https://fujishinko.exblog.jp/7853530/


テーブルリスト確認
```
db2 => list tables

Table/View                      Schema          Type  Creation time
------------------------------- --------------- ----- --------------------------
ACT                             DB2INST1        T     2020-02-17-00.26.32.622827
ADEFUSR                         DB2INST1        S     2020-02-17-00.26.34.487513
CATALOG                         DB2INST1        T     2020-02-17-00.26.37.566257
CL_SCHED                        DB2INST1        T     2020-02-17-00.26.30.008574
CUSTOMER                        DB2INST1        T     2020-02-17-00.26.36.636188
DEPARTMENT                      DB2INST1        T     2020-02-17-00.26.30.144603
DEPT                            DB2INST1        A     2020-02-17-00.26.30.478921
EMP                             DB2INST1        A     2020-02-17-00.26.30.798179
EMPACT                          DB2INST1        A     2020-02-17-00.26.32.619645
EMPLOYEE                        DB2INST1        T     2020-02-17-00.26.30.481034
EMPMDC                          DB2INST1        T     2020-02-17-00.26.34.850516
EMPPROJACT                      DB2INST1        T     2020-02-17-00.26.32.478309
EMP_ACT                         DB2INST1        A     2020-02-17-00.26.32.621360
EMP_PHOTO                       DB2INST1        T     2020-02-17-00.26.30.799749
EMP_RESUME                      DB2INST1        T     2020-02-17-00.26.31.336386
INVENTORY                       DB2INST1        T     2020-02-17-00.26.36.355639
IN_TRAY                         DB2INST1        T     2020-02-17-00.26.32.926732
ORG                             DB2INST1        T     2020-02-17-00.26.33.063819
PRODUCT                         DB2INST1        T     2020-02-17-00.26.35.909239
PRODUCTSUPPLIER                 DB2INST1        T     2020-02-17-00.26.38.473863
PROJ                            DB2INST1        A     2020-02-17-00.26.32.190645
PROJACT                         DB2INST1        T     2020-02-17-00.26.32.192458
PROJECT                         DB2INST1        T     2020-02-17-00.26.31.857329
PURCHASEORDER                   DB2INST1        T     2020-02-17-00.26.37.073382
SALES                           DB2INST1        T     2020-02-17-00.26.33.315710
STAFF                           DB2INST1        T     2020-02-17-00.26.33.192609
STAFFG                          DB2INST1        T     2020-02-17-00.26.34.107313
SUPPLIERS                       DB2INST1        T     2020-02-17-00.26.38.032147
VACT                            DB2INST1        V     2020-02-17-00.26.33.472616
VASTRDE1                        DB2INST1        V     2020-02-17-00.26.33.513841
VASTRDE2                        DB2INST1        V     2020-02-17-00.26.33.523245
VDEPMG1                         DB2INST1        V     2020-02-17-00.26.33.493296
VDEPT                           DB2INST1        V     2020-02-17-00.26.33.433647
VEMP                            DB2INST1        V     2020-02-17-00.26.33.458206
VEMPDPT1                        DB2INST1        V     2020-02-17-00.26.33.503484
VEMPLP                          DB2INST1        V     2020-02-17-00.26.33.609464
VEMPPROJACT                     DB2INST1        V     2020-02-17-00.26.33.486210
VFORPLA                         DB2INST1        V     2020-02-17-00.26.33.564920
VHDEPT                          DB2INST1        V     2020-02-17-00.26.33.449905
VPHONE                          DB2INST1        V     2020-02-17-00.26.33.600671
VPROJ                           DB2INST1        V     2020-02-17-00.26.33.463222
VPROJACT                        DB2INST1        V     2020-02-17-00.26.33.477729
VPROJRE1                        DB2INST1        V     2020-02-17-00.26.33.534204
VPSTRDE1                        DB2INST1        V     2020-02-17-00.26.33.545695
VPSTRDE2                        DB2INST1        V     2020-02-17-00.26.33.554925
VSTAFAC1                        DB2INST1        V     2020-02-17-00.26.33.575769
VSTAFAC2                        DB2INST1        V     2020-02-17-00.26.33.591480

  47 record(s) selected.
```

DB2インスタンスの停止

```
[db2inst1@27fe750bd26e /]$ db2 db2stop
SQL1025N  The database manager was not stopped because databases are still
active.
[db2inst1@27fe750bd26e /]$ db2 force applications all
DB20000I  The FORCE APPLICATION command completed successfully.
DB21024I  This command is asynchronous and may not be effective immediately.

[db2inst1@27fe750bd26e /]$ db2 db2stop
DB20000I  The DB2STOP command completed successfully.
```

DB2インスタンスの起動
```
[db2inst1@27fe750bd26e /]$ db2 db2start
DB20000I  The DB2START command completed successfully.
```

データベース作成
```
[db2inst1@27fe750bd26e /]$ time db2 create database test_db
DB20000I  The CREATE DATABASE command completed successfully.

real	1m7.606s
user	0m0.014s
sys	0m0.011s
```

データベース接続

- パスワードはdb2instユーザに設定したもの

- db2inst_pwd

```
db2 => connect to test_db user db2inst1
Enter current password for db2inst1:

   Database Connection Information

 Database server        = DB2/LINUXX8664 11.5.0.0
 SQL authorization ID   = DB2INST1
 Local database alias   = TEST_DB
```

テーブル作成

```
db2 => list tables

Table/View                      Schema          Type  Creation time
------------------------------- --------------- ----- --------------------------

  0 record(s) selected.

db2 =>

db2 => create table test_tbl(col1 varchar(100));
DB20000I  The SQL command completed successfully.
db2 => list tables

Table/View                      Schema          Type  Creation time
------------------------------- --------------- ----- --------------------------
TEST_TBL                        DB2INST1        T     2020-02-22-12.41.01.000895

  1 record(s) selected.
```

データ投入
```
db2 => insert into test_tbl(col1)values('a');
DB20000I  The SQL command completed successfully.
db2 => commit;
DB20000I  The SQL command completed successfully.
```

データ確認
```
db2 => select * from test_tbl;

COL1
----------------------------------------------------------------------------------------------------
a

  1 record(s) selected.
```

コマンドラインから実施
```
[db2inst1@27fe750bd26e /]$ db2 connect to test_db user db2inst1
Enter current password for db2inst1:

   Database Connection Information

 Database server        = DB2/LINUXX8664 11.5.0.0
 SQL authorization ID   = DB2INST1
 Local database alias   = TEST_DB


[db2inst1@27fe750bd26e /]$ db2 "select * from test_tbl;"

COL1
----------------------------------------------------------------------------------------------------
a

  1 record(s) selected.
```

エクスポート

- http://blog.livedoor.jp/asamts1102-database/archives/49811260.html
- https://www.ibm.com/developerworks/jp/data/library/dataserver/j-d_db2bestpractice05/index.html
- https://qiita.com/sooogle/items/95d88facaf31f010ea05

```
[db2inst1@27fe750bd26e /]$ db2 export to /tmp/all-testtbl of del "select * from test_tbl"
SQL3104N  The Export utility is beginning to export data to file
"/tmp/all-testtbl".

SQL3105N  The Export utility has finished exporting "1" rows.


Number of rows exported: 1

[db2inst1@27fe750bd26e /]$ ls -lh /tmp/all-testtbl
-rw-r--r--. 1 db2inst1 db2iadm1 4 Feb 22 12:57 /tmp/all-testtbl

[db2inst1@27fe750bd26e /]$ cat /tmp/all-testtbl
"a"
```

