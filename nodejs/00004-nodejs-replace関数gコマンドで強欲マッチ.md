- CMD

```
root ubuntu-19-10-vim /home/kuraine/script-sketch/nodejs$echo こんこ | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");s=s.replace(/こ/g,"う");console.log(s);'
うんう

root ubuntu-19-10-vim /home/kuraine/script-sketch/nodejs$echo こんこ | node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");s=s.replace(/こ/,"う");console.log(s);'
うんこ

```



