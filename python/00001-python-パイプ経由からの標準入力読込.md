- IN

```
$seq 10 | xargs -n1
1
2
3
4
5
6
7
8
9
10
```


- CMD


```
$seq 10 | xargs -n1 | python -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));print a'
```


- OUT

```
[['1'], ['2'], ['3'], ['4'], ['5'], ['6'], ['7'], ['8'], ['9'], ['10']]
```


- INT

```
$seq 10 | xargs -n3
1 2 3
4 5 6
7 8 9
10
```

- CMD

```
$seq 10 | xargs -n3 | python -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));print a'
```

- OUT

```
[['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10']]
```
