CMD

```
$ node -e 'Promise.all([Promise.resolve(0),Promise.resolve(9)]).then(list=>{while(list[1]>=list[0]++){console.log(list[0]-1,list[1]-(list[0]-1))}})'
```

OUT

```
0 9
1 8
2 7
3 6
4 5
5 4
6 3
7 2
8 1
9 0
```
