- IN

```
$ cat test-type-mapping.json
{
  "mappings": {
    "properties": {
"col0":{"type":"string"},"col1":{"type":"string"},"col2":{"type":"string"},"col3":{"type":"string"},"col4":{"type":"string"},"col5":{"type":"string"},"col6":{"type":"number"},"col7":{"type":"number"},"col8":{"type":"number"},"col9":{"type":"number"},"col10":{"type":"datetime"}    }
  }
}
```

- CMD

```
$ jq '' test-type-mapping.json | sponge test-type-mapping.json
```

- OUT

```
$ cat test-type-mapping.json
{
  "mappings": {
    "properties": {
      "col0": {
        "type": "string"
      },
      "col1": {
        "type": "string"
      },
      "col2": {
        "type": "string"
      },
      "col3": {
        "type": "string"
      },
      "col4": {
        "type": "string"
      },
      "col5": {
        "type": "string"
      },
      "col6": {
        "type": "number"
      },
      "col7": {
        "type": "number"
      },
      "col8": {
        "type": "number"
      },
      "col9": {
        "type": "number"
      },
      "col10": {
        "type": "datetime"
      }
    }
  }
}
```
