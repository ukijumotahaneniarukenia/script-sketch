Gコマンドは前回のホールスペースの内容を今回のパタンスペース後ろにに追加してくれる

ホールドスペースは各行間の処理で蓄積結果を持ち回ることができる。
```
$seq 3 | sed --debug 'G;h;'
SED PROGRAM:
  G
  h
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: G
PATTERN: 1\n
COMMAND: h
HOLD:    1\n
END-OF-CYCLE:
1

INPUT:   'STDIN' line 2
PATTERN: 2
COMMAND: G
PATTERN: 2\n1\n
COMMAND: h
HOLD:    2\n1\n
END-OF-CYCLE:
2
1

INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: G
PATTERN: 3\n2\n1\n
COMMAND: h
HOLD:    3\n2\n1\n
END-OF-CYCLE:
3
2
1
```

デフォルトは改行区切りで蓄積しているので、パターンスペースの出力結果は以下になる
```
$seq 3 | sed 'G;h;'
1

2
1

3
2
1

````
