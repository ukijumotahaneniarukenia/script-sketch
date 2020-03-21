- CMD

```
#!/usr/bin/env Rscript

listagg<-function(tgt){
  return (paste(unique(tgt),collapse=","))
}

numdat <- c(11, 12, 4, 15, 5, 8, 6, 10, 3)
strdat <- c("Y","I","V","D","Q","C","L","R","U")
dtmdat <- seq(Sys.Date(),Sys.Date()+8,1)
grp <- c(rep("a", 4),rep("b", 5))
subgrp <- c(rep("c",2),rep("d",2),rep("c",2),rep("d",3))

df<-data.frame(grp
           ,subgrp
           ,strdat
           ,numdat
           ,dtmdat
)

df

mtx<-t(t(tapply(as.character(df$dtmdat),paste(df$grp),listagg)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf

df

mtx<-t(t(tapply(as.character(df$dtmdat),paste(df$grp,df$subgrp),listagg)))
dfdf<-data.frame(gsub(" ","-",rownames(mtx)),mtx)
colnames(dfdf)<-c("grp","tgt")
rownames(dfdf)<-1:nrow(dfdf)

dfdf
```

- OUT

```
  grp subgrp strdat numdat     dtmdat
1   a      c      Y     11 2020-03-21
2   a      c      I     12 2020-03-22
3   a      d      V      4 2020-03-23
4   a      d      D     15 2020-03-24
5   b      c      Q      5 2020-03-25
6   b      c      C      8 2020-03-26
7   b      d      L      6 2020-03-27
8   b      d      R     10 2020-03-28
9   b      d      U      3 2020-03-29
  grp                                                    tgt
1   a            2020-03-21,2020-03-22,2020-03-23,2020-03-24
2   b 2020-03-25,2020-03-26,2020-03-27,2020-03-28,2020-03-29
  grp subgrp strdat numdat     dtmdat
1   a      c      Y     11 2020-03-21
2   a      c      I     12 2020-03-22
3   a      d      V      4 2020-03-23
4   a      d      D     15 2020-03-24
5   b      c      Q      5 2020-03-25
6   b      c      C      8 2020-03-26
7   b      d      L      6 2020-03-27
8   b      d      R     10 2020-03-28
9   b      d      U      3 2020-03-29
  grp                              tgt
1 a-c            2020-03-21,2020-03-22
2 a-d            2020-03-23,2020-03-24
3 b-c            2020-03-25,2020-03-26
4 b-d 2020-03-27,2020-03-28,2020-03-29
```
