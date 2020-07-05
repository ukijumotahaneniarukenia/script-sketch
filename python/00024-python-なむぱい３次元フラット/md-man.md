- CMD

```
echo | opy -m numpy 'B:{import numpy as np;};{a=np.arange(1,24+1).reshape(3,4,2);[print(i,j,k,a[i][j][k],sep="\t") for i,z in enumerate(a) for j,y in enumerate(z) for k,x in enumerate(y)]}'
```

- OUT

```
0	0	0	1
0	0	1	2
0	1	0	3
0	1	1	4
0	2	0	5
0	2	1	6
0	3	0	7
0	3	1	8
1	0	0	9
1	0	1	10
1	1	0	11
1	1	1	12
1	2	0	13
1	2	1	14
1	3	0	15
1	3	1	16
2	0	0	17
2	0	1	18
2	1	0	19
2	1	1	20
2	2	0	21
2	2	1	22
2	3	0	23
2	3	1	24
```
