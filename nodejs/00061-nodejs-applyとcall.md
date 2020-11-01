Rのapply的なやつ


CMD


```
$ node -e 'let a=[11,44,3,5,77];let rt=Math.max.apply(null,a);console.log(rt)'
```

OUT

```
77
```

CMD

```
$ node -e 'let a=[11,44,3,5,77];let rt=Math.min.apply(null,a);console.log(rt)'
```

OUT

```
3
```

CMD

```
$ node -e 'let a=[1,2,3];let b=["a","b","c"];console.log(a);a.push.apply(a,b);console.log(a)'
```

OUT

```
[ 1, 2, 3 ]
[ 1, 2, 3, 'a', 'b', 'c' ]
```

CMD

```
$ node -e 'let a=[11,44,3,5,77];let rt=Math.max.call(null,...a);console.log(rt)'
```

OUT

```
77
```

CMD

```
$ node -e 'let a=[11,44,3,5,77];let rt=Math.min.call(null,...a);console.log(rt)'
```

OUT

```
3
```
