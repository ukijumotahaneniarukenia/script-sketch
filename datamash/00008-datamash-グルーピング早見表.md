- IN

```
$seq 1 10
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
  - 第一列に計算列を持ってくる必要がある

```
seq 1 10 | while read n;do printf "%s %s\n" $n $(echo "scale=3;$n/3"|bc);done | awk '{print $2,$1}' | datamash -t' ' --full round 1 ceil 1 floor 1 trunc 1 frac 1
```

- OUT

```
.333 1 0 1 0 0 0.333
.666 2 1 1 0 0 0.666
1.000 3 1 1 1 1 0
1.333 4 1 2 1 1 0.333
1.666 5 2 2 1 1 0.666
2.000 6 2 2 2 2 0
2.333 7 2 3 2 2 0.333
2.666 8 3 3 2 2 0.666
3.000 9 3 3 3 3 0
3.333 10 3 4 3 3 0.333
```
