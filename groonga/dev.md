- https://groonga.org/ja/docs/tutorial/introduction.html


# データベースの作成
```
groonga -n testdb
```

# データベースの削除

```
rm testdb*
```


# データベースの状態確認

```
groonga testdb staus | jq
```


# テーブル一覧の取得

- https://groonga.org/ja/docs/tutorial/introduction.html#basic-commands

- https://groonga.org/ja/docs/reference/commands/table_list.html

```
groonga testdb table_list | jq
```

# テーブルの作成

- https://groonga.org/ja/docs/reference/commands/table_create.html#table-create-large-data-store
- https://groonga.org/ja/docs/reference/types.html


カラム追加は単一しかできないので繰り返す

```
groonga testdb table_create --name test_tbl --flags 'TABLE_HASH_KEY|KEY_LARGE' --key_type UInt32
groonga testdb column_create --table test_tbl --name id --type UInt32
groonga testdb column_create --table test_tbl --name title --type LongText
groonga testdb column_create --table test_tbl --name tag --type LongText
groonga testdb column_create --table test_tbl --name updated --type Time
groonga testdb column_create --table test_tbl --name crawled --type Time
groonga testdb column_create --table test_tbl --name published --type Time
groonga testdb column_create --table test_tbl --name url --type LongText
```

# テーブル定義確認

```
groonga testdb column_list test_tbl | jq
```

# データ取得

```
groonga testdb select --table test_tbl | jq
```

# データ投入

jqコマンドでtojson関数でエスケープしてからファイルに出力

出力されたファイルをコマンド置換で引数に渡す

```
groonga testdb load --table test_tbl $(cat test.json)
```
