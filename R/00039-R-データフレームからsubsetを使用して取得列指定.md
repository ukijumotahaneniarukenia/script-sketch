- IN

```
```


- CMD

```
#!/usr/bin/env Rscript

library(pipeR)
mtx<-installed.packages()
df<-as.data.frame(mtx)
rownames(df)<-c(1:nrow(df))
subset(df,TRUE,c("Package","Version")) %>>% tail(10)
```

- OUT

```
     Package Version
107 parallel   3.6.3
108    rpart  4.1-15
109  spatial  7.3-11
110  splines   3.6.3
111    stats   3.6.3
112   stats4   3.6.3
113 survival  3.1-11
114    tcltk   3.6.3
115    tools   3.6.3
116    utils   3.6.3
```
