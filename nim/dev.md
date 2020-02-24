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
