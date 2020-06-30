- LIB

```
pip3 install --user kanjize
```


- IN

```
$ echo {1..20} | tr ' ' '\n'
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
```

- CMD


```
$ echo {1..20} | tr ' ' '\n' | python3  -c 'from kanjize import int2kanji, kanji2int;import sys;a=list(map(lambda x:int(x.strip()),sys.stdin.readlines()));b=list(map(lambda x:int2kanji(x),a));print(*a,"\n",*b)'
```

- OUT

```
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
 一 二 三 四 五 六 七 八 九 十 十一 十二 十三 十四 十五 十六 十七 十八 十九 二十
```
