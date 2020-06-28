- CMD

```
$printf "%s\n" {a..c} {もり,も} | xargs -n3 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(list(k),list(v)) for k,v in zip(a[0],a[1])]'
```

- OUT

```
['a'] ['も', 'り']
['b'] ['も']
```

- CMD

```
$printf "%s\n" {a..c} {もり,も} | xargs -n3 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(k,v) for k,v in zip(a[0],a[1])]'
```

- OUT

```
a もり
b も
```

- CMD
  - 引数の最大要素分で折り返しても、最小要素数分しか組み合わせができない
```
$printf "%s\n" {a..c} {もり,も} | xargs -n3 | python3 -c 'import sys;a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));[print(k,v,sep=",") for k,v in zip(a[0],a[1])]'
```

- OUT

```
a,もり
b,も
```
