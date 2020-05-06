- IN

```
$cat import-tsv.sh
#!/usr/bin/env bash

INPUT_SUFFIX=.tsv
OUTPUT_SUFFIX=_tbl

cp $HOME/.sqliterc $HOME/.sqliterc.bk

#-initオプションにファイルを指定しなければ、デフォルトで.sqlitercが読み込まれる
#メタ定義投入時の設定パラメータ
cat <<EOS >$HOME/.sqliterc

.mode column
.headers on
.width 0
.timer on
.nullvalue "NULL"
.prompt "sqlite>>>"
.separator \t

EOS

sqlite3 testdb < init.sql

#データ投入時の設定パラメータ
cat <<EOS >$HOME/.sqliterc

.mode column
.headers on
.width 0
.timer on
.nullvalue "NULL"
.prompt "sqlite>>>"
.separator \t

EOS

ls *$INPUT_SUFFIX | while read t;do echo .import $t ${t//.*/$OUTPUT_SUFFIX};done >>$HOME/.sqliterc

sqlite3 testdb < healthcheck.sql

cp $HOME/.sqliterc.bk $HOME/.sqliterc

rm $HOME/.sqliterc.bk
```


- CMD
  - メタ
```
$cat init.sql
drop table test_tbl;

create table test_tbl (
  id text
  ,item text
  ,qty int
  ,dtm date
);

drop table test1_tbl;

create table test1_tbl (
  id text
  ,item text
  ,qty int
  ,dtm date
);

drop table test2_tbl;

create table test2_tbl (
  id text
  ,item text
  ,qty int
  ,dtm date
);

drop table test3_tbl;

create table test3_tbl (
  id text
  ,item text
  ,qty int
  ,dtm date
);

select * from PRAGMA_table_info('test_tbl');
select * from PRAGMA_table_info('test1_tbl');
select * from PRAGMA_table_info('test2_tbl');
select * from PRAGMA_table_info('test3_tbl');
```

  - メタじゃない

```
$cat healthcheck.sql
select 'test_tbl',count(*) from test_tbl;
select 'test_tbl',* from test_tbl;

select 'test1_tbl',count(*) from test1_tbl;
select 'test1_tbl',* from test1_tbl;

select 'test2_tbl',count(*) from test2_tbl;
select 'test2_tbl',* from test2_tbl;

select 'test3_tbl',count(*) from test3_tbl;
select 'test3_tbl',* from test3_tbl;
```

- OUT

