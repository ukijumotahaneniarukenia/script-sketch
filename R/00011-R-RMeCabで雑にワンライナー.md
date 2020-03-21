- IN

```
$echo すもももももももものうち
すもももももももものうち
```

- CMD

```
$echo すもももももももものうち | Rscript -e 'library(RMeCab);s<-readLines("stdin");ss<-RMeCabC(s);c<-unlist(ss);cc<-attr(c,"names");df<-data.frame(c,cc);colnames(df)<-c("gram","品詞");print(df)'
```

- OUT

```
    gram 品詞
1 すもも 名詞
2     も 助詞
3   もも 名詞
4     も 助詞
5   もも 名詞
6     の 助詞
7   うち 名詞
```
