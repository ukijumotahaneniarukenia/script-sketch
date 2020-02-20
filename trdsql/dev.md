# awkによるグループわけ

```
$ cat a.out
com.github.javafaker
javafaker
1.0.2
org.json
json
20190722
$ cat a.out | nl | awk -v OFS='\t' 'function ceil(n,d){return (n/d==int(n/d))?n/d:int(n/d)+1} {print $1,ceil($1,3),$2}' | sed '1iseq\tgrp\tval'
seq	grp	val
1	1	com.github.javafaker
2	1	javafaker
3	1	1.0.2
4	2	org.json
5	2	json
6	2	20190722
```
