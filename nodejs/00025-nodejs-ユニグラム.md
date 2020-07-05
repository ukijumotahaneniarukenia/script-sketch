- CMD

```
node -e 'r="うんこ".split("").reduce(function(a,cv,ci){a.push({key:ci,value:cv});return a},[]);console.log(r)'
```


- OUT

```
[
  { key: 0, value: 'う' },
  { key: 1, value: 'ん' },
  { key: 2, value: 'こ' }
]
```