```
$./import-tsv.sh
Run Time: real 0.005 user 0.000000 sys 0.000489
Run Time: real 0.006 user 0.000197 sys 0.000166
Run Time: real 0.005 user 0.000192 sys 0.000096
Run Time: real 0.005 user 0.000219 sys 0.000109
Run Time: real 0.005 user 0.000255 sys 0.000127
Run Time: real 0.005 user 0.000381 sys 0.000190
Run Time: real 0.005 user 0.000000 sys 0.000943
Run Time: real 0.007 user 0.000410 sys 0.000663
cid         name        type        notnull     dflt_value  pk
----------  ----------  ----------  ----------  ----------  ----------
0           id          text        0           NULL        0
1           item        text        0           NULL        0
2           qty         int         0           NULL        0
3           dtm         date        0           NULL        0
Run Time: real 0.001 user 0.000248 sys 0.000248
cid         name        type        notnull     dflt_value  pk
----------  ----------  ----------  ----------  ----------  ----------
0           id          text        0           NULL        0
1           item        text        0           NULL        0
2           qty         int         0           NULL        0
3           dtm         date        0           NULL        0
Run Time: real 0.000 user 0.000294 sys 0.000000
cid         name        type        notnull     dflt_value  pk
----------  ----------  ----------  ----------  ----------  ----------
0           id          text        0           NULL        0
1           item        text        0           NULL        0
2           qty         int         0           NULL        0
3           dtm         date        0           NULL        0
Run Time: real 0.001 user 0.000199 sys 0.000000
cid         name        type        notnull     dflt_value  pk
----------  ----------  ----------  ----------  ----------  ----------
0           id          text        0           NULL        0
1           item        text        0           NULL        0
2           qty         int         0           NULL        0
3           dtm         date        0           NULL        0
Run Time: real 0.000 user 0.000000 sys 0.000208
'test_tbl'  count(*)
----------  ----------
test_tbl    20
Run Time: real 0.000 user 0.000000 sys 0.000271
'test_tbl'  id          item             qty         dtm
----------  ----------  ---------------  ----------  -------------------
test_tbl    1           zP50WCUWSfIfcYE  8           2020-05-07T22:03:46
test_tbl    2           zV               5           2020-05-08T22:03:46
test_tbl    3           MP1chAABGJ0zjJI  10          2020-05-09T22:03:46
test_tbl    4           4RtxSqpYJgPdkF3  7           2020-05-10T22:03:46
test_tbl    5           D                13          2020-05-11T22:03:46
test_tbl    6           CrI2GWDu6m       9           2020-05-12T22:03:46
test_tbl    7           XNK9I7G0mLgseNj  7           2020-05-13T22:03:46
test_tbl    8           CtSC3tcUTq       14          2020-05-14T22:03:46
test_tbl    9           rBfv0lZTuIr      14          2020-05-15T22:03:46
test_tbl    10          XWGy1W           12          2020-05-16T22:03:46
test_tbl    11          44CmDMvtQC9Pssd  19          2020-05-17T22:03:46
test_tbl    12          M                12          2020-05-18T22:03:46
test_tbl    13          ORLS3wT0Dhb2     20          2020-05-19T22:03:46
test_tbl    14          gSrv0W5l8Ebw5hU  18          2020-05-20T22:03:46
test_tbl    15          soTpp84BGoxYdon  22          2020-05-21T22:03:46
test_tbl    16          0K1f1y           25          2020-05-22T22:03:46
test_tbl    17          YfXnTL46IMaHZSz  26          2020-05-23T22:03:46
test_tbl    18          2idClDX6fTJnuji  23          2020-05-24T22:03:46
test_tbl    19          EtiZkKxR5ghq0Cs  21          2020-05-25T22:03:46
test_tbl    20          WDSE             22          2020-05-26T22:03:46
Run Time: real 0.001 user 0.000000 sys 0.000566
'test1_tbl'  count(*)
-----------  ----------
test1_tbl    20
Run Time: real 0.000 user 0.000000 sys 0.000158
'test1_tbl'  id          item        qty         dtm
-----------  ----------  ----------  ----------  -------------------
test1_tbl    1           brW         3           2020-05-07T22:48:55
test1_tbl    2           Nyf7VpnZCR  11          2020-05-08T22:48:55
test1_tbl    3           XZmZtyapEA  8           2020-05-09T22:48:55
test1_tbl    4           hcleqfl     13          2020-05-10T22:48:55
test1_tbl    5           UOjL8fun    14          2020-05-11T22:48:55
test1_tbl    6           nbtez3hXjn  6           2020-05-12T22:48:55
test1_tbl    7           tqlM3eFWPr  11          2020-05-13T22:48:55
test1_tbl    8           T75TPDaxYP  13          2020-05-14T22:48:55
test1_tbl    9           vwQSx3uI    10          2020-05-15T22:48:55
test1_tbl    10          xGDWKfpNQa  19          2020-05-16T22:48:55
test1_tbl    11          cJ6xSZuZ1J  17          2020-05-17T22:48:55
test1_tbl    12          L4OFToOZ6t  20          2020-05-18T22:48:55
test1_tbl    13          Wn5Us       17          2020-05-19T22:48:55
test1_tbl    14          yDVeJzfTuo  22          2020-05-20T22:48:55
test1_tbl    15          5K          17          2020-05-21T22:48:55
test1_tbl    16          kD76XS      23          2020-05-22T22:48:55
test1_tbl    17          qP901NlR7K  18          2020-05-23T22:48:55
test1_tbl    18          30xYvQ      23          2020-05-24T22:48:55
test1_tbl    19          rHqfEtHdjn  21          2020-05-25T22:48:55
test1_tbl    20          w7T7N       25          2020-05-26T22:48:55
Run Time: real 0.002 user 0.000000 sys 0.000547
'test2_tbl'  count(*)
-----------  ----------
test2_tbl    20
Run Time: real 0.000 user 0.000000 sys 0.000147
'test2_tbl'  id          item        qty         dtm
-----------  ----------  ----------  ----------  -------------------
test2_tbl    1           tP189       9           2020-05-07T22:48:55
test2_tbl    2           kc9InbKAr   10          2020-05-08T22:48:55
test2_tbl    3           pcUp0VcIvl  5           2020-05-09T22:48:55
test2_tbl    4           YqNv7AiZ8C  5           2020-05-10T22:48:55
test2_tbl    5           J71IHI63KQ  10          2020-05-11T22:48:55
test2_tbl    6           HRoaesft8x  10          2020-05-12T22:48:55
test2_tbl    7           KVmOmDCh    13          2020-05-13T22:48:55
test2_tbl    8           DW7h7SaGFa  8           2020-05-14T22:48:55
test2_tbl    9           88MXDbIfjv  11          2020-05-15T22:48:55
test2_tbl    10          dW6X9E5Fct  19          2020-05-16T22:48:55
test2_tbl    11          UAvH9lQY8I  12          2020-05-17T22:48:55
test2_tbl    12          t7wJ8fkO2G  12          2020-05-18T22:48:55
test2_tbl    13          DYaoz7tEAc  17          2020-05-19T22:48:55
test2_tbl    14          EirVYpBNdW  19          2020-05-20T22:48:55
test2_tbl    15          DyPFvc3w1M  24          2020-05-21T22:48:55
test2_tbl    16          IygNimOUkO  16          2020-05-22T22:48:55
test2_tbl    17          u3dEjOmLrs  21          2020-05-23T22:48:55
test2_tbl    18          753QHBFmgs  19          2020-05-24T22:48:55
test2_tbl    19          zLH8b1x5tY  27          2020-05-25T22:48:55
test2_tbl    20          gSuMMP6m2S  22          2020-05-26T22:48:55
Run Time: real 0.001 user 0.000000 sys 0.000498
'test3_tbl'  count(*)
-----------  ----------
test3_tbl    20
Run Time: real 0.000 user 0.000000 sys 0.000139
'test3_tbl'  id          item                            qty         dtm
-----------  ----------  ------------------------------  ----------  -------------------
test3_tbl    1           tG4EGqBD5v5p6jYj3r3qNflKVFUBvt  3           2020-05-07T22:48:55
test3_tbl    2           mRRROpiJ2BhgB                   9           2020-05-08T22:48:55
test3_tbl    3           cJzkifM6TcAFuDZe5gu             3           2020-05-09T22:48:55
test3_tbl    4           V                               5           2020-05-10T22:48:55
test3_tbl    5           C8ZgQ2G99mjce                   8           2020-05-11T22:48:55
test3_tbl    6           5bLU2osHxor1Ms0fRRe18z9NVMuyhA  14          2020-05-12T22:48:55
test3_tbl    7           EXLyG9k4HA                      14          2020-05-13T22:48:55
test3_tbl    8           mFwXua74uI3P00PWoQh7jxomXtm     11          2020-05-14T22:48:55
test3_tbl    9           lN5ks0Y20QsBnfI0nK9pUx6         17          2020-05-15T22:48:55
test3_tbl    10          UAmHXBUPOxo                     11          2020-05-16T22:48:55
test3_tbl    11          VgoDefrEJR7Nx9                  14          2020-05-17T22:48:55
test3_tbl    12          J                               20          2020-05-18T22:48:55
test3_tbl    13          psKOYtaafrgDw1Kmsu              20          2020-05-19T22:48:55
test3_tbl    14          cEVGfmMl53in5j4Px7JomSsML       16          2020-05-20T22:48:55
test3_tbl    15          yFT1GhqU442y3ILyLeg             19          2020-05-21T22:48:55
test3_tbl    16          gTyubZOmyig                     19          2020-05-22T22:48:55
test3_tbl    17          bejfOVRiuCgAlq1I8qPgfCUr        17          2020-05-23T22:48:55
test3_tbl    18          I8qLJiiPev9RumZY3tWI9YtR        26          2020-05-24T22:48:55
test3_tbl    19          lsmOqKrgX                       27          2020-05-25T22:48:55
test3_tbl    20          ANYR4Vhnh38fq2qzB               22          2020-05-26T22:48:55
Run Time: real 0.001 user 0.000000 sys 0.000563
```
