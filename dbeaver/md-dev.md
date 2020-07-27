# 接続ドライバをダウンロード

jarファイル

ダウンロードしていなかったら、maven経由でダウンロードしてくれる

sqlite3に接続する際にダウンロードしたjarは以下

```
$find / -name "*sqlite*" 2>/dev/null | grep jar
/usr/share/dbeaver/plugins/org.jkiss.dbeaver.ext.sqlite_1.0.75.202002011957.jar
/home/kuraine/.local/share/DBeaverData/drivers/maven/maven-central/org.xerial/sqlite-jdbc-3.30.1.jar
```

サンプルデータベースは以下

```
$ls -lh /home/kuraine/.local/share/DBeaverData/workspace6/.metadata/sample-database-sqlite-1/Chinook.db
-rw-rw-r--. 1 kuraine kuraine 1.1M  2月 17 00:58 /home/kuraine/.local/share/DBeaverData/workspace6/.metadata/sample-database-sqlite-1/Chinook.db
```

自前のデータベースを用意
```
$sqlite3 --version
-- Loading resources from /home/kuraine/.sqliterc
3.30.0 2019-10-04 15:03:17 c20a35336432025445f9f7e289d0cc3e4003fb17f45a4ce74c6269c407c6e09f
```

データベースファイル名はtestdb
テーブル名はtest_tbl
```
$sqlite3 testdb
-- Loading resources from /home/kuraine/.sqliterc
SQLite version 3.30.0 2019-10-04 15:03:17
Enter ".help" for usage hints.
sqlite>>>create table test_tbl(col text);
Run Time: real 0.022 user 0.000000 sys 0.001464
sqlite>>>insert into test_tbl(col)values('a');
Run Time: real 0.020 user 0.000459 sys 0.000491
$sqlite3 testdb
-- Loading resources from /home/kuraine/.sqliterc
SQLite version 3.30.0 2019-10-04 15:03:17
Enter ".help" for usage hints.
sqlite>>>select * from test_tbl;
col
----------
a
Run Time: real 0.002 user 0.000000 sys 0.001640
```


接続情報には以下を記載

- JDBCURL
  - jdbc:sqlite:/home/kuraine/testdb
- パス
  - /home/kuraine/testdb

