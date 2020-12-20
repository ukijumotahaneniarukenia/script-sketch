CMD

```
$ node -e 'let a=["apple","banana","kiwii"];let b=[...a].map((e,i)=>{return {i,e}});console.log(b)'
```


OUT

```
[ { i: 0, e: 'apple' }, { i: 1, e: 'banana' }, { i: 2, e: 'kiwii' } ]
```

CMD

```
$ node -e 'let a=["apple","banana","kiwii"];let b=[...a].map((e,i)=>{return {key:i,e}});console.log(b)'
```

OUT

```
[
  { key: 0, e: 'apple' },
  { key: 1, e: 'banana' },
  { key: 2, e: 'kiwii' }
]
```

CMD

```
$ node -e 'let a=["apple","banana","kiwii"];let b=[...a].map((e,i)=>{return {key:i}});console.log(b)'
```

OUT

```
[ { key: 0 }, { key: 1 }, { key: 2 } ]
```

CMD

```
$ node -e 'let a=["apple","banana","kiwii"];let b=[...a].map((e,i)=>{return {value:e}});console.log(b)'
```


OUT

```
[ { value: 'apple' }, { value: 'banana' }, { value: 'kiwii' } ]
```

CMD

```
$ node -e 'let a=["apple","banana","kiwii"];let b=[...a].map((e,i)=>{return {key:i,value:e}});console.log(b)'
```


OUT

```
[
  { key: 0, value: 'apple' },
  { key: 1, value: 'banana' },
  { key: 2, value: 'kiwii' }
]
```


関数化

CMD


```
$ node -e 'let a=["apple","banana","kiwii"];function ary2obj(targetArray,...keyName){return [...targetArray].map((e,i)=>{return {key:i,[keyName[0]===undefined?"value":keyName]:e}})};console.log(ary2obj(a))'
```

OUT

```
[
  { key: 0, value: 'apple' },
  { key: 1, value: 'banana' },
  { key: 2, value: 'kiwii' }
]
```

CMD


```
$ node -e 'let a=["apple","banana","kiwii"];function ary2obj(targetArray,...keyName){return [...targetArray].map((e,i)=>{return {key:i,[keyName[0]===undefined?"value":keyName]:e}})};console.log(ary2obj(a,"item"))'
```

OUT

```
[
  { key: 0, item: 'apple' },
  { key: 1, item: 'banana' },
  { key: 2, item: 'kiwii' }
]
```
