- IN

```
$cat test.json
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

- CMD

```
$cat test.json | jq -r '.items|.item|.[]|[.name,.age,.id]|@csv' | sed '1i"name","age","id"'>test.csv
```


- OUT

```
$cat test.csv
"name","age","id"
"Andy","21","123"
"Brian","23","234"
"Charles","19","345"
```
