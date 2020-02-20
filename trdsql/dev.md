# awkによるグループわけ

```
$cat a.out
com.github.javafaker
javafaker
1.0.2
org.json
json
20190722
$cat a.out | nl | awk -v OFS=',' 'function ceil(n,d){return (n/d==int(n/d))?n/d:int(n/d)+1} {print $1,ceil($1,3),$2}' | sed '1iseq,grp,val'
seq,grp,val
1,1,com.github.javafaker
2,1,javafaker
3,1,1.0.2
4,2,org.json
5,2,json
6,2,20190722
$cat a.out | nl | awk -v OFS=',' 'function ceil(n,d){return (n/d==int(n/d))?n/d:int(n/d)+1} {print $1,ceil($1,3),$2}' | sed '1iseq,grp,val'>a.out.done
```


```
$trdsql -ih "select grp,group_concat(val,',')over(partition by grp) from a.out.done" | uniq
1,"com.github.javafaker,javafaker,1.0.2"
2,"org.json,json,20190722"
```
