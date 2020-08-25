- CMD

```
$ echo 'const {argv,stdin} = process;a=argv.splice(2,argv.length-1).map(ele=>ele.split("\n")).flat().map(row=>row.split(" "));[...Array(a.length).keys()].map(e=>a.slice(e).join("")).join("\n")' | node -p - {a..e}
```

- OUT

```
abcde
bcde
cde
de
e
```
