スクリプト
```
sqlite>>>select * from json_tree('["a", {"b": [1, 2]}, [3, 4,null,true,false],[{"c": [11, 12]},"eee",{"d": [111, 112]}],{"f":true}]');
```

取得結果
```
key         value                                                                                     type        atom        id          parent      fullkey     path      
----------  ----------------------------------------------------------------------------------------  ----------  ----------  ----------  ----------  ----------  ----------
NULL        ["a",{"b":[1,2]},[3,4,null,true,false],[{"c":[11,12]},"eee",{"d":[111,112]}],{"f":true}]  array       NULL        0           NULL        $           $         
0           a                                                                                         text        a           1           0           $[0]        $         
1           {"b":[1,2]}                                                                               object      NULL        2           0           $[1]        $         
b           [1,2]                                                                                     array       NULL        4           2           $[1].b      $[1]      
0           1                                                                                         integer     1           5           4           $[1].b[0]   $[1].b    
1           2                                                                                         integer     2           6           4           $[1].b[1]   $[1].b    
2           [3,4,null,true,false]                                                                     array       NULL        7           0           $[2]        $         
0           3                                                                                         integer     3           8           7           $[2][0]     $[2]      
1           4                                                                                         integer     4           9           7           $[2][1]     $[2]      
2           NULL                                                                                      null        NULL        10          7           $[2][2]     $[2]      
3           1                                                                                         true        1           11          7           $[2][3]     $[2]      
4           0                                                                                         false       0           12          7           $[2][4]     $[2]      
3           [{"c":[11,12]},"eee",{"d":[111,112]}]                                                     array       NULL        13          0           $[3]        $         
0           {"c":[11,12]}                                                                             object      NULL        14          13          $[3][0]     $[3]      
c           [11,12]                                                                                   array       NULL        16          14          $[3][0].c   $[3][0]   
0           11                                                                                        integer     11          17          16          $[3][0].c[  $[3][0].c 
1           12                                                                                        integer     12          18          16          $[3][0].c[  $[3][0].c 
1           eee                                                                                       text        eee         19          13          $[3][1]     $[3]      
2           {"d":[111,112]}                                                                           object      NULL        20          13          $[3][2]     $[3]      
d           [111,112]                                                                                 array       NULL        22          20          $[3][2].d   $[3][2]   
0           111                                                                                       integer     111         23          22          $[3][2].d[  $[3][2].d 
1           112                                                                                       integer     112         24          22          $[3][2].d[  $[3][2].d 
4           {"f":true}                                                                                object      NULL        25          0           $[4]        $         
f           1                                                                                         true        1           27          25          $[4].f      $[4]      
```
