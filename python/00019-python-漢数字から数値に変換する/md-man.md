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
$ seq 20|numconv -f Western -t Mandarin_Regular_Simplified| python3  -c 'from kanjize import int2kanji, kanji2int;import sys;a=list(map(lambda x:x.strip(),sys.stdin.readlines()));b=list(map(lambda x:kanji2int(x),a));print(*a,"\n",*b)'
```


- OUT

```
一 二 三 四 五 六 七 八 九 十 十一 十二 十三 十四 十五 十六 十七 十八 十九 二十 
 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
```
