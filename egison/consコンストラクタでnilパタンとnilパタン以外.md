
```
$./a.sh {1..5} | nl
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons _ $x> {x}])
 
     1	{2 3 4 5}
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons $x _ > {x}])
 
     2	1
```
