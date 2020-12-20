- CMD

```
$printf "%s\n" {a..j} | xargs -n3 | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");a=s.replace(/\n$/,"").split("\n");console.log(a)'
```


- OUT

```
[ 'a b c', 'd e f', 'g h i', 'j' ]
```
