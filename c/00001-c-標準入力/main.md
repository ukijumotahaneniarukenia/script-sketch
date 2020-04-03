- 複数行の複数列がうまくいけてない

- headコマンドで見たことのあるシグナルが出る

- CMD

```
$seq 1 | ./main
1
```


- CMD

```
$seq 10 | ./main
1
2
3
4
5
6
7
8
9
10
```

- CMD

```
$echo {a..d} | ./main
a b c d
```

- IN
```
$echo {a..d} | xargs -n1
a
b
c
d
```

- CMD

```
$echo {a..d} | xargs -n1 | ./main
a
xargs: echo: terminated by signal 13
```

- CMD

```
$echo うんこ | ./main
うんこ
```

- CMD

```
$echo う ん こ | ./main
う ん こ
```


- IN

```
$echo う ん こ | xargs -n2
う ん
こ
```

- CMD

```
$echo う ん こ | xargs -n2 | ./main
う ん
xargs: echo: terminated by signal 13
```
