共通のキーがあるとき、同一配列にまとめられる

IN
```
jq -n '[{"foo":1, "bar":10}, {"foo":3, "bar":100}, {"foo":1, "bar":1}]'
```


OUT

```
[
  {
    "foo": 1,
    "bar": 10
  },
  {
    "foo": 3,
    "bar": 100
  },
  {
    "foo": 1,
    "bar": 1
  }
]
```

IN
```
jq -n '[{"foo":1, "bar":10}, {"foo":3, "bar":100}, {"foo":1, "bar":1}]' | jq 'group_by(.foo)'
```

OUT
```
[
  [
    {
      "foo": 1,
      "bar": 10
    },
    {
      "foo": 1,
      "bar": 1
    }
  ],
  [
    {
      "foo": 3,
      "bar": 100
    }
  ]
]
```


パス式でみるとわかりやすい

IN
```
jq -n '[{"foo":1, "bar":10}, {"foo":3, "bar":100}, {"foo":1, "bar":1}]' | jq -c 'paths'
```


OUT
```
[0]
[0,"foo"]
[0,"bar"]
[1]
[1,"foo"]
[1,"bar"]
[2]
[2,"foo"]
[2,"bar"]
```
IN
```
jq -n '[{"foo":1, "bar":10}, {"foo":3, "bar":100}, {"foo":1, "bar":1}]' | jq -c 'group_by(.foo)|paths'
```

OUT
```
[0]
[0,0]
[0,0,"foo"]
[0,0,"bar"]
[0,1]
[0,1,"foo"]
[0,1,"bar"]
[1]
[1,0]
[1,0,"foo"]
[1,0,"bar"]
```

