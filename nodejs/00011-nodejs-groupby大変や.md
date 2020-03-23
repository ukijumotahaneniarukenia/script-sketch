- IN

```
$cat test.csv | sed -n '2,$p'
1,a,c,Y,11,2020-03-21
2,a,c,I,12,2020-03-22
3,a,d,V,4,2020-03-23
4,a,d,D,15,2020-03-24
5,b,c,Q,5,2020-03-25
6,b,c,C,8,2020-03-26
7,b,d,L,6,2020-03-27
8,b,d,R,10,2020-03-28
9,b,d,U,3,2020-03-29
```

- CMD

```
$cat test.csv | sed -n '2,$p'| node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");a=s.replace(/\n$/,"").split("\n");b=a.map(e=>e.split(","));let c={};b.map(function(x){c[x[1]]+=","+x[3];});Object.keys(c).map(k=>console.log(k,c[k].replace(/undefined/,"")))'
```

- OUT

```
a ,Y,I,V,D
b ,Q,C,L,R,U
```

- CMD

  - 短くしたい

```
$paste -d, <(printf "%s\n" a{,,,} b{,,,,}) <(printf "%s\n" {Y,I,V,D,Q,C,L,R,U})| node -e 'let s=require("fs").readFileSync("/dev/stdin","utf8");a=s.replace(/\n$/,"").split("\n");b=a.map(e=>e.split(","));let c={};b.map(function(x){c[x[0]]+=","+x[1];});Object.keys(c).map(k=>console.log(k,c[k].replace(/undefined/,"")))'
a ,Y,I,V,D
b ,Q,C,L,R,U
```


  - 全部繋いでちょっとだけみじかくした

```
$paste -d, <(printf "%s\n" a{,,,} b{,,,,}) <(printf "%s\n" {Y,I,V,D,Q,C,L,R,U})| node -e 'let c={};require("fs").readFileSync("/dev/stdin","utf8").replace(/\n$/,"").split("\n").map(e=>e.split(",")).map(function(x){c[x[0]]+=","+x[1];});Object.keys(c).map(k=>console.log(k,c[k].replace(/undefined/,"")))'
a ,Y,I,V,D
b ,Q,C,L,R,U
```


  - アローにして短くした。セミコロンはなくなることに注意。なくさないとエラー。

```
$paste -d, <(printf "%s\n" a{,} b{,,}) <(printf "%s\n" {Y,I,L,R,U})| node -e 'let c={};require("fs").readFileSync("/dev/stdin","utf8").replace(/\n$/,"").split("\n").map(e=>e.split(",")).map(x=>c[x[0]]+=","+x[1]);Object.keys(c).map(k=>console.log(k,c[k].replace(/undefined/,"")))'
a ,Y,I
b ,L,R,U
```
