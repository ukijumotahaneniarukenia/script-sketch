- IN

```
$ echo "<x/>"
<x/>
```

- CMD

```
echo "<x/>" | xml sel -t -v "math:abs(-1000)"
```

- OUT

```
1000
```
