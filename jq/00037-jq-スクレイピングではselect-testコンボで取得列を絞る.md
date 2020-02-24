- IN

```


```

- CMD

```
jq -c --stream 'select(length==2)|{key:.[0]|join("."),value:.[1]}' | jq -s -c '.[]|select(.key|test("items\\.[0-9]\\.(title|id|htmlUrl|origin\\.htmlUrl|origin\\.title|crawled|summary\\.content|published|alternate\\.[0-9]{1,}\\.href|categories\\.[0-9]{1,}\\.id)"))'
```

- OUT

```

```
