CMD

```
$ node -e 'let a=[{ key: 0, item: "apple" },{ key: 1, item: "banana" },{ key: 2, item: "kiwii" }];let b=Array.from(a,(e)=>{return e});console.log(b)'
```

OUT

```
[
  { key: 0, item: 'apple' },
  { key: 1, item: 'banana' },
  { key: 2, item: 'kiwii' }
]
```

CMD


```
$ node -e 'let a=[{ key: 0, item: "apple" },{ key: 1, item: "banana" },{ key: 2, item: "kiwii" }];let b=Array.from(a,(e)=>{return e.item});console.log(b)'
```

OUT


```
[ 'apple', 'banana', 'kiwii' ]
```
