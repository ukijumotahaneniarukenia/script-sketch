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
$cat test3.csv | perl -F, -anlE '
  $,=",";
  @F[1]=~/banana/ and map{s/a/PPP/} @F[1] or map{s/$/TTT/} @F[1];
  @F[1]=~/apple/ and @F[2]=map{$_*10} @F[2] or @F[2]=map{$_*3} @F[2];
  say @F;
'
```

- OUT

```
0001,appleTTT,60,20190201
0002,appleTTT,100,20190206
0003,appleTTT,110,20190206
0004,bPPPnana,21,20190208
0005,bPPPnana,9,20190209
0006,bPPPnana,12,20190202
0007,kiwiiTTT,30,20190201
0008,kiwiiTTT,15,20190209
```
