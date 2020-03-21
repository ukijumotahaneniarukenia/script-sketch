

- CMD
```
#!/usr/bin/env Rscript

library(glue)

args_ctg<-c("food", "drink")
args_dtm<-c(201701, 201702)

inclause<-function(x){
  paste0("'", paste0(x, collapse = "','"), "'")
}

glue("select * from log_data where category in ({inclause(ctg)}) and yyyymm = '{dtm}'"
     ,ctg=args_ctg
     ,dtm=args_dtm
    )
```

- OUT

```
select * from log_data where category in ('food','drink') and yyyymm = '201701'
select * from log_data where category in ('food','drink') and yyyymm = '201702'
```
