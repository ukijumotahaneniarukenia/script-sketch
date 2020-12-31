```
$ node -p 'process.argv.splice(1).map(e=>{return {"item":e,"escape":escape(e)}})'  ちび まる子 ちゃん
[
  { item: 'ちび', escape: '%u3061%u3073' },
  { item: 'まる子', escape: '%u307E%u308B%u5B50' },
  { item: 'ちゃん', escape: '%u3061%u3083%u3093' }
]
```
