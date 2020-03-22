- CMD

```
$Rscript -e 'eval(parse(text="seq(1,60,1)"))'
```

- OUT

```
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
[26] 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
[51] 51 52 53 54 55 56 57 58 59 60
```


- CMD

```
$echo 1 10 1 5 | Rscript -e 's<-readLines("stdin");ss<-unlist(strsplit(s," "));seq_cmd<-paste0("seq(",paste0(ss[1:3],collapse=","),")");sample_cmd<-paste0("sample(",seq_cmd,",",ss[4],")");eval(parse(text=sample_cmd))'
```

- OUT

```
[1]  2  5  4 10  9
```
