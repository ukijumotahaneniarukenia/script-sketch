- IN
```
$echo {a..d} | xargs -I@ jq -n '"@"'
"a b c d"
```

- MID

```
$echo {a..d} | xargs -I@ jq -n '"@"|split(" ")'
[
  "a",
  "b",
  "c",
  "d"
]
$echo {a..d} | xargs -I@ jq -n '"@"|split(" ")|to_entries'
[
  {
    "key": 0,
    "value": "a"
  },
  {
    "key": 1,
    "value": "b"
  },
  {
    "key": 2,
    "value": "c"
  },
  {
    "key": 3,
    "value": "d"
  }
]
```

- CMD
```
$echo {a..d} | xargs -I@ jq -n '"@"|split(" ")|to_entries|map(.key)'
```

- OUT
```
[
  0,
  1,
  2,
  3
]
```
