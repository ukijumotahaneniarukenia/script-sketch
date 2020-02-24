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

```
apache@5953b2510380 ~/script-sketch/nim$stdin_via_pipe  a b c
a
b
c
apache@5953b2510380 ~/script-sketch/nim$seq 10 | xargs -n3 | stdin_via_pipe 
1 2 3
4 5 6
7 8 9
10
apache@5953b2510380 ~/script-sketch/nim$stdin_via_pipe  {a..d}
a
b
c
apache@5953b2510380 ~/script-sketch/nim$stdin_via_pipe  a b c
a
b
c
```
