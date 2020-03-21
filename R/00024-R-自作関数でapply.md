- IN

```
$cat test2.txt
救急車。
ふくへいはじめて。
```

- CMD

```
$cat test2.txt | ./a.R
```

```
#!/usr/bin/env Rscript

listagg<-function(tgt){
  return (paste(unique(tgt),collapse=","))
}

s<-readLines('stdin')

df<-data.frame(s)

liz<-apply(df,2,listagg)

dfdf<-merge(df,liz)

colnames(dfdf)<-c("gram","liz")

print(dfdf)
```

- OUT

```
                gram                         liz
1           救急車。 救急車。,ふくへいはじめて。
2 ふくへいはじめて。 救急車。,ふくへいはじめて。
```
