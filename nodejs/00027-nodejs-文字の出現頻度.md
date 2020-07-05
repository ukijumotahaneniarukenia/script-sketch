- CMD

```
node -e 'r="caffelatte".split("").reduce(function(a,cv,ci,s){if(!a[cv]){a[cv]=0;}a[cv]+=1;return a},{});Object.entries(r).map(e=>console.log({key:e[0],value:e[1]}))'
```


- OUT

```
{ key: 'c', value: 1 }
{ key: 'a', value: 2 }
{ key: 'f', value: 2 }
{ key: 'e', value: 2 }
{ key: 'l', value: 1 }
{ key: 't', value: 2 }
```
