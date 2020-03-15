- IN

```
$time ./c.sh  32 10000000 >done
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
real	0m3.126s
user	0m15.291s
sys	0m1.531s
```
