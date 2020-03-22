- IN

```
$cat a
1 10 1 5
1 10 1 3
```


- CMD

```
$cat a | ./c.R
```


```
#!/usr/bin/env Rscript

s<-readLines("stdin");
ss<-strsplit(s," ");

lapply(ss,function(e){
          seq_cmd<-paste0("seq(",paste0(e[1:3],collapse=","),")")
          sample_cmd<-paste0("sample(",seq_cmd,",",e[4],")")
  return(
          eval(parse(text=sample_cmd))
        )
 });
```


- OUT

```
[[1]]
[1]  1  7 10  4  3

[[2]]
[1] 5 1 3

```
