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
