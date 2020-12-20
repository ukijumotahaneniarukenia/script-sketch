CMD

```
$ node -e 'function a(n){return new Promise(()=>{let a="";const t=setInterval(()=>{if(n--){a=a+" "+String(n+1);console.log(a.replace(/^ /,""))}else{clearInterval(t)}},1)})};a(9)'
```

OUT

```
9
9 8
9 8 7
9 8 7 6
9 8 7 6 5
9 8 7 6 5 4
9 8 7 6 5 4 3
9 8 7 6 5 4 3 2
9 8 7 6 5 4 3 2 1
```
