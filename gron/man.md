# データハンドリング

- https://www.medi-08-data-06.work/entry/python_preprocess

複数値を持つタプル内包の複数リストをdictに渡すと、dictになる。
複数値を持つタプル内包の単一リスト
単一値を持つタプル内包の複数リスト
単一値を持つタプル内包の単一リスト
- https://qiita.com/dcm_shiramizu/items/881f9faf6c515c621308

# データベース作成

```
sqlite3 testdb
```

# 取り込みテーブル作成

```
create table init_tbl(tgt text);
```


# データ投入

```
.import in init_tbl
```


# データ確認

```
select * from init_tbl;
```

ここまでの一連

```
apache@bc8c7a831436 ~/script-scratch/gron$sqlite3  testdb
-- Loading resources from /home/apache/.sqliterc
SQLite version 3.30.0 2019-10-04 15:03:17
Enter ".help" for usage hints.
sqlite>>>create table init_tbl(tgt text);
Run Time: real 0.022 user 0.001628 sys 0.000469
sqlite>>>.import in init_tbl
sqlite>>>select * from init_tbl;
tgt
------------------------------------
json[0].id = "bb3aca972404f68bfcd6";
json[0].tags[0].name = "Linux";
json[0].tags[1].name = "Windows10";
json[0].tags[2].name = "VcXsrv";
json[0].tags[3].name = "BashOnUbuntu
json[0].tags[4].name = "WSL";
json[0].title = "Windows Subsystem f
json[0].updated_at = "2018-12-14T21:
json[0].user.id = "nishemon";
json[1].id = "f7112240c72d61d4cdf4";
json[1].tags[0].name = "Java";
json[1].tags[1].name = "JAXB";
json[1].title = "JAXB使い方メモ";
json[1].updated_at = "2019-05-06T13:
json[1].user.id = "opengl-8080";
Run Time: real 0.001 user 0.000164 sys 0.000295
sqlite>>>
apache@bc8c7a831436 ~/script-scratch/gron$
apache@bc8c7a831436 ~/script-scratch/gron$sqlite3  testdb
-- Loading resources from /home/apache/.sqliterc
SQLite version 3.30.0 2019-10-04 15:03:17
Enter ".help" for usage hints.
sqlite>>>select * from init_tbl;
tgt
------------------------------------
json[0].id = "bb3aca972404f68bfcd6";
json[0].tags[0].name = "Linux";
json[0].tags[1].name = "Windows10";
json[0].tags[2].name = "VcXsrv";
json[0].tags[3].name = "BashOnUbuntu
json[0].tags[4].name = "WSL";
json[0].title = "Windows Subsystem f
json[0].updated_at = "2018-12-14T21:
json[0].user.id = "nishemon";
json[1].id = "f7112240c72d61d4cdf4";
json[1].tags[0].name = "Java";
json[1].tags[1].name = "JAXB";
json[1].title = "JAXB使い方メモ";
json[1].updated_at = "2019-05-06T13:
json[1].user.id = "opengl-8080";
Run Time: real 0.001 user 0.000383 sys 0.000639
```

# sqlite3はデフォルトで正規表現が使えぬため、pandasつかう


