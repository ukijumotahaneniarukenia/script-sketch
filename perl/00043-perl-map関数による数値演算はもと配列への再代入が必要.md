- IN

```
$cat test3.csv
0001,apple,6,20190201
0002,apple,10,20190206
0003,apple,11,20190206
0004,banana,7,20190208
0005,banana,3,20190209
0006,banana,4,20190202
0007,kiwii,10,20190201
0008,kiwii,5,20190209
```

- CMD

```
$cat test3.csv | perl -F, -anlE '$,=",";@F[1]=~/banana/ and @F[2]=map{2*$_} @F[2];say @F'
```

- OUT

```
0001,apple,6,20190201
0002,apple,10,20190206
0003,apple,11,20190206
0004,banana,14,20190208
0005,banana,6,20190209
0006,banana,8,20190202
0007,kiwii,10,20190201
0008,kiwii,5,20190209
```
