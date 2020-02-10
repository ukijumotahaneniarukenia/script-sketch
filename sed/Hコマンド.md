
Hコマンドは前回のホールドスペースに今回のパタンスペースを改行区切りで連結する。

```
[sqlite💜ceacf3fb0808 (火 11月 05 20:40:53) ~/script_scratch/sed]$seq 5 | sed --debug 'H;'
SED PROGRAM:
  H
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: H
HOLD:    \n1
END-OF-CYCLE:
1
INPUT:   'STDIN' line 2
PATTERN: 2
COMMAND: H
HOLD:    \n1\n2
END-OF-CYCLE:
2
INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: H
HOLD:    \n1\n2\n3
END-OF-CYCLE:
3
INPUT:   'STDIN' line 4
PATTERN: 4
COMMAND: H
HOLD:    \n1\n2\n3\n4
END-OF-CYCLE:
4
INPUT:   'STDIN' line 5
PATTERN: 5
COMMAND: H
HOLD:    \n1\n2\n3\n4\n5
END-OF-CYCLE:
5

```
