# 参考文献

- https://qiita.com/advent-calendar/2019/trdsql



```
kuraine@71ecc4cebf8f ~/script-sketch/trdsql$trdsql -ih "select 'grp',group_concat(key) from test.csv where grp=0 group by grp union all select grp,group_concat(value) from test.csv group by grp" | perl -pe 's;(?<=,)"|"$;;g' | csv2json
[
{"grp":"0","id":"2tM1DedEr6eqgdqJ8X4sP+CS3BVG/bkK4hS45ZnKnRQ=_170496cd57a:c60cb39:31d4c877","title":"A Canadian Energy Company Bought an Oregon Sheriff’s Unit"},
{"grp":"1","id":"kbcnL5XqWJi/iYn/BuKqrf/JSzXEf2szaOaXmzc6oZ4=_170496c85db:c60c640:31d4c877","title":"経験者がいない状態で、戦略的DDDを現場でやってみた話/ OOC2020"}
]
```


```
trdsql -driver postgres -dsn "postgres://postgres:postgres_pwd@localhost:5432/testdb?sslmode=disable" -ih "select * from a.out"

```
