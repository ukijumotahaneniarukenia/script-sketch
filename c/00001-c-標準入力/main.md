- millrerコマンドの一部
  - C勉強になる
  - https://github.com/johnkerl/miller/blob/master/perf/catc.c

- getdelim関数に紐付いて取得できた情報
  - http://manpages.ubuntu.com/manpages/bionic/ja/man3/getline.3.html

- ファイルの存在チェック
  - https://programming-place.net/ppp/contents/c/rev_res/file000.html

- fopen,fread,fwrite,fclose
  - https://www.cc.u-tokyo.ac.jp/public/VOL8/No5/data_no1_0609.pdf

- IN

```
$cat test.txt
a b c
d e f
g h i
j k l
m n o
p q r
s t u
v w x
y z
```

- CMD
  - コマンドライン引数が優先
```
$echo うんこ | ./main test{,1..2}.txt
```

- OUT

```
a b c
d e f
g h i
j k l
m n o
p q r
s t u
v w x
y z
```

- IN

```
$echo うんこ もりもり 森鴎外 | xargs -n1
うんこ
もりもり
森鴎外
```

- CMD

```
$echo うんこ もりもり 森鴎外 | xargs -n1 | ./main
```

- OUT

```
うんこ
もりもり
森鴎外
```

- IN

```
$echo うんこ もりもり 森鴎外 | xargs -n2
うんこ もりもり
森鴎外
```

- CMD

```
$echo うんこ もりもり 森鴎外 | xargs -n2 | ./main
```

- OUT

```
うんこ もりもり
森鴎外
```
