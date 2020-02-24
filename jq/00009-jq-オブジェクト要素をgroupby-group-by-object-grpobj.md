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

  - grp化に使用したキーは各要素で持ち回ったほうが従属関係を把握できるので、残しておいたほうがいい気がする。
```
$cat b.json | jq 'map({grp:.value[0:1],id:.id,value:.value})' | jq -s 'group_by(.[].grp)[]|.[][].grp as $grp|reduce .[] as $item([];.+$item)|{grp:$grp,items:.}' | jq -s 'unique'
```

- OUT

```
[
  {
    "grp": "A",
    "items": [
      {
        "grp": "A",
        "id": "3",
        "value": "AGTCGGTCTT"
      },
      {
        "grp": "A",
        "id": "5",
        "value": "AGTCT"
      },
      {
        "grp": "A",
        "id": "8",
        "value": "ACCGGTGTT"
      }
    ]
  },
  {
    "grp": "C",
    "items": [
      {
        "grp": "C",
        "id": "1",
        "value": "CAAGAGAGT"
      }
    ]
  },
  {
    "grp": "G",
    "items": [
      {
        "grp": "G",
        "id": "4",
        "value": "GTCTGGC"
      },
      {
        "grp": "G",
        "id": "6",
        "value": "GCAGACTGAT"
      },
      {
        "grp": "G",
        "id": "7",
        "value": "GGTAGGCG"
      },
      {
        "grp": "G",
        "id": "9",
        "value": "GTTCTAGCA"
      },
      {
        "grp": "G",
        "id": "10",
        "value": "GTAGCAGGT"
      }
    ]
  },
  {
    "grp": "T",
    "items": [
      {
        "grp": "T",
        "id": "2",
        "value": "TCGCGTCTAG"
      }
    ]
  }
]
```

