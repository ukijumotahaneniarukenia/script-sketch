便利

CMD

```
$ node -e 'let a={name:"apple",price:10,qty:80};let {f,...r}=a;console.log(f);'
```

OUT

```
undefined
```

CMD

```
$ node -e 'let a={name:"apple",price:10,qty:80};let {f,...r}=a;console.log(r);'
```

OUT

```
{ name: 'apple', price: 10, qty: 80 }
```

CMD

```
$ node -e 'let a={name:"apple",price:10,qty:80};let {name,...rest}=a;console.log(rest);'
```

OUT

```
{ price: 10, qty: 80 }
```

CMD

```
$ node -e 'let a={name:"apple",price:10,qty:80};let {name,...rest}=a;console.log(name);'
```

OUT

```
apple
```

CMD

```
$ node -e 'let a={name:"apple",price:10,qty:80};let {name,...rest}=a;console.log({name:name});'
```

OUT

```
{ name: 'apple' }
```
