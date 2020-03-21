- IN

```
$cat test2.txt
救急車。
ふくへいはじめて。
$parallel echo :::: test2.txt ::: ABC
救急車。 ABC
ふくへいはじめて。 ABC
```

- CMD

  - ベクタ
```
$parallel echo :::: test2.txt ::: ABC | Rscript -e 's<-readLines("stdin");s'
[1] "救急車。 ABC"           "ふくへいはじめて。 ABC"
```


- CMD
  - 行単位にするため、split
```
$parallel echo :::: test2.txt ::: ABC | Rscript -e 's<-readLines("stdin");ss<-strsplit(s," ");ss'
[[1]]
[1] "救急車。" "ABC"

[[2]]
[1] "ふくへいはじめて。" "ABC"


```


- CMD
  - それ自身を返却するとマトリックス型で返却される

```
$parallel echo :::: test2.txt ::: ABC | Rscript -e 's<-readLines("stdin");ss<-strsplit(s," ");sss<-sapply(ss,function(e){return (c(e))});sss'
     [,1]       [,2]
[1,] "救急車。" "ふくへいはじめて。"
[2,] "ABC"      "ABC"
$parallel echo :::: test2.txt ::: ABC | Rscript -e 's<-readLines("stdin");ss<-strsplit(s," ");sss<-sapply(ss,function(e){return (c(e))});class(sss)'
[1] "matrix"
```

- CMD
  - 行単位にするため、転置かます
```
$parallel echo :::: test2.txt ::: ABC | Rscript -e 's<-readLines("stdin");ss<-strsplit(s," ");sss<-sapply(ss,function(e){return (c(e))});t(sss)'
     [,1]                 [,2]
[1,] "救急車。"           "ABC"
[2,] "ふくへいはじめて。" "ABC"
```


- CMD
  - 文字数カウントできる

```
$parallel echo :::: test2.txt ::: ABC | Rscript -e 's<-readLines("stdin");ss<-strsplit(s," ");sss<-sapply(ss,function(e){return (c(e,nchar(e)))});t(sss)'
     [,1]                 [,2]  [,3] [,4]
[1,] "救急車。"           "ABC" "4"  "3"
[2,] "ふくへいはじめて。" "ABC" "9"  "3"

```

- IN

```
$parallel echo :::: test2.txt ::: ABC | ./a.R
```

- CMD

```
#!/usr/bin/env Rscript

s<-readLines("stdin");
ss<-strsplit(s," ");
sss<-sapply(ss,function(e){
                 return ((
                          c(
                            unlist(strsplit(e[1],""))
                            ,unlist(strsplit(e[2],""))
                          )
                        ))
          });
sss
```



- OUT

```
[[1]]
[1] "救" "急" "車" "。" "A"  "B"  "C"

[[2]]
 [1] "ふ" "く" "へ" "い" "は" "じ" "め" "て" "。" "A"  "B"  "C"

```






- IN

```
$parallel echo :::: test2.txt ::: ABC | ./a.R
```


- CMD

```
#!/usr/bin/env Rscript

s<-readLines("stdin");
ss<-strsplit(s," ");
sss<-sapply(ss,function(e){
                 return ((
                          c(
                             paste(unlist(strsplit(e[1],"")),unlist(strsplit(e[2],"")),sep="-")
                          )
                        ))
          });
sss
```

- OUT

```
[[1]]
[1] "救-A" "急-B" "車-C" "。-A"

[[2]]
[1] "ふ-A" "く-B" "へ-C" "い-A" "は-B" "じ-C" "め-A" "て-B" "。-C"

```
