# 参考文献

正規表現でand検索
肯定先読みで実現

https://boukenki.info/sakuraeditor-and-kensaku/

Unicodeプロパティ

https://www.google.com/amp/s/blog.tes.co.jp/entry/2018/06/29/145450%3Famp%3D1

Icuの正規表現

http://userguide.icu-project.org/strings/regexp

[stringiで輝く☆テキストショリスト](https://qiita.com/kohske/items/85d49da04571e9055c44)


ここで遊べる
[ICU Regular Expression Demonstration](http://demo.icu-project.org/icu-bin/redemo)


# 環境

```R
[sqlite💕ceacf3fb0808 (月 11月 04 23:30:20) ~/script_scratch/R]$R --version
R version 3.6.0 (2019-04-26) -- "Planting of a Tree"
Copyright (C) 2019 The R Foundation for Statistical Computing
Platform: x86_64-redhat-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
https://www.gnu.org/licenses/.


```

# ライブラリ

```R
library(stringi)
```

# データ

ベクタ型ままであると勝手に折り返されるので、単一のベクタにおいて関数の入出力を確認した後はデータフレーム型に変換しておく。見やすくしておく。

```R
> c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
```

データフレーム化

```R
> data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y   col
1    D
2   DI
3  DIS
4    S
5   SI
6  SID
7    M
8   Mj
9  Mj9
10   9
11  9j
12 9jM
13   r
14  r6
15 r6y
16   y
17  y6
18 y6r
```

動き確認した後、さまる。

```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> library(stringi)
> col2<-stri_detect_regex(col1,"9")
> col3<-stri_detect_regex(col1,"9(?=j)")
> col4<-stri_detect_regex(col1,"9(?!j)")
> col5<-stri_detect_regex(col1,"(?<=j)9")
> col6<-stri_detect_regex(col1,"(?<!j)9")
> data.frame(col1,col2,col3,col4,col5,col6)
   col1  col2  col3  col4  col5  col6
1     D FALSE FALSE FALSE FALSE FALSE
2    DI FALSE FALSE FALSE FALSE FALSE
3   DIS FALSE FALSE FALSE FALSE FALSE
4     S FALSE FALSE FALSE FALSE FALSE
5    SI FALSE FALSE FALSE FALSE FALSE
6   SID FALSE FALSE FALSE FALSE FALSE
7     M FALSE FALSE FALSE FALSE FALSE
8    Mj FALSE FALSE FALSE FALSE FALSE
9   Mj9  TRUE FALSE  TRUE  TRUE FALSE
10    9  TRUE FALSE  TRUE FALSE  TRUE
11   9j  TRUE  TRUE FALSE FALSE  TRUE
12  9jM  TRUE  TRUE FALSE FALSE  TRUE
13    r FALSE FALSE FALSE FALSE FALSE
14   r6 FALSE FALSE FALSE FALSE FALSE
15  r6y FALSE FALSE FALSE FALSE FALSE
16    y FALSE FALSE FALSE FALSE FALSE
17   y6 FALSE FALSE FALSE FALSE FALSE
18  y6r FALSE FALSE FALSE FALSE FALSE
```


# 型確認

[データ型](https://stats.biopapyrus.jp/r/basic/data-type.html)
[データ型](http://lang.sist.chukyo-u.ac.jp/classes/R/Rintro-02.html)


typeof関数で確認

```R
> typeof(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] "character"
> typeof(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] "list"
```

class関数で確認

```R
> class(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] "character"
> class(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] "data.frame"
```

mode関数で確認

```R
> mode(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] "character"
> mode(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] "list"

```

しらみつぶしに調べてみる。

ベクタ型単一に決まる。

```R
> is.vector(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] TRUE
> is.list(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] FALSE
> is.matrix(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] FALSE
> is.array(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] FALSE
> is.data.frame(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] FALSE
> is.factor(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] FALSE
> is.ordered(c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r'))
[1] FALSE

```

リスト型でもあり、データフレーム型でもある。。。

```R
> is.vector(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] FALSE
> is.list(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] TRUE
> is.matrix(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] FALSE
> is.array(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] FALSE
> is.data.frame(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] TRUE
> is.factor(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] FALSE
> is.ordered(data.frame(col=c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')))
[1] FALSE
```



```
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"9")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"9(?=j)")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"9(?!j)")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"(?<=j)9")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"(?<!j)9")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
```

```
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"j")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"(?<=M)j")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"(?<=M)j(?=9)")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
```

```
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"\\d")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
[13] FALSE  TRUE  TRUE FALSE  TRUE  TRUE
```

```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"[A-Z]{3}")
 [1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"[A-Z]")
 [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"[a-z]")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
[13]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

```

```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"[a-z0-9]{1,}")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
[13]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

```

```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"[[:digit:]]")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
[13] FALSE  TRUE  TRUE FALSE  TRUE  TRUE

```

```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"[[:alpha:]]")
 [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
[13]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

```

```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"[[:alnum:]]")
 [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[16] TRUE TRUE TRUE
> stri_detect_regex(col1,"[[:upper:]]")
 [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"[[:lower:]]")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
[13]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

```

```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"[^0-9]")
 [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
[13]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```


```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"(?<=[^0-9]?)9")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
```


```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"(?<=[[:lower:]])[[:digit:]]")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[13] FALSE  TRUE  TRUE FALSE  TRUE  TRUE
> stri_detect_regex(col1,"(?<=[[:lower:]])[[:digit:]](?![[:lower:]])")
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[13] FALSE  TRUE FALSE FALSE  TRUE FALSE
```


```R
> col1<-c('D','DI','DIS','S','SI','SID','M','Mj','Mj9','9','9j','9jM','r','r6','r6y','y','y6','y6r')
> col1
 [1] "D"   "DI"  "DIS" "S"   "SI"  "SID" "M"   "Mj"  "Mj9" "9"   "9j"  "9jM"
[13] "r"   "r6"  "r6y" "y"   "y6"  "y6r"
> stri_detect_regex(col1,"I")
 [1] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,".I")
 [1] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,"I.")
 [1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[13] FALSE FALSE FALSE FALSE FALSE FALSE
> stri_detect_regex(col1,".I.")
 [1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[13] FALSE FALSE FALSE FALSE FALSE FALSE

```

これべんり
[How to use str_split with regex in R?
](https://stackoverflow.com/questions/49439692/how-to-use-str-split-with-regex-in-r)

[Rで文字をUnicodeに変えるときはstringiパッケージ](https://kitamix.net/archives/convert-to-unicode-with-stringr-in-r/1089)
```R
> stri_extract_all_regex(c("こんばんは"),".")
[[1]]
[1] "こ" "ん" "ば" "ん" "は"
> stri_extract_all_regex(c("こんばんは"),".")[[1]]
[1] "こ" "ん" "ば" "ん" "は"
> stri_escape_unicode(stri_extract_all_regex(c("こんばんは"),".")[[1]])
[1] "\\u3053" "\\u3093" "\\u3070" "\\u3093" "\\u306f"
> data.frame(col1=c("こんばんは"),col2=stri_extract_all_regex(c("こんばんは"),".")[[1]],col3=stri_escape_unicode(stri_extract_all_regex(c("こんばんは"),".")[[1]]))
        col1 col2    col3
1 こんばんは   こ \\u3053
2 こんばんは   ん \\u3093
3 こんばんは   ば \\u3070
4 こんばんは   ん \\u3093
5 こんばんは   は \\u306f


```

標準関数だと

[パターンにマッチした部分文字列を返すR標準関数 regmatches()](https://a-habakiri.hateblo.jp/entry/2016/12/19/234543)
```R
> x<-"こんにちわ"
> gregexpr(".", x)
[[1]]
[1] 1 2 3 4 5
attr(,"match.length")
[1] 1 1 1 1 1

```

これがいいな
[Rで正規表現](http://rmecab.jp/wiki/index.php?R%A4%C7%C0%B5%B5%AC%C9%BD%B8%BD)

```R

> strsplit(x,"")
[[1]]
[1] "こ" "ん" "に" "ち" "わ"

> strsplit(x,"")[[1]]
[1] "こ" "ん" "に" "ち" "わ"

```
