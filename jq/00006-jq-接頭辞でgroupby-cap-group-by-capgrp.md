- IN

```
$cat a.json
["4G34z1z"]
["4M38ThPz"]
["BZwXExq"]
["BBE3wd"]
["B9z90SsoGG"]
["JnhXJSdY"]
["L6zuM"]
["LjlNyTEFES"]
```

- CMD

  - いいやりかたが他にもありそうだが、キーを予め変数に格納して後続の処理で参照できるようにしておくのがみそ。最後はシュリンプしてユニーク。集約系は最後にこれが必要。

```
$cat a.json | jq -c '{key:.[][0:1],value:.}' | jq -s 'group_by(.key)[]|.[].key as $key|reduce .[].value as $item ([];.+$item)|{key:$key,items:.}' | jq -s 'unique'
```

- OUT

```
[
  {
    "key": "4",
    "items": [
      "4G34z1z",
      "4M38ThPz"
    ]
  },
  {
    "key": "B",
    "items": [
      "BZwXExq",
      "BBE3wd",
      "B9z90SsoGG"
    ]
  },
  {
    "key": "J",
    "items": [
      "JnhXJSdY"
    ]
  },
  {
    "key": "L",
    "items": [
      "L6zuM",
      "LjlNyTEFES"
    ]
  }
]
```
