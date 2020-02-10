```
$echo 1 | sed 's;1;3;'
3
$echo 1 | sed --debug 's;1;3;'
SED PROGRAM:
  s/1/3/
INPUT:   'STDIN' line 1
PATTERN: 1
COMMAND: s/1/3/
MATCHED REGEX REGISTERS
  regex[0] = 0-1 '1'
PATTERN: 3
END-OF-CYCLE:
3
```
