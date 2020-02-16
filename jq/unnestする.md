map-mapするところがみそ

```
kuraine@71ecc4cebf8f ~/script-sketch/jq$cat non-non-flat.json | jq
[
  {
    "name": "a",
    "value": [
      1,
      2
    ]
  },
  {
    "name": "b",
    "value": [
      3,
      5
    ]
  }
]
kuraine@71ecc4cebf8f ~/script-sketch/jq$cat non-non-flat.json | jq 'map(.name as $name)'
jq: error: syntax error, unexpected ')', expecting '|' (Unix shell quoting issues?) at <top-level>, line 1:
map(.name as $name)                  
jq: 1 compile error
kuraine@71ecc4cebf8f ~/script-sketch/jq$cat non-non-flat.json | jq 'map(.name as $name|.value)'
[
  [
    1,
    2
  ],
  [
    3,
    5
  ]
]
kuraine@71ecc4cebf8f ~/script-sketch/jq$cat non-non-flat.json | jq 'map(.name as $name|.value|map({name:$name,value:.}))'
[
  [
    {
      "name": "a",
      "value": 1
    },
    {
      "name": "a",
      "value": 2
    }
  ],
  [
    {
      "name": "b",
      "value": 3
    },
    {
      "name": "b",
      "value": 5
    }
  ]
]
kuraine@71ecc4cebf8f ~/script-sketch/jq$cat non-non-flat.json | jq 'map(.name as $name|.value|map({name:$name,value:.}))|flatten'
[
  {
    "name": "a",
    "value": 1
  },
  {
    "name": "a",
    "value": 2
  },
  {
    "name": "b",
    "value": 3
  },
  {
    "name": "b",
    "value": 5
  }
]
```

- https://qiita.com/arc279/items/00b353428120f48a9e06
