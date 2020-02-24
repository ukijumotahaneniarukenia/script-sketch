- IN
```
$cat non-non-flat.json | jq
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
```

- CMD
  - パイプで次の処理の標準入力に渡す前まではmap系関数は直前の標準入力を参照し続けることができる。map-mapしているところがみそ。
  - https://qiita.com/arc279/items/00b353428120f48a9e06

```
cat non-non-flat.json | jq 'map(.name as $name|.value|map({name:$name,value:.}))|flatten'
```

- OUT
```
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
