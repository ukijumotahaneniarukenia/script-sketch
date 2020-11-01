CMD

```
$ node -e 'let a={name:"apple"};let b={price:10};console.log(a)'
```

OUT

```
{ name: 'apple' }
```

CMD

```
$ node -e 'let a={name:"apple"};let b={price:10};console.log(b)'
```

OUT

```
{ price: 10 }
```

CMD

```
$ node -e 'let a={name:"apple"};let b={price:10};console.log({...a,...b})'
```

OUT

```
{ name: 'apple', price: 10 }
```

CMD

```
$ node -e 'let a={name:"apple"};let b={price:10};let c={...a,...b};console.log(c)'
```

OUT

```
{ name: 'apple', price: 10 }
```
