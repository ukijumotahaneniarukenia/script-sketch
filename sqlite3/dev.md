# サンプルデータ作成

コマンドライン上で操作する際、インポートファイルが存在しない作業ディレクトリへ移動すると、テーブルメモリから消去されるので、
インポートしてゴニョゴニョしたらエクスポートするのを忘れずに。

100万件のデータ

ダミーデータではダブルクヲートとシングルクヲートを排除しておく

```
echo "cat /dev/urandom | base64 -w0 | fold -w 10 | paste $(seq 3 | xargs -I@ echo - | xargs) | head -n1000000" | sh | perl -pe 's/\x22|\x27//g'>test-1000000.tsv
```

# インポート

## csvファイルの場合

### 単一ファイル

ヘッダ行あり
```
$head test.csv
"col1","col2","col3"
TZi0viSLAJ,vGy3pFZDyo,Mv3VxwRRLR
8qVtso1oU4,8t7LiuxONh,z7eUuNYmFv
qSH9Kv8ogH,/56H1yXQRx,BMeKDZkm7R
Xym5Ip7e+y,TcZXdX6Oou,LYwctbv5B6
JLRsTUVBPG,7aMaq9zxOA,7iP1UfidkL
PwdSxxZAyd,isLkfpDWA5,X/TWQTbkYp
dxzM3k9LSP,yKf4hupF8s,IzliufCXF6
z5vWCaTrwF,VumFwHl6TH,D+Dh93+dRc
MbrZwRsw90,nGlUNmoR8H,lSsfZPTrZ5
```

取込

```
$sqlite3 testdb -separator , ".import test.csv test_tbl"
```

確認

```

$sqlite3 testdb
-- Loading resources from /home/kuraine/.sqliterc
SQLite version 3.30.0 2019-10-04 15:03:17
Enter ".help" for usage hints.
sqlite>>>select count(*) from test_tbl;
count(*)
----------
1000000
Run Time: real 0.017 user 0.006331 sys 0.011142
sqlite>>>select * from test_tbl limit 10;
col1        col2        col3
----------  ----------  ----------
TZi0viSLAJ  vGy3pFZDyo  Mv3VxwRRLR
8qVtso1oU4  8t7LiuxONh  z7eUuNYmFv
qSH9Kv8ogH  /56H1yXQRx  BMeKDZkm7R
Xym5Ip7e+y  TcZXdX6Oou  LYwctbv5B6
JLRsTUVBPG  7aMaq9zxOA  7iP1UfidkL
PwdSxxZAyd  isLkfpDWA5  X/TWQTbkYp
dxzM3k9LSP  yKf4hupF8s  IzliufCXF6
z5vWCaTrwF  VumFwHl6TH  D+Dh93+dRc
MbrZwRsw90  nGlUNmoR8H  lSsfZPTrZ5
QvxliH4+K+  8arzTs/bYA  FD3ERLBwZ+
Run Time: real 0.001 user 0.000963 sys 0.000000
```


### 複数ファイル

