- IN

```
$time ./00003-Tukubai-日付型データの作成.sh  20200202 365 10000000 >done
```


- CMD
```
#!/bin/bash

day=$1;shift;
range=$1;shift;
nn=$1;shift;

mdate -e $day/+$range | tarr | shuf -rn$nn
```

- OUT
```
real	0m0.393s
user	0m0.291s
sys	0m0.110s

$ll -lh done
-rw-rw-r--. 1 kuraine kuraine 86M  3月 15 11:13 done

$cat done | awk '{print length}' | uniq -c
10000000 8
```
