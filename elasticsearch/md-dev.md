- インデックス削除

```
curl -X DELETE "localhost:9200/my-index-000001?pretty"
```

- インデックス作成

```
curl -X PUT "localhost:9200/my-index-000001?pretty" -H 'Content-Type: application/json' -d'@create-00001-インデックス作成.json'
```


- データ投入

```
curl -s -X POST -H "Content-Type: application/json" "localhost:9200/my-index-000001/_bulk?pretty&refresh" --data-binary "@test.json.done" | jq '.items|length'
```

- データ型確認

```
curl -X GET "localhost:9200/my-index-000001/_mapping?pretty" -H 'Content-Type: application/json'
```

- 先頭１０件ほど取得

```
curl -X GET "localhost:9200/my-index-000001/_search?pretty" -H 'Content-Type: application/json' -d'@select-00001-条件なしで検索.json'
```
