- IN

```
$cat test.tsv
Entrez	symbols
7841	MOGS,CDG2B,CWH41,DER7,GCS1
4248	MGAT3,GNT-III,GNT3
5728	PTEN,BZS,CWS1,DEC,GLM2,MHAM,MMAC11,TEP1
```

- CMD
```
#!/usr/bin/env Rscript

pacman::p_load(dplyr,tidyr)

usage<-function(status){
  file_name<-gsub("--file=","",commandArgs()[4])
  print("Usage:")
  print(paste("$time cat test.tsv |",file_name))
  quit(status=status)
}

args<-commandArgs(trailingOnly=TRUE)[1]

if(!is.na(args)){
  usage(1);
}

input<-read.csv('stdin',header=TRUE,sep='\t')

n<-input %>%
  mutate(symbols=strsplit(as.character(symbols),",")) %>%
  unnest(symbols)

data.frame(n)
```

- OUT

```
   Entrez symbols
1    7841    MOGS
2    7841   CDG2B
3    7841   CWH41
4    7841    DER7
5    7841    GCS1
6    4248   MGAT3
7    4248 GNT-III
8    4248    GNT3
9    5728    PTEN
10   5728     BZS
11   5728    CWS1
12   5728     DEC
13   5728    GLM2
14   5728    MHAM
15   5728  MMAC11
16   5728    TEP1
```
