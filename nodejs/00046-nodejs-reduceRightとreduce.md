CMD

```
$ node -e 'let ary=["a","b","c","d","e"];let r =ary.reduce((a,c,i,l)=>{let p=a===undefined?l[(i-1)]:a;console.log(c,p)});'
```

OUT

```
b a
c b
d c
e d
```

CMD

```
$ node -e 'let ary=["a","b","c","d","e"];let r =ary.reduceRight((a,c,i,l)=>{let p=a===undefined?l[(i+1)]:a;console.log(c,p)});'
```

OUT

```
d e
c d
b c
a b
```
