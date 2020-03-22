- CMD

```
$Rscript -e 'pacman::p_load(dplyr,tidyr);df<-data.frame(installed.packages());rownames(df)<-c(1:nrow(df));df<-df%>%subset(TRUE,c("Package","Suggests"))%>%mutate(Suggests=strsplit(as.character(Suggests),","),Package=as.character(Package))%>%unnest(Suggests);df<-df%>%mutate(Suggests=gsub("^ |\\n","",Suggests,perl=T))%>%mutate(is_na=is.na(Suggests))%>%replace_na(list(Suggests="💩"));df%>%print(n=30)'
```


- OUT

```
# A tibble: 541 x 3
   Package     Suggests          is_na
   <chr>       <chr>             <lgl>
 1 askpass     testthat          FALSE
 2 assertthat  testthat          FALSE
 3 assertthat  covr              FALSE
 4 backports   💩                TRUE 
 5 base64enc   💩                TRUE 
 6 BH          💩                TRUE 
 7 BiocManager BiocStyle         FALSE
 8 BiocManager BiocVersion       FALSE
 9 BiocManager remotes           FALSE
10 BiocManager testthat          FALSE
11 BiocManager withr             FALSE
12 BiocManager curl              FALSE
13 BiocManager knitr             FALSE
14 bit         💩                TRUE 
15 bit64       💩                TRUE 
16 blob        covr              FALSE
17 blob        crayon            FALSE
18 blob        pillar (>= 1.2.1) FALSE
19 blob        testthat          FALSE
20 callr       cliapp            FALSE
21 callr       covr              FALSE
22 callr       crayon            FALSE
23 callr       fansi             FALSE
24 callr       pingr             FALSE
25 callr       ps                FALSE
26 callr       rprojroot         FALSE
27 callr       spelling          FALSE
28 callr       testthat          FALSE
29 callr       tibble            FALSE
30 callr       withr             FALSE
# … with 511 more rows
```
