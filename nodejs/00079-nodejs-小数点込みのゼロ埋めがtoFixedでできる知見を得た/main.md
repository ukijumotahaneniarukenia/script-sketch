CMD

```
$ node -p 'i=process.argv.splice(1);i.map(e=>Number(e).toFixed(String(Math.max(...i)).length-(e.length-1))).join("\n")' 1 12 123 1234 4321 321 21 1
1.0000
12.000
123.00
1234.0
4321.0
321.00
21.000
1.0000
```
