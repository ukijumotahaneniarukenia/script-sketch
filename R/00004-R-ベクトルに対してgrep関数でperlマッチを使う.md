- IN
  - 標準入力を各ベクトル化
```
$cat test.txt | Rscript -e 's<-readLines("stdin");print(s)'
 [1] "救急車。"
 [2] "ふくへいはじめて。"
 [3] "老齢はなじ伐採。"
 [4] "じょうだんはっぽう右利き減俸。"
 [5] "店壊すひかくする先ずめいがら。"
 [6] "あおい学院かんじるえきびょう奴らけいむしょ。"
 [7] "封筒ほうせきはちのす差し上げる譜面げんめつむく。"
 [8] "うえる部首じぶんいじんころすまつかちゅうもうす。"
 [9] "魔術けいむしょ十台お盆電話鍋継承じょうだんハチのす。"
[10] "ぼうずだくりゅうごうけんこうぞく山葵漠然うえる弱虫きひんあくれい。"


- CMD
```
$cat test.txt | Rscript -e 's<-readLines("stdin");print(s[2])'
```

- OUT

```
[1] "ふくへいはじめて。"
```

- CMD

```
$cat test.txt | Rscript -e 's<-readLines("stdin");print(s[3])'
```

- OUT
```
[1] "老齢はなじ伐採。"
```

- CMD
```
$cat test.txt | Rscript -e 's<-readLines("stdin");print(s[10])'
```

- OUT
```
[1] "ぼうずだくりゅうごうけんこうぞく山葵漠然うえる弱虫きひんあくれい。"
```

- CMD

```
$cat test.txt | Rscript -e 's<-readLines("stdin");print(s[11])'
```

- OUT
  - 指定したベクトル要素番号に紐付かないベクトルがあるときはNAが返却される
```
[1] NA
```

- CMD
  - 各ベクトルにマッチしたベクトル要素番号が返されてくる
```
$cat test.txt | Rscript -e 's<-readLines("stdin");m<-grep("う",s,perl = T);print(m)'
```

- OUT
```
[1]  4  6  7  8  9 10
```


- CMD
  - マッチしたベクトル要素番号に紐づく、ベクトルを抽出

```
$cat test.txt | Rscript -e 's<-readLines("stdin");m<-grep("う",s,perl = T);print(s[m])'
```

- OUT

```
[1] "じょうだんはっぽう右利き減俸。"
[2] "あおい学院かんじるえきびょう奴らけいむしょ。"
[3] "封筒ほうせきはちのす差し上げる譜面げんめつむく。"
[4] "うえる部首じぶんいじんころすまつかちゅうもうす。"
[5] "魔術けいむしょ十台お盆電話鍋継承じょうだんハチのす。"
[6] "ぼうずだくりゅうごうけんこうぞく山葵漠然うえる弱虫きひんあくれい。"
```


- CMD
  - マッチしていない場合
```
$cat test.txt | Rscript -e 's<-readLines("stdin");m<-grep("うんこ",s,perl = T);print(m)'
```

- OUT

```
integer(0)
```

- CMD
  - マッチしていない場合
```
$cat test.txt | Rscript -e 's<-readLines("stdin");m<-grep("うんこ",s,perl = T);print(s[m])'
```

- OUT

```
character(0)
```


- CMD
  - invertでアンマッチを取得できる
```
$cat test.txt | Rscript -e 's<-readLines("stdin");m<-grep("う",s,perl = T,invert=T);print(m)'
```

- OUT

```
[1] 1 2 3 5
```

- CMD

```
$cat test.txt | Rscript -e 's<-readLines("stdin");m<-grep("う",s,perl = T,invert=T);print(s[m])'
```

- OUT

```
[1] "救急車。"                       "ふくへいはじめて。"
[3] "老齢はなじ伐採。"               "店壊すひかくする先ずめいがら。"
```
