- IN

```
$cat b.json
[{"id":"1","value":"CAAGAGAGT"}]
[{"id":"2","value":"TCGCGTCTAG"}]
[{"id":"3","value":"AGTCGGTCTT"}]
[{"id":"4","value":"GTCTGGC"}]
[{"id":"5","value":"AGTCT"}]
[{"id":"6","value":"GCAGACTGAT"}]
[{"id":"7","value":"GGTAGGCG"}]
[{"id":"8","value":"ACCGGTGTT"}]
[{"id":"9","value":"GTTCTAGCA"}]
[{"id":"10","value":"GTAGCAGGT"}]
```

- CMD

  - いいやりかたが他にもありそうだが、キーを予め変数に格納して後続の処理で参照できるようにしておくのがみそ。最後はシュリンプしてユニーク。集約系は最後にこれが必要。

  - grp化したキーを持ち回らない方

```
$cat b.json | jq 'map({id:.id,value:.value})' | jq -s 'group_by(.[].value[0:1])[]|.[][].value[0:1] as $grp|reduce .[] as $item([];.+$item)|{grp:$grp,items:.}'| jq -s 'unique'
```


- OUT

```
[
  {
    "grp": "A",
    "items": [
      {
        "id": "3",
        "value": "AGTCGGTCTT"
      },
      {
        "id": "5",
        "value": "AGTCT"
      },
      {
        "id": "8",
        "value": "ACCGGTGTT"
      }
    ]
  },
  {
    "grp": "C",
    "items": [
      {
        "id": "1",
        "value": "CAAGAGAGT"
      }
    ]
  },
  {
    "grp": "G",
    "items": [
      {
        "id": "4",
        "value": "GTCTGGC"
      },
      {
        "id": "6",
        "value": "GCAGACTGAT"
      },
      {
        "id": "7",
        "value": "GGTAGGCG"
      },
      {
        "id": "9",
        "value": "GTTCTAGCA"
      },
      {
        "id": "10",
        "value": "GTAGCAGGT"
      }
    ]
  },
  {
    "grp": "T",
    "items": [
      {
        "id": "2",
        "value": "TCGCGTCTAG"
      }
    ]
  }
]
```
