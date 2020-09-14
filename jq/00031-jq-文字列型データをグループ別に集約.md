- IN

```
$cat test.json
[
  {
    "grp": 1,
    "value": "a"
  },
  {
    "grp": 1,
    "value": "b"
  },
  {
    "grp": 2,
    "value": "c"
  },
  {
    "grp": 2,
    "value": "d"
  }
]
```

- CMD

```
$cat test.json | jq 'group_by(.grp)[]|.[].grp as $grp|reduce .[].value as $item ([];.+[$item])|{grp:$grp,item:.}' | jq -s 'unique'
```

- OUT

```
[
  {
    "grp": 1,
    "item": [
      "a",
      "b"
    ]
  },
  {
    "grp": 2,
    "item": [
      "c",
      "d"
    ]
  }
]
```
