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
$cat test3.csv | perl -F, -anlE '$,=",";@F[1]=~/banana/ and map{s/a/PPP/} @F[1] and @F[2]=map{$_*2} @F[2];@F[1]=~/apple/ and map{s/a/LLL/} @F[1] and @F[2]=map{$_*100} @F[2];say @F'
```

- OUT

```
0001,LLLpple,600,20190201
0002,LLLpple,1000,20190206
0003,LLLpple,1100,20190206
0004,bPPPnana,14,20190208
0005,bPPPnana,6,20190209
0006,bPPPnana,8,20190202
0007,kiwii,10,20190201
0008,kiwii,5,20190209
```
