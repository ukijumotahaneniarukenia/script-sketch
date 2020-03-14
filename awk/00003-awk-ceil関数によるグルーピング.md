- IN

```
$seq 10
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
$seq 10 | awk -v D=8 -v OFS=',' 'function ceil(n,d){return (n/d==int(n/d))?n/d:int(n/d)+1}BEGIN{D=D}{print ceil($1,D),$0}'
```

- OUT

```
1,1
1,2
1,3
1,4
1,5
1,6
1,7
1,8
2,9
2,10
```

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
$seq 10 | xargs -n3 | awk -v D=8 -v OFS=',' 'function ceil(n,d){return (n/d==int(n/d))?n/d:int(n/d)+1}BEGIN{D=D}{print ceil($1,D),$0}'
```

- OUT

```
1,1 2 3
1,4 5 6
1,7 8 9
2,10
```
