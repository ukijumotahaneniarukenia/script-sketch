CMD

```
$ node -e 'Promise.allSettled([Promise.resolve("a"),Promise.resolve(null),Promise.resolve(""),Promise.resolve(undefined),Promise.resolve([1,2]),Promise.resolve(["a","b"]),Promise.resolve(0),Promise.reject(9),Promise.reject({s:0,e:9}),Promise.resolve(true),Promise.reject(true),Promise.resolve(false),Promise.reject(false),Promise.resolve([{s:0},{e:9}])]).then(list=>{console.log(list)}).catch(list=>{console.log(list)})'
```

OUT

```
[
  { status: 'fulfilled', value: 'a' },
  { status: 'fulfilled', value: null },
  { status: 'fulfilled', value: '' },
  { status: 'fulfilled', value: undefined },
  { status: 'fulfilled', value: [ 1, 2 ] },
  { status: 'fulfilled', value: [ 'a', 'b' ] },
  { status: 'fulfilled', value: 0 },
  { status: 'rejected', reason: 9 },
  { status: 'rejected', reason: { s: 0, e: 9 } },
  { status: 'fulfilled', value: true },
  { status: 'rejected', reason: true },
  { status: 'fulfilled', value: false },
  { status: 'rejected', reason: false },
  { status: 'fulfilled', value: [ [Object], [Object] ] }
]
```

CMD

```
$ node -e 'Promise.all([Promise.resolve("a"),Promise.resolve(null),Promise.resolve(""),Promise.resolve(undefined),Promise.resolve([1,2]),Promise.resolve(["a","b"]),Promise.resolve(0),Promise.reject(9),Promise.reject({s:0,e:9}),Promise.resolve(true),Promise.reject(true),Promise.resolve(false),Promise.reject(false),Promise.resolve([{s:0},{e:9}])]).then(list=>{console.log(list)}).catch(list=>{console.log(list)})'
```

OUT

```
9
```
