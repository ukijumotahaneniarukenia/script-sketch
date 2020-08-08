- データ投入

```
$ curl -s -X POST -H "Content-Type: application/json" "localhost:9200/my-index-000001/_bulk?pretty&refresh" --data-binary "@test.json.done" | jq '.items|length'
100
```

- データ型確認

```
$ curl -X GET "localhost:9200/my-index-000001/_mapping?pretty" -H 'Content-Type: application/json'
```

- 全件取得

```
$ curl -X GET "localhost:9200/my-index-000001/_search?pretty" -H 'Content-Type: application/json' -d'@select-all.json'
```

- インデックス削除

```
$ curl -X DELETE "localhost:9200/my-index-000001?pretty"
```
