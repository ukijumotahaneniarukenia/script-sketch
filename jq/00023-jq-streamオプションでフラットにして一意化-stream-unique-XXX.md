- IN
```
$cat l.json
{
  "a": "foo",
  "b": {
    "c": {
      "d": {
        "test": {
          "key": "value"
        }
      }
    }
  }
}
```

- CMD

```
cat l.json | jq --stream -c ''
```

- OUT
```
[["a"],"foo"]
[["b","c","d","test","key"],"value"]
[["b","c","d","test","key"]]
[["b","c","d","test"]]
[["b","c","d"]]
[["b","c"]]
[["b"]]
```
