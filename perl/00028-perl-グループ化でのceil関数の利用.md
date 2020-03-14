- IN

```
$seq 4 | perl -nlE 'use POSIX 'ceil';say $.'
1
2
3
4
```

- CMD

```
$seq 4 | perl -nlE 'use POSIX 'ceil';say $./2'
```

- OUT

```
0.5
1
1.5
2
```


- CMD
```
$seq 4 | perl -nlE 'use POSIX 'ceil';say ceil $./2'
```

- OUT
```
1
1
2
2
```
