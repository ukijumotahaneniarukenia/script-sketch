- IN

```
$time ./e.sh 20150101 100 10000000 >done
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
real	0m0.361s
user	0m0.295s
sys	0m0.073s

$ll -lh done
-rw-rw-r--. 1 kuraine kuraine 86M  3月 15 03:47 done
```
