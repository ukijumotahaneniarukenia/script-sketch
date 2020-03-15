- IN
  - タブなし

```
$cat test-non-head.tsv
A	1	xx
B	2	yy
C	3	zz
$cat test-non-head-na.tsv
A	1	xx
B
C	3	zz
```

- CMD
```
$datamash check < test-non-head-na.tsv
```

- OUT
```
line 1 (3 fields):
  A	1	xx
line 2 (1 fields):
  B
datamash: check failed: line 2 has 1 fields (previous line had 3)
```


- CMD
```
$datamash check < test-non-head.tsv
```

- OUT
```
3 lines, 3 fields
```


