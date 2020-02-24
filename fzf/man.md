- 単一ないし、複数オブジェクトをパイプで流してオブジェクトを矢印で選択し、プロンプトに検索単語を入力し、Enterすると標準出力に出力される
  - json以外もいけるぽい。たのしそう。

  - https://github.com/junegunn/fzf

  - https://qiita.com/arc279/items/e328e97032c962a6947e

```
cat l.json | jq --stream -c 'select(length==2)|{key:.[0]|join("."),value:.[1]}' | fzf
```
