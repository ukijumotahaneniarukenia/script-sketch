CMD

```
$ node -e 'let a={name:"apple",price:10};let b={...a,price:30};console.log(a)'
```

OUT

```
{ name: 'apple', price: 10 }
```


CMD

```
$ node -e 'let a={name:"apple",price:10};let b={...a,price:30};console.log(b)'
```

OUT

```
{ name: 'apple', price: 30 }
```


基本データ型とundefinedとnullはバギー

CMD

```
$ node -e 'let a=2;console.log(a)'
```

OUT

```
2
```

CMD

```
$ node -e 'let a=2;console.log({...a})'
```

OUT

```
{}
```

CMD

```
$ node -e 'let a=2;console.log({...a}.length)'
```

OUT

```
undefined
```


CMD

```
$ node -e 'let a=null;console.log({...a})'
```

OUT
```
{}
```

CMD

```
$ node -e 'let a=undefined;console.log({...a})'
```

OUT
```
{}
```
