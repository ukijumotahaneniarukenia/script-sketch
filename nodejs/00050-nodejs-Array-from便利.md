CMD

```
$ node -p 'Array.from(Array(10))'
```

OUT

```
[
  undefined, undefined,
  undefined, undefined,
  undefined, undefined,
  undefined, undefined,
  undefined, undefined
]
```

CMD

```
$ node -p 'Array.from(Array(10),(e,i)=>i)'
```

OUT

```
[
  0, 1, 2, 3, 4,
  5, 6, 7, 8, 9
]
```

CMD

```
$ node -p 'Array.from(Array(10),(e,i)=>e)'
```

OUT

```
[
  undefined, undefined,
  undefined, undefined,
  undefined, undefined,
  undefined, undefined,
  undefined, undefined
]
```


CMD

```
$ node -e 'let a=[{name:"apple",price:10},{name:"banana",price:20},{name:"orange",price:30}];console.log(a)'
```

OUT

```
[
  { name: 'apple', price: 10 },
  { name: 'banana', price: 20 },
  { name: 'orange', price: 30 }
]
```

CMD

```
$ node -e 'let a=[{name:"apple",price:10},{name:"banana",price:20},{name:"orange",price:30}];let r=Array.from(a,(e,i)=>{return a[i]});console.log(r[1])'
```

OUT

```
{ name: 'banana', price: 20 }
```

CMD

```
$ node -e 'let a=[{name:"apple",price:10},{name:"banana",price:20},{name:"orange",price:30}];console.log(Array.from(a,(e,i)=>i))'
```

OUT

```
[ 0, 1, 2 ]
```

CMD

```
$ node -e 'let a=[{name:"apple",price:10},{name:"banana",price:20},{name:"orange",price:30}];console.log(Array.from(a,(e,i)=>e))'
```

OUT

```
[
  { name: 'apple', price: 10 },
  { name: 'banana', price: 20 },
  { name: 'orange', price: 30 }
]
```

CMD

```
$ node -e 'let a=[{name:"apple",price:10},{name:"banana",price:20},{name:"orange",price:30}];console.log(Array.from(a,(e,i)=>a[i]))'
```

OUT

```
[
  { name: 'apple', price: 10 },
  { name: 'banana', price: 20 },
  { name: 'orange', price: 30 }
]
```
