- IN

```
$cat d.json
[{"table_name":"yara_events"}]
[{"name":"target_path","type":"TEXT"},{"name":"category","type":"TEXT"},{"name":"action","type":"TEXT"},{"name":"transaction_id","type":"BIGINT"},{"name":"matches","type":"TEXT"},{"name":"count","type":"INTEGER"},{"name":"strings","type":"TEXT"},{"name":"tags","type":"TEXT"},{"name":"time","type":"BIGINT"}]
[{"table_name":"yum_sources"}]
[{"name":"name","type":"TEXT"},{"name":"baseurl","type":"TEXT"},{"name":"enabled","type":"TEXT"},{"name":"gpgcheck","type":"TEXT"},{"name":"gpgkey","type":"TEXT"}]
```

- CMD
  - グルーピングできていない
```
$cat d.json | jq -c 'paths'
```


- OUT

```
[0]
[0,"table_name"]
[0]
[0,"name"]
[0,"type"]
[1]
[1,"name"]
[1,"type"]
[2]
[2,"name"]
[2,"type"]
[3]
[3,"name"]
[3,"type"]
[4]
[4,"name"]
[4,"type"]
[5]
[5,"name"]
[5,"type"]
[6]
[6,"name"]
[6,"type"]
[7]
[7,"name"]
[7,"type"]
[8]
[8,"name"]
[8,"type"]
[0]
[0,"table_name"]
[0]
[0,"name"]
[0,"type"]
[1]
[1,"name"]
[1,"type"]
[2]
[2,"name"]
[2,"type"]
[3]
[3,"name"]
[3,"type"]
[4]
[4,"name"]
[4,"type"]
```

- CMD
  - 行番号必要なので、明細単位でforeachする必要がある
```
$cat d.json | jq -s '. as $tgt|length as $ele|range(0;$ele)|foreach . as $idx([];if $idx%2==0 then $tgt[$idx]+$tgt[$idx+1] else . end )' | jq -s 'map(select(length!=0))'
```

- OUT

```
[
  [
    {
      "table_name": "yara_events"
    },
    {
      "name": "target_path",
      "type": "TEXT"
    },
    {
      "name": "category",
      "type": "TEXT"
    },
    {
      "name": "action",
      "type": "TEXT"
    },
    {
      "name": "transaction_id",
      "type": "BIGINT"
    },
    {
      "name": "matches",
      "type": "TEXT"
    },
    {
      "name": "count",
      "type": "INTEGER"
    },
    {
      "name": "strings",
      "type": "TEXT"
    },
    {
      "name": "tags",
      "type": "TEXT"
    },
    {
      "name": "time",
      "type": "BIGINT"
    }
  ],
  [
    {
      "table_name": "yum_sources"
    },
    {
      "name": "name",
      "type": "TEXT"
    },
    {
      "name": "baseurl",
      "type": "TEXT"
    },
    {
      "name": "enabled",
      "type": "TEXT"
    },
    {
      "name": "gpgcheck",
      "type": "TEXT"
    },
    {
      "name": "gpgkey",
      "type": "TEXT"
    }
  ]
]
```


- CMD

  - グルーピングし直されていることを確認

```
$cat d.json | jq -s '. as $tgt|length as $ele|range(0;$ele)|foreach . as $idx([];if $idx%2==0 then $tgt[$idx]+$tgt[$idx+1] else . end )' | jq -s -c 'map(select(length!=0))|paths'
```

- OUT

```
[0]
[0,0]
[0,0,"table_name"]
[0,1]
[0,1,"name"]
[0,1,"type"]
[0,2]
[0,2,"name"]
[0,2,"type"]
[0,3]
[0,3,"name"]
[0,3,"type"]
[0,4]
[0,4,"name"]
[0,4,"type"]
[0,5]
[0,5,"name"]
[0,5,"type"]
[0,6]
[0,6,"name"]
[0,6,"type"]
[0,7]
[0,7,"name"]
[0,7,"type"]
[0,8]
[0,8,"name"]
[0,8,"type"]
[0,9]
[0,9,"name"]
[0,9,"type"]
[1]
[1,0]
[1,0,"table_name"]
[1,1]
[1,1,"name"]
[1,1,"type"]
[1,2]
[1,2,"name"]
[1,2,"type"]
[1,3]
[1,3,"name"]
[1,3,"type"]
[1,4]
[1,4,"name"]
[1,4,"type"]
[1,5]
[1,5,"name"]
[1,5,"type"]
```
