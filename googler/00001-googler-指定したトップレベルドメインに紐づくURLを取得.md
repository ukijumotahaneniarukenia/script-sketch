- CMD

```
$ seq 10 | awk -v grp=3 '$1==1||$1%grp==0{if(NR>=grp){print ++$1,grp}else{print $1,grp}}'|while read s c;do googler -s$s -n$c --json site:edu | jq '.[]|.url' | nl -w1;done|nl -w1
```

- OUT

```
1	1	"https://www.towson.edu/"
2	2	"https://salve.edu/"
3	3	"https://www.fiu.edu/"
4	1	"https://www.andover.edu/"
5	2	"https://www.tufts.edu/"
6	3	"https://www.montevallo.edu/"
7	1	"https://www.southeast.edu/"
8	2	"https://www.strayer.edu/"
9	3	"https://www.rit.edu/"
10	1	"https://www.nova.edu/"
11	2	"https://www.ucr.edu/"
12	3	"http://www.ufl.edu/"
```

- CMD

```
$ googler -s1 -n12 --json site:edu | jq '.[]|.url' | nl -w1
```

- OUT

```
1	"https://www.towson.edu/"
2	"https://salve.edu/"
3	"https://www.fiu.edu/"
4	"https://www.andover.edu/"
5	"https://www.tufts.edu/"
6	"https://www.montevallo.edu/"
7	"https://www.southeast.edu/"
8	"https://www.strayer.edu/"
9	"https://www.rit.edu/"
10	"https://www.nova.edu/"
11	"https://www.ucr.edu/"
12	"http://www.ufl.edu/"
```
