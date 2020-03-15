- IN
```
$echo -en '\U1F363'
🍣
```

- CMD
  - Unicodeからutf8へ変換
  - 1バイト単位に出力
```
$echo -en '\U1F363' | xxd -ps -c1
```

- OUT

```
f0
9f
8d
a3
```

- CMD
  - 任意の文字列をutf8に変換

```
echo -ne 𠮷野家うんこUNKO®ウンコunko産んこＵｎｋｏｳﾝｺ | perl -C -pe 's/(\p{All})/\1\n/g;'|xxd -c1 -ps|awk 'BEGIN{sm=0;}{if($1=="0a"){print 1,$1}else{print 0,$1}}'|tac|awk 'BEGIN{sm=0;}{sm+=$1;print sm,$1,$2}'|tac|awk '{a[$1]=a[$1]","$3}END{for(e in a){print e,a[e]}}'|sort -nk1 | sed 's/,0a//'
```

- OUT

```
1 ,ef,bd,ba
2 ,ef,be,9d
3 ,ef,bd,b3
4 ,ef,bd,8f
5 ,ef,bd,8b
6 ,ef,bd,8e
7 ,ef,bc,b5
8 ,e3,81,93
9 ,e3,82,93
10 ,e7,94,a3
11 ,6f
12 ,6b
13 ,6e
14 ,75
15 ,e3,82,b3
16 ,e3,83,b3
17 ,e3,82,a6
18 ,c2,ae
19 ,4f
20 ,4b
21 ,4e
22 ,55
23 ,e3,81,93
24 ,e3,82,93
25 ,e3,81,86
26 ,e5,ae,b6
27 ,e9,87,8e
28 ,f0,a0,ae,b7
```
