CMD

```
$ node -e 'function g(n){return Array.from({length:n},(_,i)=>{return i+1})};console.log(g(10))'
```

OUT

```
[
  1, 2, 3, 4,  5,
  6, 7, 8, 9, 10
]
```

CMD

```
$ node -e 'function g(n){return Array.from({length:n},(_,i)=>{return i+1})};console.log(...g(10))'
```

OUT

```
1 2 3 4 5 6 7 8 9 10
```
