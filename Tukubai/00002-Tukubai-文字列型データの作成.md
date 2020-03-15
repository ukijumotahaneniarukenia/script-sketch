- IN

```
$time ./00002-Tukubai-文字列型データの作成.sh 32 10000000 >done
```

- CMD

```
#!/bin/bash

mx=$1;shift
nn=$1;shift

strings /dev/urandom | tr -dc 'A-Za-z' | head -c $(($mx*100)) | fold -b -w $mx | shuf -rn $nn
```

- OUT

```
real	0m0.509s
user	0m0.289s
sys	0m0.225s

$ll -lh done
-rw-rw-r--. 1 kuraine kuraine 315M  3月 15 11:10 done

$cat done | awk '{print length}' | uniq -c
10000000 32
```
