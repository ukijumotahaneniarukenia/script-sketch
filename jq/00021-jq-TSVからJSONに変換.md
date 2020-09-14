- IN
```
$cat test.tsv
1	foo
2	bar
```

- CMD
  - https://qiita.com/shobyshoby/items/68204f8567efbd32d705
```
jq -s -R 'split("\n")|map(.|select(.!=""))|map(split("\t"))|map({"id":.[0],"name":.[1]})' test.tsv
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
```
