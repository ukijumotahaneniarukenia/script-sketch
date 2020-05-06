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
$cat test.json | jq -r '.items|.item|.[]|[.name,.age,.id]|@tsv' | sed '1iname\tage\tid'>test.tsv
```


- OUT

```
$cat test.tsv
name	age	id
Andy	21	123
Brian	23	234
Charles	19	345
```
