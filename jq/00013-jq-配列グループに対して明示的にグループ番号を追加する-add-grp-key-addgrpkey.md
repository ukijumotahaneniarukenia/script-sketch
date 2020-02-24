$cat c.json
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


- CMD
```
cat c.json | jq '.[].items' | jq -s 'to_entries'
```

- OUT
```
[
  {
    "key": 0,
    "value": [
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
    "key": 1,
    "value": [
      {
        "id": "1",
        "value": "CAAGAGAGT"
      }
    ]
  },
  {
    "key": 2,
    "value": [
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
    "key": 3,
    "value": [
      {
        "id": "2",
        "value": "TCGCGTCTAG"
      }
    ]
  }
]
```

- TIP
  - グループ化されているかどうか判定する方法
  - 関数を適用したことでデグレないか確認
  - paths関数便利

- 変更前
```
$cat c.json | jq '.[].items' | jq -s -c 'paths'
[0]
[0,0]
[0,0,"id"]
[0,0,"value"]
[0,1]
[0,1,"id"]
[0,1,"value"]
[0,2]
[0,2,"id"]
[0,2,"value"]
[1]
[1,0]
[1,0,"id"]
[1,0,"value"]
[2]
[2,0]
[2,0,"id"]
[2,0,"value"]
[2,1]
[2,1,"id"]
[2,1,"value"]
[2,2]
[2,2,"id"]
[2,2,"value"]
[2,3]
[2,3,"id"]
[2,3,"value"]
[2,4]
[2,4,"id"]
[2,4,"value"]
[3]
[3,0]
[3,0,"id"]
[3,0,"value"]
```

- 変更後
```
$cat c.json | jq '.[].items' | jq -s -c 'to_entries|paths'
[0]
[0,"key"]
[0,"value"]
[0,"value",0]
[0,"value",0,"id"]
[0,"value",0,"value"]
[0,"value",1]
[0,"value",1,"id"]
[0,"value",1,"value"]
[0,"value",2]
[0,"value",2,"id"]
[0,"value",2,"value"]
[1]
[1,"key"]
[1,"value"]
[1,"value",0]
[1,"value",0,"id"]
[1,"value",0,"value"]
[2]
[2,"key"]
[2,"value"]
[2,"value",0]
[2,"value",0,"id"]
[2,"value",0,"value"]
[2,"value",1]
[2,"value",1,"id"]
[2,"value",1,"value"]
[2,"value",2]
[2,"value",2,"id"]
[2,"value",2,"value"]
[2,"value",3]
[2,"value",3,"id"]
[2,"value",3,"value"]
[2,"value",4]
[2,"value",4,"id"]
[2,"value",4,"value"]
[3]
[3,"key"]
[3,"value"]
[3,"value",0]
[3,"value",0,"id"]
[3,"value",0,"value"]
```
