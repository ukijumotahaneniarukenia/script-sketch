- CMD

```
seq 10 | teip -oGg '[13579]' -- awk '$0=length'
```

- OUT

```
1
2
1
4
1
6
1
8
1
10
```
