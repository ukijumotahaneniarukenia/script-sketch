```
sqlite>>>select * from json_tree('{"a":[2,3.5,true,false,null,"x"]}');
key         value                              type        atom        id          parent      fullkey     path      
----------  ---------------------------------  ----------  ----------  ----------  ----------  ----------  ----------
NULL        {"a":[2,3.5,true,false,null,"x"]}  object      NULL        0           NULL        $           $         
a           [2,3.5,true,false,null,"x"]        array       NULL        2           0           $.a         $         
0           2                                  integer     2           3           2           $.a[0]      $.a       
1           3.5                                real        3.5         4           2           $.a[1]      $.a       
2           1                                  true        1           5           2           $.a[2]      $.a       
3           0                                  false       0           6           2           $.a[3]      $.a       
4           NULL                               null        NULL        7           2           $.a[4]      $.a       
5           x                                  text        x           8           2           $.a[5]      $.a       
```

```
sqlite>>>select json_group_array(value) from json_tree('{"a":[2,3.5,true,false,null,"x"]}');
json_group_array(value)                                                           
----------------------------------------------------------------------------------
[{"a":[2,3.5,true,false,null,"x"]},[2,3.5,true,false,null,"x"],2,3.5,1,0,null,"x"]
```

```
sqlite>>>select fullkey,json_extract('{"a":[2,3.5,true,false,null,"x"]}',fullkey) from json_tree('{"a":[2,3.5,true,false,null,"x"]}');
fullkey     json_extract('{"a":[2,3.5,true,false,null,"x"]}',fullkey)
----------  ---------------------------------------------------------
$           {"a":[2,3.5,true,false,null,"x"]}                        
$.a         [2,3.5,true,false,null,"x"]                              
$.a[0]      2                                                        
$.a[1]      3.5                                                      
$.a[2]      1                                                        
$.a[3]      0                                                        
$.a[4]      NULL                                                     
$.a[5]      x                                                        

```
