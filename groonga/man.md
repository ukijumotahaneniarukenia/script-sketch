# JSONデータ回収

- API提供

- API非提供


# 前処理

feedlyを例に

1000件そのままファイルに出力

```
curl -s -H 'Authorization: Bearer A06ZLbYO6DNLI6o7cH_LuJ7-HCERsBMrKmsMzWAIPhifNDJe_WpTZKG97vVz1ONodHF3u1X7Y9PHRWCDD9wu3OQgtl3BU2VXUTg310QgRQcE5U6Igb46SUF81G1PymbOlT3Tyep0aT34wT1G8gLR6T8fM6j6xjI428yeuHu6IOuIKazFVZeoBEBsZGtWLAfTOvtbIXIWO2phI7Z7DK81RIQ0u_DtyiWJVYBfw7pi28wG:feedly' https://cloud.feedly.com/v3/streams/user%2F26c34d27-f858-40be-89a3-527fa5cb76ef%2Fcategory%2FProgramming/contents?count=1000>1000-cnt.json
```

必要そうな項目のみ抽出

```
cat 1000-cnt.json |jq -c --stream 'select(length==2)|{key:.[0]|join("."),value:.[1]}' | jq -s -c '.[]|select(.key|test("items\\.[0-9]{1,}\\.(title|id|htmlUrl|origin\\.htmlUrl|origin\\.title|crawled|summary\\.content|published|alternate\\.[0-9]{1,}\\.href|categories\\.[0-9]{1,}\\.id)"))'|jq -s 'from_entries'>1000-cnt.json.done
```

項目名の正規化

ハイフン区切りで一意にする

```
cat 1000-cnt.json.done | jq  'to_entries|map({"grp":.key|gsub("[a-zA-Z]{1,}";"")|gsub("^\\.";"")|gsub("\\..*";""),"item":
{"key":.key|gsub("\\.";"-")|gsub("-[0-9]{1,}-";"-"),"value":.value}})|group_by(.grp)|map({"grp":.[].grp,"items":(reduce .[].item as $item([];.+[$item]))})|unique'>1000-cnt.json.done.done
```

groonga投入用に整形

ここはベンダ依存によると思うが、大体同じであろう


groongaの場合、_keyないしは_idの列が必須のため、それように列追加したデータを用意する。

当該列の値はユニーク値と同じものであるといい。今回の場合はgrp。

```
cat 1000-cnt.json.done.done | jq 'map({"grp":.grp} as $grp|{"_key":.grp} as $key |.items|from_entries|reduce . as $item({};$key+$grp+$item))'>1000-cnt.json.done.done.done
```

tojsonでエスケープ

ここはベンダ依存によると思うが、大体同じであろう

```
cat 1000-cnt.json.done.done.done | jq 'tojson'>1000-cnt.json.done.done.done.done
```


# groongaデータベースに投入

データベース作成して、テーブル定義作成

```
groonga -n testdb

groonga testdb table_create --name test_tbl --flags 'TABLE_HASH_KEY|KEY_LARGE' --key_type UInt32
groonga testdb column_create --table test_tbl --name grp --type UInt32
groonga testdb column_create --table test_tbl --name items-id --type LongText
groonga testdb column_create --table test_tbl --name items-title --type LongText
groonga testdb column_create --table test_tbl --name items-summary-content --type LongText
groonga testdb column_create --table test_tbl --name items-alternate-href --type LongText
groonga testdb column_create --table test_tbl --name items-crawled --type Time
groonga testdb column_create --table test_tbl --name items-published --type Time
groonga testdb column_create --table test_tbl --name items-origin-title --type LongText
groonga testdb column_create --table test_tbl --name items-origin-htmlUrl --type LongText
groonga testdb column_create --table test_tbl --name items-categories-id --type LongText


groonga testdb load --table test_tbl $(cat 1000-cnt.json.done.done.done.done)
[[0,1581857875.239317,0.04261350631713867],1000]
```

投入後確認


```
groonga testdb select --table test_tbl | jq
```
