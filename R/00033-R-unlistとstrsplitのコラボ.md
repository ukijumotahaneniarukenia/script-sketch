- CMD

```
$Rscript -e 'paste(c("う","ん","こ"),c("A","B","C"),sep="-")'
```

- OUT

```
[1] "う-A" "ん-B" "こ-C"
```


- CMD

```
$Rscript -e 'paste(unlist(strsplit("うんこ","")),c("A","B","C"),sep="-")'
```


- OUT

```
[1] "う-A" "ん-B" "こ-C"
```

- CMD

```
$Rscript -e 'paste(c("う","ん","こ"),unlist(strsplit("ABC","")),sep="-")'
```

- OUT

```
[1] "う-A" "ん-B" "こ-C"
```

- CMD

```
$Rscript -e 'paste(unlist(strsplit("ABC","")),c("う","ん","こ"),sep="-")'
```

- OUT

```
[1] "A-う" "B-ん" "C-こ"
```


- CMD
  - 標準入力からのやつ。単一行の場合
```
$echo うんこ ABC | Rscript -e 's<-readLines("stdin");ss<-unlist(strsplit(s," "));paste(unlist(strsplit(ss[1],"")),unlist(strsplit(ss[2],"")),sep="-")'
```

- OUT

```
[1] "う-A" "ん-B" "こ-C"
```

- IN

```
$parallel echo ::: {ウンコ,もりもり,森鴎外} ::: ABC
ウンコ ABC
もりもり ABC
森鴎外 ABC
```

- CMD
  - 標準入力からのやつ。複数行の場合

```
$parallel echo ::: {ウンコ,もりもり,森鴎外} ::: ABC | Rscript -e 's<-readLines("stdin");ss<-strsplit(s," ");sapply(ss,function(e){return (paste(unlist(strsplit(e[1],"")),unlist(strsplit(e[2],"")),sep="-"))})'
```

- OUT

```
[[1]]
[1] "ウ-A" "ン-B" "コ-C"

[[2]]
[1] "も-A" "り-B" "も-C" "り-A"

[[3]]
[1] "森-A" "鴎-B" "外-C"

```


- CMD

```
parallel echo ::: {ウンコ,もりもり,森鴎外} ::: ABC | Rscript -e 's<-readLines("stdin");ss<-strsplit(s," ");sss<-sapply(ss,function(e){return (paste(unlist(strsplit(e[1],"")),unlist(strsplit(e[2],"")),sep="-"))});df<-data.frame(unlist(sss));colnames(df)<-c("gram");df'
```

- OUT

```
   gram
1  ウ-A
2  ン-B
3  コ-C
4  も-A
5  り-B
6  も-C
7  り-A
8  森-A
9  鴎-B
10 外-C
```
