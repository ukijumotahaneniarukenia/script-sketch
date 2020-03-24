- IN

```
$cat test.csv
rn,grp,subgrp,strdat,numdat,dtmdat
1,a,c,Y,11,2020-03-21
2,a,c,I,12,2020-03-22
3,a,d,V,4,2020-03-23
4,a,d,D,15,2020-03-24
5,b,c,Q,5,2020-03-25
6,b,c,C,8,2020-03-26
7,b,d,L,6,2020-03-27
8,b,d,R,10,2020-03-28
9,b,d,U,3,2020-03-29
```

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
