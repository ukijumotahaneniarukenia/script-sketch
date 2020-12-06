IN
```
$ echo '{"a":[{"b":"y","c":[{"d":[2,3]}],"e":{"g":"z"}}],"f":["x"]}' | jq 'to_entries'
[
  {
    "key": "a",
    "value": [
      {
        "b": "y",
        "c": [
          {
            "d": [
              2,
              3
            ]
          }
        ],
        "e": {
          "g": "z"
        }
      }
    ]
  },
  {
    "key": "f",
    "value": [
      "x"
    ]
  }
]
```

CMD
```
$ sqlite3 
-- Loading resources from /home/aine/.sqliterc
SQLite version 3.31.1 2020-01-27 19:55:54
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite>>>select * from json_tree('{"a":[{"b":"y","c":[{"d":[2,3]}],"e":{"g":"z"}}],"f":["x"]}');
key         value                                                        type        atom        id          parent      fullkey     path      
----------  -----------------------------------------------------------  ----------  ----------  ----------  ----------  ----------  ----------
NULL        {"a":[{"b":"y","c":[{"d":[2,3]}],"e":{"g":"z"}}],"f":["x"]}  object      NULL        0           NULL        $           $         
a           [{"b":"y","c":[{"d":[2,3]}],"e":{"g":"z"}}]                  array       NULL        2           0           $.a         $         
0           {"b":"y","c":[{"d":[2,3]}],"e":{"g":"z"}}                    object      NULL        3           2           $.a[0]      $.a       
b           y                                                            text        y           5           3           $.a[0].b    $.a[0]    
c           [{"d":[2,3]}]                                                array       NULL        7           3           $.a[0].c    $.a[0]    
0           {"d":[2,3]}                                                  object      NULL        8           7           $.a[0].c[0  $.a[0].c  
d           [2,3]                                                        array       NULL        10          8           $.a[0].c[0  $.a[0].c[0
0           2                                                            integer     2           11          10          $.a[0].c[0  $.a[0].c[0
1           3                                                            integer     3           12          10          $.a[0].c[0  $.a[0].c[0
e           {"g":"z"}                                                    object      NULL        14          3           $.a[0].e    $.a[0]    
g           z                                                            text        z           16          14          $.a[0].e.g  $.a[0].e  
f           ["x"]                                                        array       NULL        18          0           $.f         $         
0           x                                                            text        x           19          18          $.f[0]      $.f       
Run Time: real 0.001 user 0.000000 sys 0.001008
```
