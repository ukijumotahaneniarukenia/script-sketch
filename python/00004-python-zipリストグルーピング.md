- IN

```
$cat test.tsv
apple	banana	orange
100	200	300
A	B	C
```

- CMD

```
$cat test.tsv | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(list(e)) for e in zip(*a)]'
```

- OUT

```
['apple', '100', 'A']
['banana', '200', 'B']
['orange', '300', 'C']
```


- CMD

  - どっちでフラット化してもおけ

```
$cat test.tsv | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(*list(e)) for e in zip(a)]'
```

- OUT

```
['apple', 'banana', 'orange']
['100', '200', '300']
['A', 'B', 'C']
```


- CMD
  - セパレタゆるいみたい

```
$cat test.tsv | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(*list(e)) for e in zip(a)]'
['apple', 'banana', 'orange']
['100', '200', '300']
['A', 'B', 'C']
$cat test.tsv | python3 -c 'import sys;a=list(map(lambda x:x.strip().split("\t"),sys.stdin.readlines()));[print(*list(e)) for e in zip(a)]'
['apple', 'banana', 'orange']
['100', '200', '300']
['A', 'B', 'C']
```
