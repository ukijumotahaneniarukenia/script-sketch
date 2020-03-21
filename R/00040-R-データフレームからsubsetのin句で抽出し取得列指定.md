- IN


- CMD

```
#!/usr/bin/env Rscript

library(pipeR)
mtx<-installed.packages()
df<-as.data.frame(mtx)
rownames(df)<-c(1:nrow(df))

df %>>%
  subset(Package %in% df$Package[grep("^p",df$Package)]) %>>%
  subset(TRUE,c("Package", "Version"))
```


- OUT

```
        Package Version
44       pacman   0.5.1
45       pillar   1.4.3
46        pipeR 0.6.1.3
47     pkgbuild   1.0.6
48    pkgconfig   2.0.3
49      pkgload   1.0.2
50        plogr   0.2.0
51       praise   1.0.0
52  prettyunits   1.1.1
53     processx   3.4.2
54           ps   1.3.2
55        purrr   0.3.3
107    parallel   3.6.3
```
