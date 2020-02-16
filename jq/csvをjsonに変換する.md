

- https://qiita.com/shobyshoby/items/68204f8567efbd32d705
```
kuraine@71ecc4cebf8f ~/script-sketch/jq$cat test.csv
1,foo
2,bar

```

selectでから文字以外を抽出しているのがオリジナルと異なる

```
kuraine@71ecc4cebf8f ~/script-sketch/jq$jq -s -R 'split("\n")|map(.|select(.!=""))|map(split(","))|map({"id":.[0],"name":.[1]})' test.csv
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
