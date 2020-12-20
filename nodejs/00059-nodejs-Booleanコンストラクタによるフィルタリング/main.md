CMD

```
$ node -e 'let a=[0, "blue","", NaN, 9, true, undefined, "white", false];console.log(a)'
```

OUT

```
[
  0,         'blue',
  '',        NaN,
  9,         true,
  undefined, 'white',
  false
]
```

CMD

```
$ node -e 'let a=[0, "blue","", NaN, 9, true, undefined, "white", false];let b=a.filter(e=>{return Boolean(e)});console.log(b)'
```

OUT

```
[ 'blue', 9, true, 'white' ]
```
