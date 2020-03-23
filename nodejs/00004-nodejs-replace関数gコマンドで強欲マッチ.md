- CMD

```
$echo こんこ | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");s=s.replace(/こ/g,"う");console.log(s);'
```

- OUT

```
うんう

```

- CMD

```
$echo こんこ | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");s=s.replace(/こ/,"う");console.log(s);'
```

- OUT

```
うんこ

```
