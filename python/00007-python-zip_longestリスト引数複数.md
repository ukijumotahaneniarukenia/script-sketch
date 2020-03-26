- CMD

```
$printf "%s\n" {a..c} {もり,も} | xargs -n3 | python3 -c 'import sys;from itertools import zip_longest;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(k,v,sep=",") for k,v in zip_longest(a[0],a[1])]'
```

- OUT

```
a,もり
b,も
c,None
```

- CMD

```
$printf "%s\n" {a..c} {もり,も} | xargs -n3 | python3 -c 'import sys;from itertools import zip_longest;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(k,v,sep=",") for k,v in zip_longest(a[0],a[1],fillvalue="N/A")]'
```

- OUT

```
a,もり
b,も
c,N/A
```
