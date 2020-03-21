- IN

```
```

- CMD

```
#!/usr/bin/env Rscript

tgt <- c("うんこ" , "UNKO" , "💩","ウンコ","ｳﾝｺ","ＵＮＫＯ","雲鼓","ぽぽぽぽ")
for(vec_idx in 1:length(tgt)){
  gram<-strsplit(tgt[vec_idx],"")
  for(gram_idx in 1:length(gram[[1]])){
    #print(c(tgt[vec_idx],substr(tgt[vec_idx],gram_idx,gram_idx),vec_idx,gram_idx))
    #print(c(tgt[vec_idx],substr(tgt[vec_idx],gram_idx,gram_idx+1),vec_idx,gram_idx))
    #print(c(tgt[vec_idx],substr(tgt[vec_idx],gram_idx,gram_idx+2),vec_idx,gram_idx))
    #print(c(tgt[vec_idx],substr(tgt[vec_idx],gram_idx,gram_idx+3),vec_idx,gram_idx))
    print(c(tgt[vec_idx],substr(tgt[vec_idx],gram_idx,gram_idx+4),vec_idx,gram_idx))
  }
}
```

- OUT

```
```
