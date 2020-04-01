- IN
  - 行列欠損なし
```
$seq 10 | xargs -n2
1 2
3 4
5 6
7 8
9 10
```

- CMD

```
$seq 10 | xargs -n2 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));a=[tuple(e) for e in a];print(a)'
```

- OUT

```
[('1', '2'), ('3', '4'), ('5', '6'), ('7', '8'), ('9', '10')]
```

- CMD

```
$seq 10 | xargs -n2 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));a=[tuple(e) for e in a];print(list(zip(*a)))'
```

- OUT

```
[('1', '3', '5', '7', '9'), ('2', '4', '6', '8', '10')]
```


- IN
  - 行列欠損有り
```
$seq 10 | xargs -n3
1 2 3
4 5 6
7 8 9
10
```

- CMD

```
$seq 10 | xargs -n3 | python3 -c 'import sys;from itertools import zip_longest;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));a=[tuple(e) for e in a];print(a)'
```

- OUT
  - ロンリーオンリータプルは末尾カンマが必要ぽい
```
[('1', '2', '3'), ('4', '5', '6'), ('7', '8', '9'), ('10',)]
```

- CMD

```
$seq 10 | xargs -n3 | python3 -c 'import sys;from itertools import zip_longest;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));a=[tuple(e) for e in a];print(list(zip_longest(*a)))'
```

- OUT

```
[('1', '4', '7', '10'), ('2', '5', '8', None), ('3', '6', '9', None)]
```
