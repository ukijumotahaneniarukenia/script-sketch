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

  - keyとか繋いでやればいいとおもた
```
$cat test3.csv | perl -F, -anlE '$,=":";$a{$F[1]."-".$F[3]}=$a{$F[1]."-".$F[3]}.",".$F[0];END{map{say $_,$a{$_}} keys %a}'
```


- OUT

```
apple-20190206:,0002,0003
kiwii-20190209:,0008
banana-20190208:,0004
kiwii-20190201:,0007
apple-20190201:,0001
banana-20190209:,0005
banana-20190202:,0006
```


- CMD

```
$cat test3.csv | perl -F, -anlE '$,=":";$a{$F[1].$F[3]}++;END{map{say $_,$a{$_}} keys %a}'
```

- OUT

```
banana20190208:1
apple20190206:2
kiwii20190209:1
apple20190201:1
banana20190202:1
kiwii20190201:1
banana20190209:1
```
