- 事始め
```
$mkdir -p 00001-nim-ハローワールド
$cd 00001-nim-ハローワールド
$echo '/main' | xargs -n1 >.gitignore
$touch main.nim
$nim c main.nim
$./main
ハローワールド
```

```
$cd 00004-nim-標準入力

$./main $(echo {a..f} | xargs -n2)
1@["a", "b", "c", "d", "e", "f"]

$./main $(echo {a..f} | xargs -n1)
1@["a", "b", "c", "d", "e", "f"]

$echo {a..f} | xargs -n1 | ./main
1@["a"]
2@["b"]
3@["c"]
4@["d"]
5@["e"]
6@["f"]

$echo {a..f} | xargs -n2 | ./main
1@["a", "b"]
2@["c", "d"]
3@["e", "f"]

$echo {a..f} | xargs -n3 | ./main
1@["a", "b", "c"]
2@["d", "e", "f"]


$echo {a..f} | xargs -n4 | ./main
1@["a", "b", "c", "d"]
2@["e", "f"]

$echo {a..f} | xargs -n6 | ./main
1@["a", "b", "c", "d", "e", "f"]
```
