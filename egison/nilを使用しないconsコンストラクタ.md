

consコンストラクタは未指定、ないしは単一の場合はエラー。
それ以外はパターンマッチしたターゲットを出力する。
取得列に

```
./a.sh {1..5} | nl
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons $x $xx> {x xx}])
 
     1	1	{2 3 4 5}
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons $x $xx > {xx}])
 
     2	{2 3 4 5}
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons $x $xx > {x}])
 
     3	1
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons $x $xx > {}])
 
       
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons $xx $x> {x xx}])
 
     4	{2 3 4 5}	1
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons $xx $x > {xx}])
 
     5	1
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons $xx $x > {x}])
 
     6	{2 3 4 5}
egison -T -e 
(match-all {1 2 3 4 5} (list string)[<cons $xx $x > {}])
 

```
