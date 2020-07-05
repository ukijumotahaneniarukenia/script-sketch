- CMD

```
node -e 'r=["a","b","c","d"].reduce(function(a,cv,ci){a.push({key:ci,value:cv});return a},[]);console.log(r)'
```

- OUT

```
[
  { key: 0, value: 'a' },
  { key: 1, value: 'b' },
  { key: 2, value: 'c' },
  { key: 3, value: 'd' }
]
```
