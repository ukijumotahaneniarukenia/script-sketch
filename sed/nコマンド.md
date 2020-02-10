nコマンドは現在のパタンスペースを出力して、次の標準入力行をパターンスペースに取り込み、処理対象行を一つすすめる。
```
[sqlite💜ceacf3fb0808 (火 11月 05 20:35:13) ~/script_scratch/sed]$seq 3 | sed --debug 'n;'
SED PROGRAM:
  n
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: n
1
PATTERN: 2
END-OF-CYCLE:
2
INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: n
3
END-OF-CYCLE:
```

Nコマンドは現在のパターンスペースに次の標準入力行をぱターンスペースに取り込み、処理対象行を一つすすめる
```
[sqlite💜ceacf3fb0808 (火 11月 05 20:38:46) ~/script_scratch/sed]$seq 5 | sed --debug 'N;'
SED PROGRAM:
  N
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: N
PATTERN: 1\n2
END-OF-CYCLE:
1
2
INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: N
PATTERN: 3\n4
END-OF-CYCLE:
3
4
INPUT:   'STDIN' line 5
PATTERN: 5
COMMAND: N
END-OF-CYCLE:
5

```
