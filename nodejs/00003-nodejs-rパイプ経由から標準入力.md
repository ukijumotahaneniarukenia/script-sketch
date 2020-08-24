- CMD
  - console.logは末尾に改行はいる
```
$echo うんこ | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");console.log(s);'
```

- OUT

```
うんこ

```
