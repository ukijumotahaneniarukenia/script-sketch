```
test_01=# select * from generate_series(1,10);
 generate_series 
-----------------
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
(10 rows)

test_01=# select * from generate_series(1,10) as seq(rn);
 rn 
----
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
(10 rows)
```
間隔も指定できる
```
test_01=# select * from generate_series(1,10,1);
 generate_series 
-----------------
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
(10 rows)

test_01=# select * from generate_series(1,10,2);
 generate_series 
-----------------
               1
               3
               5
               7
               9
(5 rows)

test_01=# select * from generate_series(1,10,3);
 generate_series 
-----------------
               1
               4
               7
              10
(4 rows)

test_01=# select * from generate_series(1,10,5);
 generate_series 
-----------------
               1
               6
(2 rows)

```
日付と組み合わせる
```
test_01=# SELECT '2000-01-01'::DATE + GENERATE_SERIES(0, 9);
  ?column?  
------------
 2000-01-01
 2000-01-02
 2000-01-03
 2000-01-04
 2000-01-05
 2000-01-06
 2000-01-07
 2000-01-08
 2000-01-09
 2000-01-10
(10 rows)

test_01=# create table tmp_unko as SELECT '2000-01-01'::DATE + GENERATE_SERIES(0, 9);
SELECT 10
test_01=# select * from tmp_unko;
  ?column?  
------------
 2000-01-01
 2000-01-02
 2000-01-03
 2000-01-04
 2000-01-05
 2000-01-06
 2000-01-07
 2000-01-08
 2000-01-09
 2000-01-10
(10 rows)

test_01=# \d tmp_unko 
             Table "public.tmp_unko"
  Column  | Type | Collation | Nullable | Default 
----------+------+-----------+----------+---------
 ?column? | date |           |          | 


```
別名をしていする
```
test_01=# create table tmp_unko as SELECT '2000-01-01'::DATE + GENERATE_SERIES(0, 9) as dt;
SELECT 10
test_01=# \d tmp_unko;
            Table "public.tmp_unko"
 Column | Type | Collation | Nullable | Default 
--------+------+-----------+----------+---------
 dt     | date |           |          | 


```

セミコロンがないとプロンプトが変わる
```
test_01=# select * from generate_series(1,10)
test_01-# ;
 generate_series 
-----------------
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
(10 rows)


```
日付操作
```
test_01=# select now();
              now              
-------------------------------
 2019-10-05 16:16:28.957747+09
(1 row)

test_01=# select current_timestamp;
      current_timestamp       
------------------------------
 2019-10-05 16:26:59.88948+09
(1 row)

test_01=# select current_timestamp + '1 day';
           ?column?            
-------------------------------
 2019-10-06 16:27:34.036755+09
(1 row)

test_01=# select current_timestamp + '1 week';
           ?column?            
-------------------------------
 2019-10-12 16:27:40.746964+09
(1 row)

test_01=# select current_timestamp + '1 month';
           ?column?            
-------------------------------
 2019-11-05 16:27:55.893873+09
(1 row)

test_01=# select current_timestamp + '1 year';
           ?column?            
-------------------------------
 2020-10-05 16:28:19.250632+09
(1 row)

test_01=# select current_timestamp + '1 second';
           ?column?            
-------------------------------
 2019-10-05 16:28:35.971282+09
(1 row)

test_01=# select current_timestamp + '1 minute';
           ?column?            
-------------------------------
 2019-10-05 16:29:39.987454+09
(1 row)

test_01=# select current_timestamp + '1 hour';
           ?column?            
-------------------------------
 2019-10-05 17:28:54.727427+09
(1 row)

```
