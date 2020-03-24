- CMD
  - paste単一列グループ
```
$cat test.csv | Rscript -e 's<-read.csv("stdin",header=TRUE,sep=',');ss<-tapply(s$numdat,paste(s$grp),sum);sss<-data.frame(rownames(t(t(ss))),t(t(ss)));rownames(sss)<-c(1:nrow(sss));colnames(sss)<-c("grp","val");sss'
```


- OUT

```
  grp val
1   a  42
2   b  32
```

- CMD
  - paste複数列グループ
```
$cat test.csv | Rscript -e 's<-read.csv("stdin",header=TRUE,sep=',');ss<-tapply(s$numdat,paste(s$grp,s$subgrp),sum);sss<-data.frame(rownames(t(t(ss))),t(t(ss)));rownames(sss)<-c(1:nrow(sss));colnames(sss)<-c("grp","val");sss'
```

- OUT

```
  grp val
1 a c  23
2 a d  19
3 b c  13
4 b d  19
```
