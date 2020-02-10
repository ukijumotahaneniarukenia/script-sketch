```
seq 3 | xargs -I@ bash -c 'sed -n "eecho @"<<<""'

```

```
$seq 3 | xargs -I@ bash -c 'sed -n "eecho @"<<<""'
1
2
3
$seq 3 | xargs -I@ -t bash -c 'sed -n "eecho @"<<<""'
bash -c sed -n "eecho 1"<<<"" 
1
bash -c sed -n "eecho 2"<<<"" 
2
bash -c sed -n "eecho 3"<<<"" 
3
```

```
[sqlite💞ceacf3fb0808 (水 11月 06 20:33:19) ~/script_scratch/sed]$seq 3 | xargs -I@ -t bash -c 'sed -n "eecho @;seq @|xargs"<<<""'
bash -c sed -n "eecho 1;seq 1|xargs"<<<"" 
1
1
bash -c sed -n "eecho 2;seq 2|xargs"<<<"" 
2
1 2
bash -c sed -n "eecho 3;seq 3|xargs"<<<"" 
3
1 2 3
```

```
[sqlite💞ceacf3fb0808 (水 11月 06 20:38:45) ~/script_scratch/sed]$seq 5 | xargs -I@ bash -c 'sed -n "eseq @|xargs;"<<<""'
1
1 2
1 2 3
1 2 3 4
1 2 3 4 5

```

```

[sqlite💞ceacf3fb0808 (水 11月 06 20:50:44) ~/script_scratch/sed]$seq 3
1
2
3
[sqlite💞ceacf3fb0808 (水 11月 06 20:50:52) ~/script_scratch/sed]$seq 3 | tee
1
2
3
[sqlite💞ceacf3fb0808 (水 11月 06 20:50:58) ~/script_scratch/sed]$seq 3 | tee -
1
2
3
1
2
3
[sqlite💞ceacf3fb0808 (水 11月 06 20:51:01) ~/script_scratch/sed]$seq 3 | tee - -
1
2
3
1
2
3
1
2
3
[sqlite💞ceacf3fb0808 (水 11月 06 20:51:04) ~/script_scratch/sed]$seq 3 | tee - >(tac)
1
2
3
1
2
3
3
2
1
[sqlite💞ceacf3fb0808 (水 11月 06 20:51:34) ~/script_scratch/sed]$seq 3 | tee >(tac)
1
2
3
3
2
1
[sqlite💞ceacf3fb0808 (水 11月 06 20:51:39) ~/script_scratch/sed]$seq 3 | tee >(tac|xargs)
1
2
3
[sqlite💞ceacf3fb0808 (水 11月 06 20:51:46) ~/script_scratch/sed]$3 2 1
^C
[sqlite💞ceacf3fb0808 (水 11月 06 20:51:48) ~/script_scratch/sed]$seq 3 | tee >(tac|xargs|cat -)
1
2
3
[sqlite💞ceacf3fb0808 (水 11月 06 20:51:50) ~/script_scratch/sed]$3 2 1
^C
[sqlite💞ceacf3fb0808 (水 11月 06 20:51:52) ~/script_scratch/sed]$seq 3 | tee >(tac|xargs) | cat -
1
2
3
3 2 1

```

```

[sqlite💞ceacf3fb0808 (水 11月 06 21:14:14) ~/script_scratch/sed]$sed -n "eseq 3| xargs -I@ seq @ | xargs -I@ seq @ | xargs -t -I@ seq @" <<<""
seq 1 
seq 1 
seq 1 
seq 2 
seq 1 
seq 1 
seq 2 
seq 1 
seq 2 
seq 3 
1
1
1
1
2
1
1
1
2
1
1
2
1
2
3

```


```
seq 3 | xargs -I@ bash -c 'sed -n "eseq 3| xargs -I@ seq $((@+1))" <<<""'
```

```
[sqlite💞ceacf3fb0808 (水 11月 06 21:20:52) ~/script_scratch/sed]$seq 3 | xargs -t -I@ bash -c 'seq @|sed ""'
bash -c seq 1|sed "" 
1
bash -c seq 2|sed "" 
1
2
bash -c seq 3|sed "" 
1
2
3

```


```
[sqlite💞ceacf3fb0808 (水 11月 06 21:23:02) ~/script_scratch/sed]$bash -c 'seq 3|sed --debug "G;H;"'
SED PROGRAM:
  G
  H
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: G
PATTERN: 1\n
COMMAND: H
HOLD:    \n1\n
END-OF-CYCLE:
1

INPUT:   'STDIN' line 2
PATTERN: 2
COMMAND: G
PATTERN: 2\n\n1\n
COMMAND: H
HOLD:    \n1\n\n2\n\n1\n
END-OF-CYCLE:
2

1

INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: G
PATTERN: 3\n\n1\n\n2\n\n1\n
COMMAND: H
HOLD:    \n1\n\n2\n\n1\n\n3\n\n1\n\n2\n\n1\n
END-OF-CYCLE:
3

1

2

1

```
