- IN

```
$echo {a..z} | xargs -n13
a b c d e f g h i j k l m
n o p q r s t u v w x y z
```


- CMD
```
$echo {a..z} | xargs -n13 | ./main
```

- OUT
```
a,n
b,o
c,p
d,q
e,r
f,s
g,t
h,u
i,v
j,w
k,x
l,y
m,z
```
