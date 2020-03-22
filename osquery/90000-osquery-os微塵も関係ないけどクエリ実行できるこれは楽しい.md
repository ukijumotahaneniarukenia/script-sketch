- IN

```

```

- CMD
  - mysqlっぽい
```
$osqueryi 'with rec(rn,str)as(select 1,"a" union all select s1.rn+1,s1.str||"a" from rec s1 where s1.rn+1<=5)select * from rec;'
```

- OUT

```
+----+-------+
| rn | str   |
+----+-------+
| 1  | a     |
| 2  | aa    |
| 3  | aaa   |
| 4  | aaaa  |
| 5  | aaaaa |
+----+-------+
```


- IN
```
$cat 90000-osquery-os微塵も関係ないけどクエリ実行できるこれは楽しい.sql
with rec(rn,str)as(select 1,"a" union all select s1.rn+1,s1.str||"a" from rec s1 where s1.rn+1<=5)select * from rec;
```

- CMD


  - 外部ファイル化して実行できる

```
$cat 90000-osquery-os微塵も関係ないけどクエリ実行できるこれは楽しい.sql | osqueryi --json
```

- OUT

```
[
  {"rn":"1","str":"a"},
  {"rn":"2","str":"aa"},
  {"rn":"3","str":"aaa"},
  {"rn":"4","str":"aaaa"},
  {"rn":"5","str":"aaaaa"}
]
```

- CMD

```
$cat 90000-osquery-os微塵も関係ないけどクエリ実行できるこれは楽しい.sql | osqueryi
```

-  OUT

```
+----+-------+
| rn | str   |
+----+-------+
| 1  | a     |
| 2  | aa    |
| 3  | aaa   |
| 4  | aaaa  |
| 5  | aaaaa |
+----+-------+
```
