- IN

```
$printf "%s\n" {a..j} | xargs -n3
a b c
d e f
g h i
j
```


- CMD

```
$printf "%s\n" {a..j} | xargs -n3 | awk -v OFS=":" '{c=split($0,a," ");for(e in a){print e,a[e]}}'
```

- OUT
```
a b c
d e f
g h i
j
```

- CMD

```
$printf "%s\n" {a..j} | xargs -n3 | awk -v OFS=":" '{c=split($0,a," ");for(e in a){print NR,e,a[e]}}'
```

- OUT

```
1:1:a
1:2:b
1:3:c
2:1:d
2:2:e
2:3:f
3:1:g
3:2:h
3:3:i
4:1:j
```

- CMD
```
$printf "%s\n" {a..j} | xargs -n3 | awk -v RS="" -v OFS=":" '{c=split($0,a," ");for(e in a){print e,a[e]}}' | sort -nk1
```

- OUT

```
1:a
2:b
3:c
4:d
5:e
6:f
7:g
8:h
9:i
10:j
```

- CMD
  - RSで複数行を単一行扱いに変更
```
$printf "%s\n" {a..j} | xargs -n3 | awk -v RS="" -v OFS=":" '{c=split($0,a," ");for(e in a){print NR,e,a[e]}}' | sort -nk1
```

- OUT

```
1:10:j
1:1:a
1:2:b
1:3:c
1:4:d
1:5:e
1:6:f
1:7:g
1:8:h
1:9:i
