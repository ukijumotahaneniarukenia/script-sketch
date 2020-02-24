- IN

```
$echo {a..d}
a b c d
```

- CMD

```
echo {a..d} | xargs -I@ jq -n -c '"@"|split(" ")|reverse'
```

- OUT

```
["d","c","b","a"]
```
