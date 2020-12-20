- IN
```
$printf "%s\n" {a..j} | xargs -n3
a b c
d e f
g h i
j
```

- CMD

```
$printf "%s\n" {a..j} | xargs -n3 | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");a=s.replace(/\n$/,"").split("\n");b=a.map(e=>e.split(" "));console.log(b)'
```


- OUT

```
[ [ 'a', 'b', 'c' ], [ 'd', 'e', 'f' ], [ 'g', 'h', 'i' ], [ 'j' ] ]
```


- CMD
  - テーブル関数に配列かけるとみやすい
```
$printf "%s\n" {a..j} | xargs -n3 | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");a=s.replace(/\n$/,"").split("\n");b=a.map(e=>e.split(" "));console.table(b)'
```

- OUT

```
┌─────────┬─────┬─────┬─────┐
│ (index) │  0  │  1  │  2  │
├─────────┼─────┼─────┼─────┤
│    0    │ 'a' │ 'b' │ 'c' │
│    1    │ 'd' │ 'e' │ 'f' │
│    2    │ 'g' │ 'h' │ 'i' │
│    3    │ 'j' │     │     │
└─────────┴─────┴─────┴─────┘
```
