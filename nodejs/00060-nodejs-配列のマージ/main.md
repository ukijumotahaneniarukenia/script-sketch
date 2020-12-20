CMD

```
$ node -e 'let a=["apple","kiwii"];let b=["fish","duck","beef"];let c=["tomato","potato"];let d=[...a,...b,...c];console.log(d)'
```

OUT

```
[
  'apple',  'kiwii',
  'fish',   'duck',
  'beef',   'tomato',
  'potato'
]
```
