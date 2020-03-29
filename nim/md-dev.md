# コマンドライン引数経由の標準入力

```
$cat stdin.nim
import os

when isMainModule:
  let args = commandLineParams()
  stdout.write(args)
```

改行されないのがポイント

```
$stdin unko
unko
$stdin unko{1..3}
unko1unko2unko3
```

split系を取り入れたい
  - https://nim-by-example.github.io/


```
$stdin_via_pipe  a b c
a
b
c
$seq 10 | xargs -n3 | stdin_via_pipe
1 2 3
4 5 6
7 8 9
10
$stdin_via_pipe  {a..d}
a
b
c
$stdin_via_pipe  a b c
a
b
c
```



```
$mkdir -p 00001-nim-ハローワールド
$cd 00001-nim-ハローワールド
$echo '/main' | xargs -n1 >.gitignore
$nim c main.nim
$./main
ハローワールド
```
