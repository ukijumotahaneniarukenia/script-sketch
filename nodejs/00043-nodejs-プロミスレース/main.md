CMD

```
$ node -e 'function n(w,s){return new Promise((resolve,reject)=>{setTimeout(resolve,w,s)})};function g(s){return n(Math.ceil(Math.random()*1000),s)};let p=["ポルコ","ジーナ","まるこ"].map(e=>{return g(e)});Promise.race(p).then(r=>console.log(r))'
```

OUT

```
ポルコ
```
