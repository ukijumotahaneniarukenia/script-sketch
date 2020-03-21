- IN

```
$./00029-R-bind_cols関数でデータフレーム横結合.md 1000 2>/dev/null
```

- CMD

```
#!/usr/bin/env Rscript

library(dplyr)

usage<-function(status){
  file_name<-gsub("--file=","",commandArgs()[4])
  print("Usage:")
  print(paste(file_name," 1000"))
  quit(status=status)
}

args<-commandArgs(trailingOnly=TRUE)[1]
nnn<-as.integer(args)
if(is.na(nnn)){
  usage(1);
}
if(0 > nnn){
  usage(1);
}

yoko<-function(tgt,cnt){
  rt<-NULL
  for(i in 1:cnt){
    if (i == 1) {
      rt<-tgt
    }else{
      rt<-bind_cols(rt,tgt)
    }
  }
  return(rt)
}

M1<-data.frame(matrix(1, nrow=10, ncol=10))
system.time(yoko(M1,nnn))
```

- OUT

```
   ユーザ   システム       経過
     2.826      0.010      2.837
```
