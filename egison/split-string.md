
https://www.egison.org/libraries/core/collection.html#demo-take

文字列からコレクションに変換

```
$echo {a..e} | xargs -I@ egison -e '(split-string " " "@")'
{"a" "b" "c" "d" "e"}
$echo {a..e} | xargs -I@ egison -e '(split-string "" "@")'
egison: Data.Text.splitOn: empty input

```

コレクションのメソッドで要素数取得
入れ子にできる

```
$echo {a..e} | xargs -I@ egison -e '(length(split-string " " "@"))'
5

```

```
$echo {a..e} | xargs -I@ egison -e '(take 5 (repeat1 {@}))'
{{a b c d e} {a b c d e} {a b c d e} {a b c d e} {a b c d e}}
```

```
$echo {a..e} | xargs -I@ egison -e '(concat {{@} {@}})'
{a b c d e a b c d e}

```
