- IN

```
$echo 'a,b,,c' 'aaa,nnnn'
a,b,,c aaa,nnnn
```


- CMD

```
$gawk -f ./patsplit.awk 'a,b,,c' 'aaa,nnnn'
```

- OUT
```
n = 4
cols[1] = <a>
cols[2] = <b>
cols[3] = <>
cols[4] = <c>
n = 2
cols[1] = <aaa>
cols[2] = <nnnn>
```
