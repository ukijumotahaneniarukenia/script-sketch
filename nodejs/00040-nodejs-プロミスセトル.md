CMD

```
$ node -e 'Promise.allSettled([Promise.reject(0),Promise.reject(9)]).then(list=>{while(list[1].reason>=list[0].reason++){console.log(list[0].reason-1,list[1].reason-(list[0].reason-1))}})'
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
