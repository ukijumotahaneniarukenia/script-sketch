- IN

```
$cat test-non-head-crosstab.tsv
a	x	3
a	y	7
b	x	21
a	x	40
```

- CMD
```
$datamash -s crosstab 1,2 sum 3 <test-non-head-crosstab.tsv
```

- OUT
```
	x	y
a	43	7
b	21	N/A
```
- CMD
```
$datamash -s crosstab 1,2 unique 3 <test-non-head-crosstab.tsv
```

- OUT
```
	x	y
a	3,40	7
b	21	N/A
```


- IN

```
$cat test2-non-head-crosstab.tsv
a	x	3
a	y	PPP
b	x	TTT
a	x	LLL
```

- CMD

```
$datamash -s crosstab 1,2 sum 3 <test2-non-head-crosstab.tsv
```

- OUT

```
datamash: invalid numeric value in line 2 field 3: 'LLL'
```

- CMD
```
$datamash -s crosstab 1,2 unique 3 <test2-non-head-crosstab.tsv
```


- OUT

```
	x	y
a	3,LLL	PPP
b	TTT	N/A
```
