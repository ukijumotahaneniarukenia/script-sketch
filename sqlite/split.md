
```
sqlite>>>with recursive rec(rn,x) as (select 0,"1 2 3 4 5 6 7 8 9 10" union all select rn+1,x from rec where rn<=9)select * from rec where rn <> 0;
rn          x                   
----------  --------------------
1           1 2 3 4 5 6 7 8 9 10
2           1 2 3 4 5 6 7 8 9 10
3           1 2 3 4 5 6 7 8 9 10
4           1 2 3 4 5 6 7 8 9 10
5           1 2 3 4 5 6 7 8 9 10
6           1 2 3 4 5 6 7 8 9 10
7           1 2 3 4 5 6 7 8 9 10
8           1 2 3 4 5 6 7 8 9 10
9           1 2 3 4 5 6 7 8 9 10
10          1 2 3 4 5 6 7 8 9 10

```
