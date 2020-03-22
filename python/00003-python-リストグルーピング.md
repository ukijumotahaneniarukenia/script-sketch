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
$seq 10 | xargs -n3 | python3 -c 'import sys;print(list(map(lambda x:x.strip().split(),sys.stdin.readlines())),sep="\n");'
```

- OUT

```
[['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10']]
```

- CMD

```
$seq 10 | xargs -n3 | python3 -c 'import sys;print(*list(map(lambda x:x.strip().split(),sys.stdin.readlines())),sep="\n");'
```


- OUT

```
['1', '2', '3']
['4', '5', '6']
['7', '8', '9']
['10']
```


- IN

```
$cat test.tsv
apple	banana	orange
100	200	300
A	B	C
```


- CMD

```
$cat test.tsv | python3 -c 'import sys;print(list(map(lambda x:x.strip().split("\t"),sys.stdin.readlines())),sep="\n")'
```

- OUT

```
[['apple', 'banana', 'orange'], ['100', '200', '300'], ['A', 'B', 'C']]
```

- CMD

```
$cat test.tsv | python3 -c 'import sys;print(*list(map(lambda x:x.strip().split("\t"),sys.stdin.readlines())),sep="\n")'
```

- OUT

```
['apple', 'banana', 'orange']
['100', '200', '300']
['A', 'B', 'C']
```

- CMD

```
$seq 10 | xargs -n3 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));print(*a)'
['1', '2', '3'] ['4', '5', '6'] ['7', '8', '9'] ['10']
$seq 10 | xargs -n3 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));print(*a,sep="\n")'
['1', '2', '3']
['4', '5', '6']
['7', '8', '9']
['10']
```


- CMD

```
$seq 10 | xargs -n3 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(e) for e in a]'
['1', '2', '3']
['4', '5', '6']
['7', '8', '9']
['10']
```


- CMD

```

$seq 10 | xargs -n3 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(e) for e in zip(a,[*a],[*a])]'
(['1', '2', '3'], ['1', '2', '3'], ['1', '2', '3'])
(['4', '5', '6'], ['4', '5', '6'], ['4', '5', '6'])
(['7', '8', '9'], ['7', '8', '9'], ['7', '8', '9'])
(['10'], ['10'], ['10'])
```
