# インデックス作成

動的に型定義判定してくれるぽいからいいかな

入れた後、逆生成したい

```

```


# インデックス確認

```
curl -X GET "localhost:9200/_cat/indices?v&pretty"
```


# インデックス削除

```
curl -X DELETE "localhost:9200/test_idx?pretty&pretty"
```

# テストデータ作成

対象ドキュメント形式

```
echo 3 | ./00001-JSONテストデータ作成-elasticsearch用-generate-test-data-for-elasticsearch-DONE-gendat4elastic.js| jq '.["items"]'>test.json
```


```
cat test.json
[
  {
    "id": 1,
    "title": "compelling Games uniform",
    "tag": "Investor models",
    "updated": 1582151559440,
    "crawled": 1582152441257,
    "published": 1582151559440,
    "url": "https://generate"
  },
  {
    "id": 2,
    "title": "Investment Account Interactions",
    "tag": "USB SMTP Flat",
    "updated": 1582151559441,
    "crawled": 1582151724213,
    "published": 1582151559440,
    "url": "https://Handmade-Credit-Card-Account"
  },
  {
    "id": 3,
    "title": "override",
    "tag": "Creative European Unit of Account 17(E.U.A.-17) teal",
    "updated": 1582151559440,
    "crawled": 1582151617456,
    "published": 1582151559440,
    "url": "https://convergence"
  }
]
```

elasticsearch用にデータ形式変換


```
cat test.json | jq -c 'to_entries|map([{index:{"_id":.key|tostring}},.value])|flatten|.[]'>test.json.done
```


```
cat test.json.done
{"index":{"_id":"0"}}
{"id":1,"title":"compelling Games uniform","tag":"Investor models","updated":1582151559440,"crawled":1582152441257,"published":1582151559440,"url":"https://generate"}
{"index":{"_id":"1"}}
{"id":2,"title":"Investment Account Interactions","tag":"USB SMTP Flat","updated":1582151559441,"crawled":1582151724213,"published":1582151559440,"url":"https://Handmade-Credit-Card-Account"}
{"index":{"_id":"2"}}
{"id":3,"title":"override","tag":"Creative European Unit of Account 17(E.U.A.-17) teal","updated":1582151559440,"crawled":1582151617456,"published":1582151559440,"url":"https://convergence"}
```


# ドキュメント投入

```
curl -H "Content-Type: application/json" -XPOST "localhost:9200/test_idx/_bulk?pretty&refresh" --data-binary "@test.json.done"
{
  "took" : 37,
  "errors" : false,
  "items" : [
    {
      "index" : {
        "_index" : "test_idx",
        "_type" : "_doc",
        "_id" : "0",
        "_version" : 1,
        "result" : "created",
        "forced_refresh" : true,
        "_shards" : {
          "total" : 2,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 3,
        "_primary_term" : 1,
        "status" : 201
      }
    },
    {
      "index" : {
        "_index" : "test_idx",
        "_type" : "_doc",
        "_id" : "1",
        "_version" : 2,
        "result" : "updated",
        "forced_refresh" : true,
        "_shards" : {
          "total" : 2,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 4,
        "_primary_term" : 1,
        "status" : 200
      }
    },
    {
      "index" : {
        "_index" : "test_idx",
        "_type" : "_doc",
        "_id" : "2",
        "_version" : 2,
        "result" : "updated",
        "forced_refresh" : true,
        "_shards" : {
          "total" : 2,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 5,
        "_primary_term" : 1,
        "status" : 200
      }
    }
  ]
}
```


# ドキュメント取得

- 全件取得

```
curl -X GET "localhost:9200/test_idx/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": { "match_all": {} }
}
'
```

```
{
  "took" : 4,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 4,
      "relation" : "eq"
    },
    "max_score" : 1.0,
    "hits" : [
      {
        "_index" : "test_idx",
        "_type" : "_doc",
        "_id" : "0",
        "_score" : 1.0,
        "_source" : {
          "id" : 1,
          "title" : "compelling Games uniform",
          "tag" : "Investor models",
          "updated" : 1582151559440,
          "crawled" : 1582152441257,
          "published" : 1582151559440,
          "url" : "https://generate"
        }
      },
      {
        "_index" : "test_idx",
        "_type" : "_doc",
        "_id" : "1",
        "_score" : 1.0,
        "_source" : {
          "id" : 2,
          "title" : "Investment Account Interactions",
          "tag" : "USB SMTP Flat",
          "updated" : 1582151559441,
          "crawled" : 1582151724213,
          "published" : 1582151559440,
          "url" : "https://Handmade-Credit-Card-Account"
        }
      },
      {
        "_index" : "test_idx",
        "_type" : "_doc",
        "_id" : "2",
        "_score" : 1.0,
        "_source" : {
          "id" : 3,
          "title" : "override",
          "tag" : "Creative European Unit of Account 17(E.U.A.-17) teal",
          "updated" : 1582151559440,
          "crawled" : 1582151617456,
          "published" : 1582151559440,
          "url" : "https://convergence"
        }
      },
      {
        "_index" : "test_idx",
        "_type" : "_doc",
        "_id" : "3",
        "_score" : 1.0,
        "_source" : {
          "id" : 3,
          "title" : "Fantastic Fresh Keyboard",
          "tag" : "payment array Algerian Dinar",
          "updated" : 1582123939947,
          "crawled" : 1582124881527,
          "published" : 1582123939947,
          "url" : "https://Accounts-Outdoors-olive"
        }
      }
    ]
  }
}
```


- 1件目から2件取得

```
curl -X GET "localhost:9200/test_idx/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": { "match_all": {} },
  "from":1,
  "size":2
}
'
```

```
{
  "took" : 0,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 4,
      "relation" : "eq"
    },
    "max_score" : 1.0,
    "hits" : [
      {
        "_index" : "test_idx",
        "_type" : "_doc",
        "_id" : "1",
        "_score" : 1.0,
        "_source" : {
          "id" : 2,
          "title" : "Investment Account Interactions",
          "tag" : "USB SMTP Flat",
          "updated" : 1582151559441,
          "crawled" : 1582151724213,
          "published" : 1582151559440,
          "url" : "https://Handmade-Credit-Card-Account"
        }
      },
      {
        "_index" : "test_idx",
        "_type" : "_doc",
        "_id" : "2",
        "_score" : 1.0,
        "_source" : {
          "id" : 3,
          "title" : "override",
          "tag" : "Creative European Unit of Account 17(E.U.A.-17) teal",
          "updated" : 1582151559440,
          "crawled" : 1582151617456,
          "published" : 1582151559440,
          "url" : "https://convergence"
        }
      }
    ]
  }
}
```