```
$rm *chunk

$ls -lh test.csv
-rw-rw-r--. 1 kuraine kuraine 33M  2月 17 22:23 test.csv

$cat test.csv | split -l 100000 --numeric-suffixes=1 --suffix-length=3 --additional-suffix=.chunk - test-"$(date "+%Y-%m-%d")"-

$ls -lh *chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-001.chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-002.chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-003.chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-004.chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-005.chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-006.chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-007.chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-008.chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-009.chunk
-rw-rw-r--. 1 kuraine kuraine 3.3M  2月 17 22:51 test-2020-02-17-010.chunk
-rw-rw-r--. 1 kuraine kuraine   33  2月 17 22:51 test-2020-02-17-011.chunk

$head test-2020-02-17-001.chunk
"col1","col2","col3"
TZi0viSLAJ,vGy3pFZDyo,Mv3VxwRRLR
8qVtso1oU4,8t7LiuxONh,z7eUuNYmFv
qSH9Kv8ogH,/56H1yXQRx,BMeKDZkm7R
Xym5Ip7e+y,TcZXdX6Oou,LYwctbv5B6
JLRsTUVBPG,7aMaq9zxOA,7iP1UfidkL
PwdSxxZAyd,isLkfpDWA5,X/TWQTbkYp
dxzM3k9LSP,yKf4hupF8s,IzliufCXF6
z5vWCaTrwF,VumFwHl6TH,D+Dh93+dRc
MbrZwRsw90,nGlUNmoR8H,lSsfZPTrZ5
$head test-2020-02-17-011.chunk
WTEzT7Yj3e,P1Ls3ksHLj,P/CF3hkN1d

001ファイル目以外に先頭行へヘッダ行を追加

$ls *chunk | grep -v 001 | xargs -I@ sed -i '1i"col1","col2","col3"' @


確認
$grep -n -P '"col1","col2","col3"' *chunk
test-2020-02-17-001.chunk:1:"col1","col2","col3"
test-2020-02-17-002.chunk:1:"col1","col2","col3"
test-2020-02-17-003.chunk:1:"col1","col2","col3"
test-2020-02-17-004.chunk:1:"col1","col2","col3"
test-2020-02-17-005.chunk:1:"col1","col2","col3"
test-2020-02-17-006.chunk:1:"col1","col2","col3"
test-2020-02-17-007.chunk:1:"col1","col2","col3"
test-2020-02-17-008.chunk:1:"col1","col2","col3"
test-2020-02-17-009.chunk:1:"col1","col2","col3"
test-2020-02-17-010.chunk:1:"col1","col2","col3"
test-2020-02-17-011.chunk:1:"col1","col2","col3"

取込
$ls *chunk | while read tgt;do printf "sqlite3 testdb -separator , \".import %s %s\"\n" $tgt $(echo $tgt | perl -pe 's/-|\./_/g');done | sh

確認
with sub as(
select rowid as rn,"select "||"'"||name ||"' as tbl"||" ,count(*) as cnt from "||name as sni from sqlite_master
)select s1.sni || case when exists(select 1 from sub s2 where s1.rn<s2.rn) then ' union all' else ';' end  as build_sql from sub s1;


select 'test_2020_02_17_001_chunk' as tbl ,count(*) as cnt from test_2020_02_17_001_chunk union all
select 'test_2020_02_17_002_chunk' as tbl ,count(*) as cnt from test_2020_02_17_002_chunk union all
select 'test_2020_02_17_003_chunk' as tbl ,count(*) as cnt from test_2020_02_17_003_chunk union all
select 'test_2020_02_17_004_chunk' as tbl ,count(*) as cnt from test_2020_02_17_004_chunk union all
select 'test_2020_02_17_005_chunk' as tbl ,count(*) as cnt from test_2020_02_17_005_chunk union all
select 'test_2020_02_17_006_chunk' as tbl ,count(*) as cnt from test_2020_02_17_006_chunk union all
select 'test_2020_02_17_007_chunk' as tbl ,count(*) as cnt from test_2020_02_17_007_chunk union all
select 'test_2020_02_17_008_chunk' as tbl ,count(*) as cnt from test_2020_02_17_008_chunk union all
select 'test_2020_02_17_009_chunk' as tbl ,count(*) as cnt from test_2020_02_17_009_chunk union all
select 'test_2020_02_17_010_chunk' as tbl ,count(*) as cnt from test_2020_02_17_010_chunk union all
select 'test_2020_02_17_011_chunk' as tbl ,count(*) as cnt from test_2020_02_17_011_chunk;

ヘッダ行を考慮している模様

|tbl|cnt|
|:-:|:-:|
|test_2020_02_17_001_chunk|99,999|
|test_2020_02_17_002_chunk|100,000|
|test_2020_02_17_003_chunk|100,000|
|test_2020_02_17_004_chunk|100,000|
|test_2020_02_17_005_chunk|100,000|
|test_2020_02_17_006_chunk|100,000|
|test_2020_02_17_007_chunk|100,000|
|test_2020_02_17_008_chunk|100,000|
|test_2020_02_17_009_chunk|100,000|
|test_2020_02_17_010_chunk|100,000|
|test_2020_02_17_011_chunk|1|

テーブル一括削除

select "sqlite3 testdb "||"'drop table "||name||"'" from sqlite_master;

sqlite3 testdb 'drop table test_tbl'
sqlite3 testdb 'drop table test_2020_02_17_002_chunk'
sqlite3 testdb 'drop table test_2020_02_17_003_chunk'
sqlite3 testdb 'drop table test_2020_02_17_004_chunk'
sqlite3 testdb 'drop table test_2020_02_17_005_chunk'
sqlite3 testdb 'drop table test_2020_02_17_006_chunk'
sqlite3 testdb 'drop table test_2020_02_17_007_chunk'
sqlite3 testdb 'drop table test_2020_02_17_008_chunk'
sqlite3 testdb 'drop table test_2020_02_17_009_chunk'
sqlite3 testdb 'drop table test_2020_02_17_010_chunk'
sqlite3 testdb 'drop table test_2020_02_17_011_chunk'
```

# エクスポート

## 単一ファイルの場合

```
sqlite3 testdb ".dump test_2020_02_17_011_chunk">test_2020_02_17_011_chunk.dmp
```

## 複数ファイルの場合

エクスポートコマンド作成
```
select "sqlite3 testdb "||""""||".dump "||name||""""||">"||name ||".dmp" from sqlite_master;
```

実行
```
sqlite3 testdb ".dump test_2020_02_17_001_chunk">test_2020_02_17_001_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_002_chunk">test_2020_02_17_002_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_003_chunk">test_2020_02_17_003_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_004_chunk">test_2020_02_17_004_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_005_chunk">test_2020_02_17_005_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_006_chunk">test_2020_02_17_006_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_007_chunk">test_2020_02_17_007_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_008_chunk">test_2020_02_17_008_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_009_chunk">test_2020_02_17_009_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_010_chunk">test_2020_02_17_010_chunk.dmp
sqlite3 testdb ".dump test_2020_02_17_011_chunk">test_2020_02_17_011_chunk.dmp
```

確認
```
kuraine@d6c72bd8ba33 ~$ls -lh *dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_001_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_002_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_003_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_004_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_005_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_006_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_007_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_008_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_009_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine 8.3M  2月 17 23:40 test_2020_02_17_010_chunk.dmp
-rw-rw-r--. 1 kuraine kuraine  225  2月 17 23:40 test_2020_02_17_011_chunk.dmp
```

中身確認
```
$cat test_2020_02_17_011_chunk.dmp
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE test_2020_02_17_011_chunk(
  "col1" TEXT,
  "col2" TEXT,
  "col3" TEXT
);
INSERT INTO test_2020_02_17_011_chunk VALUES('WTEzT7Yj3e','P1Ls3ksHLj','P/CF3hkN1d');
COMMIT;
```


tsvファイルの場合

```
$sqlite3 testdb
>create table test_tbl(col1 text,col2 text,col3 text);
>.import ./test.tsv test_tbl
```


