- IN

```
<?xml version="1.0" encoding="UTF-8"?>
<items>
  <item id="123">
    <name>Andy</name>
    <age>21</age>
  </item>
  <item id="234">
    <name>Brian</name>
    <age>23</age>
  </item>
  <item id="345">
    <name>Charles</name>
    <age>19</age>
  </item>
</items>
```


- CMD
  - 属性をタプルとして管理するのか。勉強になる。属性値かどうかを判別する方法が組み込まれているんだな。すごい。
```
sudo gem install activesupport
sudo gem install nokogiri
```

```
ruby 00002-ruby-XMLをJSONに変換する-convert-xml-to-json-XXX.rb 2>/dev/null | jq
```


- OUT

```
{
  "items": {
    "item": [
      {
        "name": "Andy",
        "age": "21",
        "id": "123"
      },
      {
        "name": "Brian",
        "age": "23",
        "id": "234"
      },
      {
        "name": "Charles",
        "age": "19",
        "id": "345"
      }
    ]
  }
}
```
