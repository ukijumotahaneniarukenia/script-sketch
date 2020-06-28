- CMD
```
$printf "%s\t%s\t%s\t%s\t%s\n" XXX tuple set dict list | tee >(echo tuple set dict list | xargs -n1 | xargs -I@ printf "%s\t%s\t%s\t%s\t%s\n" @ YYY{,,,}) | cat -
```


- OUT
```
XXX	tuple	set	dict	list
tuple	YYY	YYY	YYY	YYY
set	YYY	YYY	YYY	YYY
dict	YYY	YYY	YYY	YYY
list	YYY	YYY	YYY	YYY
```

- CMD

```
Rscript -e 'mtx<-matrix(t(c(rep("YYY",4))), nrow=4, ncol=4);df<-data.frame(mtx);col<-c("tuple","set","dict","list");rownames(df)<-col;colnames(df)<-col;write.csv(df,row.names = TRUE,quote = FALSE,stdout())' | sed 's/,/\t/g'
```


- OUT

```
	tuple	set	dict	list
tuple	YYY	YYY	YYY	YYY
set	YYY	YYY	YYY	YYY
dict	YYY	YYY	YYY	YYY
list	YYY	YYY	YYY	YYY
```
