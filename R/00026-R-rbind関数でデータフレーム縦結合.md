- IN

```
$./00026-R-rbind関数でデータフレーム縦結合.md 1000
```

- CMD

```
#!/usr/bin/env Rscript

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

tate<-function(tgt,cnt){
  rt<-NULL
  for(i in 1:cnt){
    rt<-rbind(rt,tgt)
  }
  return(rt)
}

M1<-data.frame(matrix(1, nrow=10, ncol=10))
system.time(tate(M1,nnn))
```

- OUT

```
   ユーザ   システム       経過
     0.363      0.013      0.375
```
