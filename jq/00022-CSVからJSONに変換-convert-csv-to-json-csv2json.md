- IN

```
$cat test.csv
1,foo
2,bar
```

- CMD
  - https://qiita.com/shobyshoby/items/68204f8567efbd32d705
```
jq -s -R 'split("\n")|map(.|select(.!=""))|map(split(","))|map({"id":.[0],"name":.[1]})' test.csv
```

- OUT

```
[
  {
    "id": "1",
    "name": "foo"
  },
  {
    "id": "2",
    "name": "bar"
  }
]
