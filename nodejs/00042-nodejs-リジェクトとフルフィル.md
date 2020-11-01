CMD

```
$ node -e 'function n(list){list.map((e)=>{console.log(`{${JSON.stringify(e.status)}:${JSON.stringify(e.status==="rejected"?e.reason:e.value)}}`)})};Promise.allSettled([Promise.reject({s:0,e:9}),Promise.resolve([{s:0},{e:9}])]).then(list=>{n(list)}).catch(list=>{n(list)})'|jq -s
```

OUT

```
[
  {
    "rejected": {
      "s": 0,
      "e": 9
    }
  },
  {
    "fulfilled": [
      {
        "s": 0
      },
      {
        "e": 9
      }
    ]
  }
]
```
