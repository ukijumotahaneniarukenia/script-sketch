- IN

```
$cat test2.txt
救急車。
ふくへいはじめて。
```

- CMD
```
$cat test2.txt |  Rscript -e 'tgt<-readLines("stdin");df<-data.frame(tgt);clz<-apply(df,1,class);len<-apply(df,1,nchar);data.frame(df,clz,len)'
```

- OUT

```
                 tgt       clz len
1           救急車。 character   4
2 ふくへいはじめて。 character   9
```
