- IN
```
$cat test-non-head.tsv
A	1	xx
B	2	yy
C	3	zz
```

- CMD
```
$cat test-non-head.tsv | tac
```

- OUT
```
C	3	zz
B	2	yy
A	1	xx
```

- CMD
```
$cat test-non-head.tsv | tac | rev
```

- OUT
```
zz	3	C
yy	2	B
xx	1	A
```

- CMD
```
$cat test-non-head.tsv | tac | rev | datamash transpose
```

- OUT
```
zz	yy	xx
3	2	1
C	B	A
```

- CMD
```
$cat test-non-head.tsv | tac | rev | datamash transpose | rev
```

- OUT

```
xx	yy	zz
1	2	3
A	B	C
```

- CMD
```
$cat test-non-head.tsv | tac | rev | datamash transpose | rev | tac
```

- OUT
```
A	B	C
1	2	3
xx	yy	zz
```

- CMD
```
$cat test-non-head.tsv | tac | rev | datamash transpose | rev | tac | datamash transpose
```

- OUT

```
A	1	xx
B	2	yy
C	3	zz
```
