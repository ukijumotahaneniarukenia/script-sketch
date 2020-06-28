- IN

```
$seq 10 | xargs -n3
1 2 3
4 5 6
7 8 9
10
```

- CMD

```
$seq 10 | xargs -n3 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));print(a)'
```

- OUT

```
[['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10']]
```

- CMD

```
$seq 10 | xargs -n3 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));a=[tuple(e) for e in a];print(a)'
```

- OUT

```
[('1', '2', '3'), ('4', '5', '6'), ('7', '8', '9'), ('10',)]
```
