- IN

```
$cat a.tsv
image-id	099d8de544d0
container-name	centos-7-6-18-10-postgres-perl-dbeaver:latest
real	16m22.730s
user	0m0.782s
sys	0m0.666s
```


- CMD

```
$cat a.tsv | ruby -anle 'BEGIN{a=[];};a.push $F;END{b=a.transpose;p b[0].join("\t");p b[1].join("\t")}' | xargs -I@ echo -e @
```


- OUT

```
image-id	container-name	real	user	sys
099d8de544d0	centos-7-6-18-10-postgres-perl-dbeaver:latest	16m22.730s	0m0.782s	0m0.666s
```
