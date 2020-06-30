- IN

```
$ seq 20|numconv -f Western -t Mandarin_Regular_Simplified
一
二
三
四
五
六
七
八
九
十
十一
十二
十三
十四
十五
十六
十七
十八
十九
二十
```

- CMD

```
seq 20|numconv -f Western -t Mandarin_Regular_Simplified|nkf -j|kakasi -JH|nkf -w
```


- OUT

```
いち
に
さん
し
ご
ろく
しち
はち
きゅう
じゅう
じゅういち
じゅうに
じゅうさん
じゅうよん
じゅうご
じゅうろく
じゅうしち
じゅうはち
じゅうきゅう
にじゅう
```


- CMD


```
echo 森鴎外 | nkf -j|kakasi -JH|nkf -w
```

- OUT

```
もりおうがい
```
