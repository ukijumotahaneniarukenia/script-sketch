CMD

```
$ node -p 'Number(process.argv.splice(1)[0]).toLocaleString("ja")' 012304560789
12,304,560,789
```

前ゼロ無視

```
$ node -p 'process.argv.splice(1).map(e=>Number(e).toLocaleString("ja")).join("\n")' 1 12 0123 01234 4321 321 21 1
1
12
123
1,234
4,321
321
21
1
```
