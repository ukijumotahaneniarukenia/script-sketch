# サンプルデータ作成

コマンドライン上で操作する際、インポートファイルが存在しない作業ディレクトリへ移動すると、テーブルメモリから消去されるので、
インポートしてゴニョゴニョしたらエクスポートするのを忘れずに。

100万件のデータ

```
echo "cat /dev/urandom | base64 -w0 | fold -w 10 | paste $(seq 3 | xargs -I@ echo - | xargs) | head -n1000000" | sh >test-1000000.tsv
```

# インポート

## csvファイルの場合

### 単一ファイル

ヘッダ行あり
```
$head test.csv
"col1","col2","col3"
TZi0viSLAJ,vGy3pFZDyo,Mv3VxwRRLR
"8qVtso1oU4","8t7LiuxONh",z7eUuNYmFv
qSH9Kv8ogH,/56H1yXQRx,BMeKDZkm7R
Xym5Ip7e+y,TcZXdX6Oou,LYwctbv5B6
JLRsTUVBPG,"7aMaq9zxOA","7iP1UfidkL"
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

```
$sqlite3 testdb
>create table test_tbl(col1 text,col2 text,col3 text);
>.import ./test.tsv test_tbl
```

### 複数ファイル

# エクスポート

