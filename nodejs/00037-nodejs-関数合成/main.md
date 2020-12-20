CMD

```
$ node -p 'a=[{name:"ポルコ"},{role:"ぶた"}];b=[{name:"ジーナ"},{role:"恋人"}];zip=(...c)=>{return c.map(ary=>{return ary.reduce((acc,ele)=>{return Object.assign(acc,ele)},{})})};r=JSON.stringify(zip(a,b));'|jq
```

OUT

```
[
  {
    "name": "ポルコ",
    "role": "ぶた"
  },
  {
    "name": "ジーナ",
    "role": "恋人"
  }
]
```

CMD

```
$ node -p 'a=[{name:"ポルコ"},{name:"ジーナ"}];b=[{role:"ぶた"},{role:"恋人"}];zip=(...c)=>{return c[0].map((ele,idx)=>{return Object.assign(ele,c[1][idx])})};r=JSON.stringify(zip(a,b));'|jq
```

OUT

```
[
  {
    "name": "ポルコ",
    "role": "ぶた"
  },
  {
    "name": "ジーナ",
    "role": "恋人"
  }
]
```
