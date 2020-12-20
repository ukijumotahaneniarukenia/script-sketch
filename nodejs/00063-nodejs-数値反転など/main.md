CMD

```
$ node -e 'let n=15,m=1,g=Math.floor(n/2);Array(n).fill(1).reduce((a,e,i)=>{m+=2;j=n-m<0?n-i:a+e-1;console.log(j<g?j:g--);return a+e;},0);'
```


OUT

```
0
1
2
3
4
5
6
7
6
5
4
3
2
1
0
```


CMD

```
$ node -e 'let n=21,m=1,g=Math.floor(n/2);Array(n).fill(1).reduce((a,e,i)=>{m+=2;j=n-m<0?n-i:a+e-1;console.log(j<g?j:g--);return a+e;},0);'
```


OUT

```
0
1
2
3
4
5
6
7
8
9
10
9
8
7
6
5
4
3
2
1
0
```
