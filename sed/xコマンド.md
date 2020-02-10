
前回のホールドスペースの値を今回のパタンスペースにコピーしてくれてる。

前回のパターンスペースを保持してくれているから。G,Hコマンドと相性よさげ。

```
[sqlite💜ceacf3fb0808 (火 11月 05 19:58:24) ~/script_scratch/sed]$seq 3 | sed --debug 'x;'
SED PROGRAM:
  x
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: x
PATTERN: 
HOLD:    1
END-OF-CYCLE:

INPUT:   'STDIN' line 2
PATTERN: 2
COMMAND: x
PATTERN: 1
HOLD:    2
END-OF-CYCLE:
1
INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: x
PATTERN: 2
HOLD:    3
END-OF-CYCLE:
2


```

```
[sqlite💜ceacf3fb0808 (火 11月 05 20:00:04) ~/script_scratch/sed]$seq 3 | sed --debug '=;x;'
SED PROGRAM:
  =
  x
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: =
1
COMMAND: x
PATTERN: 
HOLD:    1
END-OF-CYCLE:

INPUT:   'STDIN' line 2
PATTERN: 2
COMMAND: =
2
COMMAND: x
PATTERN: 1
HOLD:    2
END-OF-CYCLE:
1
INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: =
3
COMMAND: x
PATTERN: 2
HOLD:    3
END-OF-CYCLE:
2

```

現在のパターンスペースの値をホルドスペースに追加。
今回のの処理対象行の値がホールドスペースに保持されてその後ろに追加されている。
```
[sqlite💜ceacf3fb0808 (火 11月 05 20:04:49) ~/script_scratch/sed]$seq 3 | sed --debug 'x;H;'
SED PROGRAM:
  x
  H
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: x
PATTERN: 
HOLD:    1
COMMAND: H
HOLD:    1\n
END-OF-CYCLE:

INPUT:   'STDIN' line 2
PATTERN: 2
COMMAND: x
PATTERN: 1\n
HOLD:    2
COMMAND: H
HOLD:    2\n1\n
END-OF-CYCLE:
1

INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: x
PATTERN: 2\n1\n
HOLD:    3
COMMAND: H
HOLD:    3\n2\n1\n
END-OF-CYCLE:
2
1
```

現在のホールドスペースの値をパターンスペースに追加。
前回の処理対象行の値がパターンスペースに保持してその後ろに追加されている。
```
[sqlite💜ceacf3fb0808 (火 11月 05 20:05:12) ~/script_scratch/sed]$seq 3 | sed --debug 'x;G;'
SED PROGRAM:
  x
  G
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: x
PATTERN: 
HOLD:    1
COMMAND: G
PATTERN: \n1
END-OF-CYCLE:

1
INPUT:   'STDIN' line 2
PATTERN: 2
COMMAND: x
PATTERN: 1
HOLD:    2
COMMAND: G
PATTERN: 1\n2
END-OF-CYCLE:
1
2
INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: x
PATTERN: 2
HOLD:    3
COMMAND: G
PATTERN: 2\n3
END-OF-CYCLE:
2
3
```
