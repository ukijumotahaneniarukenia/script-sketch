- IN

```
$cat test-nlp.txt
がんばる。
人性あびる。
そあくおどろく禍根。
```


- CMD

```
$cat test-nlp.txt | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");a=s.replace(/\n$/,"").split("\n");b=a.map(e=>e.split(" "));console.table(b)'
```


- OUT

```
┌─────────┬────────────────────────┐
│ (index) │           0            │
├─────────┼────────────────────────┤
│    0    │      'がんばる。'      │
│    1    │     '人性あびる。'     │
│    2    │ 'そあくおどろく禍根。' │
└─────────┴────────────────────────┘
```
