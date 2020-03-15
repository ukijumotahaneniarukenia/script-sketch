- IN

```
$time ./00001-Tukubai-数値型データの作成.sh 32 10000000 >done
```
- CMD

```
#!/bin/bash

mx=$1;shift
nn=$1;shift

seq 0 9 >a

for i in $(seq 1 $mx | maezero 1.2);do
  mkfifo a-$i
  cat a | shuf -rn$nn >a-$i &
done

paste a-* | tr -d '\t'

rm -rf a-* a
```

- OUT

```
$time ./00001-Tukubai-数値型データの作成.sh 32 10000000 >done

real	0m3.265s
user	0m15.001s
sys	0m1.556s

$ll -lh done
-rw-rw-r--. 1 kuraine kuraine 315M  3月 15 11:06 done

$cat done | awk '{print length}' | uniq -c
10000000 32
```
