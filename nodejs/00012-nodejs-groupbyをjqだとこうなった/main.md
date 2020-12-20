- IN
```
$cat test.json | jq
[
  {
    "name": "バナナ",
    "category": "フルーツ",
    "price": 100
  },
  {
    "name": "りんご",
    "category": "フルーツ",
    "price": 120
  },
  {
    "name": "みかん",
    "category": "フルーツ",
    "price": 30
  },
  {
    "name": "トマト",
    "category": "野菜",
    "price": 200
  },
  {
    "name": "キャベツ",
    "category": "野菜",
    "price": 150
  }
]
```


- CMD
```
$cat test.json | jq 'group_by(."category")[]|[{"category":.[]."category","price":map(."price")|add,"cnt":map(."category")|length}]|unique|.[]' | jq -s ''
```


- OUT

```
[
  {
    "category": "フルーツ",
    "price": 250,
    "cnt": 3
  },
  {
    "category": "野菜",
    "price": 350,
    "cnt": 2
  }
]
```
