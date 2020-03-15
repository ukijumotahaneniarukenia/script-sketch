- IN

```
```

- CMD

```
$for((i=0;i<=9;i++));do seq $i | tr -d '\\\n'|xargs -n$i 2>/dev/null;done
```


- OUT

```
1
12
123
1234
12345
123456
1234567
12345678
123456789
```
- CMD

```
$for((i=0;i<=9;i++));do seq $i | tac| tr -d '\\\n'|xargs -n$i 2>/dev/null;done
```


- OUT

```
1
21
321
4321
54321
654321
7654321
87654321
987654321
```
