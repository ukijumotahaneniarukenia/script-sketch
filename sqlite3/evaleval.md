```
$curl -LO https://www.sqlite.org/src/raw/ext/misc/eval.c?name=4b4757592d00fd32e44c7a067e6a0e4839c81a4d57abc4131ee7806d1be3104e
$mv eval.c?name=4b4757592d00fd32e44c7a067e6a0e4839c81a4d57abc4131ee7806d1be3104e eval.c
$sudo gcc -fPIC -shared -I /usr/local/src/sqlite-autoconf-3300000/ -o eval.so eval.c

sqlite>>>.read init.sql
sqlite>>>select * from test_tbl limit 5;
col1        col2        col3      
----------  ----------  ----------
aa          ab          ac        
ba          bb          bc        
ca          cb          cc        
ab          ac          ba        
bb          bc          ca        
sqlite>>>select eval('select 1;') as rez;
rez       
----------
1         
sqlite>>>select eval('select col1 from test_tbl limit 5;') as rez;
rez           
--------------
aa ba ca ab bb

sqlite>>>select eval('select col1,min(col1) from test_tbl limit 5;') as rez;
rez       
----------
aa aa     
sqlite>>>select eval('select col1,min(col1)over() from test_tbl limit 5;') as rez;
rez                          
-----------------------------
aa aa ba aa ca aa ab aa bb aa
sqlite>>>select eval('select value from generate_series(1,10);') as rez;
rez                 
--------------------
1 2 3 4 5 6 7 8 9 10
sqlite>>>select eval('select value,1+value from generate_series(1,10);') as rez;
rez                                       
------------------------------------------
1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11


sqlite>>>with sub as(select value as n from generate_series(1,10)),build_sql as(select 'select value,1+value from generate_series('||n||','||(n+1)||');' as rez from sub)select * from build_sql;
rez                                            
-----------------------------------------------
select value,1+value from generate_series(1,2);
select value,1+value from generate_series(2,3);
select value,1+value from generate_series(3,4);
select value,1+value from generate_series(4,5);
select value,1+value from generate_series(5,6);
select value,1+value from generate_series(6,7);
select value,1+value from generate_series(7,8);
select value,1+value from generate_series(8,9);
select value,1+value from generate_series(9,10)
select value,1+value from generate_series(10,11

sqlite>>>with sub as(select value as n from generate_series(1,10)),build_sql as(select 'select value,1+value from generate_series('||n||','||(n+1)||');' as rez from sub)select eval(rez) from build_sql;
eval(rez) 
----------
1 2 2 3   
2 3 3 4   
3 4 4 5   
4 5 5 6   
5 6 6 7   
6 7 7 8   
7 8 8 9   
8 9 9 10  
9 10 10 11
10 11 11 1


sqlite>>>with sub as(select value as n from generate_series(1,10)),build_sql as(select 'select value,1+value from generate_series('||n||','||n||');' as rez from sub)select rez from build_sql;
rez                                            
-----------------------------------------------
select value,1+value from generate_series(1,1);
select value,1+value from generate_series(2,2);
select value,1+value from generate_series(3,3);
select value,1+value from generate_series(4,4);
select value,1+value from generate_series(5,5);
select value,1+value from generate_series(6,6);
select value,1+value from generate_series(7,7);
select value,1+value from generate_series(8,8);
select value,1+value from generate_series(9,9);
select value,1+value from generate_series(10,10

sqlite>>>with sub as(select value as n from generate_series(1,10)),build_sql as(select 'select value,1+value from generate_series('||n||','||n+n||');' as rez from sub)select rez from build_sql;
rez       
----------
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

sqlite>>>with sub as(select value as n from generate_series(-10,0)),build_sql as(select 'select value,1+value from generate_series('||n||','||n+n+n||');' as rez from sub)select rez from build_sql;
rez       
----------
-20       
-18       
-16       
-14       
-12       
-10       
-8        
-6        
-4        
-2        
0         
sqlite>>>with sub as(select value as n from generate_series(0,10)),build_sql as(select 'select value,1+value from generate_series('||n||','||n+n+n||');' as rez from sub)select rez from build_sql;
rez       
----------
0         
2         
4         
6         
8         
10        
12        
14        
16        
18        
20        
sqlite>>>with sub as(select value as n from generate_series(0,10)),build_sql as(select 'select value,1+value from generate_series('||n||','||n+n+n+n||');' as rez from sub)select rez from build_sql;
rez       
----------
0         
3         
6         
9         
12        
15        
18        
21        
24        
27        
30        

```
