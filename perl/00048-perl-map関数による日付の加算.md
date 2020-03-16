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
cat test3.csv | perl -F, -anlE '
  $,=",";
  @F[1]=~/banana/ and map{s/a/PPP/} @F[1] or @F[3]=map{$_+1} @F[3];
  say @F;
'
```

- OUT

```
0001,apple,6,20190202
0002,apple,10,20190207
0003,apple,11,20190207
0004,bPPPnana,7,20190208
0005,bPPPnana,3,20190209
0006,bPPPnana,4,20190202
0007,kiwii,10,20190202
0008,kiwii,5,20190210
```
