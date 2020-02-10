```
$cat a
a
b
c
d
```

```
$cat a | sed '1!G; $!h; $!d'
d
c
b
a
```

```
$cat a | sed --debug '1!G; $!h; $!d'
SED PROGRAM:
  1! G
  $! h
  $! d
INPUT:   'STDIN' line 1
PATTERN: a
COMMAND: 1! G
COMMAND: $! h
HOLD:    a
COMMAND: $! d
END-OF-CYCLE:
INPUT:   'STDIN' line 2
PATTERN: b
COMMAND: 1! G
PATTERN: b\na
COMMAND: $! h
HOLD:    b\na
COMMAND: $! d
END-OF-CYCLE:
INPUT:   'STDIN' line 3
PATTERN: c
COMMAND: 1! G
PATTERN: c\nb\na
COMMAND: $! h
HOLD:    c\nb\na
COMMAND: $! d
END-OF-CYCLE:
INPUT:   'STDIN' line 4
PATTERN: d
COMMAND: 1! G
PATTERN: d\nc\nb\na
COMMAND: $! h
COMMAND: $! d
END-OF-CYCLE:
d
c
b
a
```

http://sed.sourceforge.net/grabbag/scripts/
```
seq 3 | sed -n '1!G;h;$p'
[sqlite💜ceacf3fb0808 (水 11月 06 07:55:54) ~/script_scratch/sed]$seq 3 | sed --debug -n '1!G;h;$p'
SED PROGRAM:
  1! G
  h
  $ p
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: 1! G
COMMAND: h
HOLD:    1
COMMAND: $ p
END-OF-CYCLE:
INPUT:   'STDIN' line 2
PATTERN: 2
COMMAND: 1! G
PATTERN: 2\n1
COMMAND: h
HOLD:    2\n1
COMMAND: $ p
END-OF-CYCLE:
INPUT:   'STDIN' line 3
PATTERN: 3
COMMAND: 1! G
PATTERN: 3\n2\n1
COMMAND: h
HOLD:    3\n2\n1
COMMAND: $ p
3
2
1
END-OF-CYCLE:
[sqlite💜ceacf3fb0808 (水 11月 06 07:55:59) ~/script_scratch/sed]$seq 3 | sed -n '1!G;h;$p'
3
2
1

```
