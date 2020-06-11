
- CMD

```
ruby -ruconv -e 's="うんこ";p Uconv.u8tou16(s).bytes;p Uconv.u8tou4(s).bytes;'
```

- OUT

```

[70, 48, 147, 48, 83, 48]
[70, 48, 0, 0, 147, 48, 0, 0, 83, 48, 0, 0]

```
