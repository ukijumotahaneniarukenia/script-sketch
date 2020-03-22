- https://osquery.io/schema/4.2.0

- テーブル定義書元ネタ取得するやつ
```
osqueryi .table | grep -Po '[a-z_]+' | while read tgt;do echo "select '$tgt' as table_name;";echo ".types select * from "$tgt";";done>b.sql
```

jsonファイルにはきだす

```
cat b.sql | osqueryi --json>c.json
```

パースエラーがないか確認

```
cat c.json | jq
```


エラーあった

```
$cat c.json | sed -n '530,560p'
[
  {"table_name":"ec"}
]
Error 1: no such table: ec
[
  {"table_name":"_instance_metadata"}
]
Error 1: no such table: _instance_metadata
[
  {"table_name":"ec"}
]
Error 1: no such table: ec
[
  {"table_name":"_instance_tags"}
]
Error 1: no such table: _instance_tags
```

```
$cat c.json | grep Error
Error 1: no such table: ec
Error 1: no such table: _instance_metadata
Error 1: no such table: ec
Error 1: no such table: _instance_tags
Error 1: no such table: interface_ipv
```

エラー起きたテーブルは抽出対象外にする

```
$osqueryi .table | grep -Po '[a-z_]+' | while read tgt;do echo "select '$tgt' as table_name;";echo ".types select * from "$tgt";";done | grep -vP "_instance_metadata|_instance_tags|interface_ipv" | grep -vP "select 'ec' as table_name;|.types select \* from ec;">b.sql
```

再度取得

```
$cat b.sql | osqueryi --json>c.json
$cat c.json | jq
```

エラーでなかったので

テーブル定義情報を出力

```
$cat c.json | jq -s '. as $tgt|length as $ele|range(0;$ele)|foreach . as $idx([];if $idx%2==0 then $tgt[$idx]+$tgt[$idx+1] else . end )' | jq -s 'map(select(length!=0))'>os-table-info.json
```
