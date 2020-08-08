- データ投入

```
$ curl -X POST -H "Content-Type: application/json" "localhost:9200/test-00001-idx/_bulk?pretty&refresh" --data-binary "@test2.json.done"
```

- 全件取得

```
$ curl -X GET "localhost:9200/test-00001-idx/_search?pretty" -H 'Content-Type: application/json' -d'@select-all.json'
```

- インデックス削除

```
$ curl -X DELETE "localhost:9200/test-00001-idx?pretty"
```
