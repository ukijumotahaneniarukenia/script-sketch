```
node -e 'r="caffelatte".split("").reduce(function(a,cv,ci){a.push({key:ci,value:cv});return a},[]);console.log(r)'
[
  { key: 0, value: 'c' },
  { key: 1, value: 'a' },
  { key: 2, value: 'f' },
  { key: 3, value: 'f' },
  { key: 4, value: 'e' },
  { key: 5, value: 'l' },
  { key: 6, value: 'a' },
  { key: 7, value: 't' },
  { key: 8, value: 't' },
  { key: 9, value: 'e' }
]

node -e 'r="caffelatte".split("").reduce(function(a,cv,ci){a.push(cv);return a},[]);console.log(r)'
[
  'c', 'a', 'f', 'f',
  'e', 'l', 'a', 't',
  't', 'e'
]

node -e 'r="caffelatte".split("").reduce(function(a,cv,ci,s){if(a[cv]===undefined){a[cv]="";}a[cv]+=ci;return a},{});Object.entries(r).map(e=>console.log({key:e[0],value:e[1].length}))' | sort
{ key: 'a', value: 2 }
{ key: 'c', value: 1 }
{ key: 'e', value: 2 }
{ key: 'f', value: 2 }
{ key: 'l', value: 1 }
{ key: 't', value: 2 }

```
