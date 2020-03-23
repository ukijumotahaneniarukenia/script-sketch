- CMD

```
$printf "%s\n" {a..j} | xargs -n3 | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");console.log(s)'
```

- OUT

```
a b c
d e f
g h i
j

```


- CMD

```
$printf "%s\n" {a..j} | xargs -n3 | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");s=s.replace(/\n$/,"");console.log(s)'
```

- OUT

```
a b c
d e f
g h i
j
```
