
便利
- https://play.golang.org/p/JQRF1WIEvP

文字列

小文字など

```

$ echo {a..d} | xargs -n1
a
b
c
d

$ echo {a..d} | xargs -n1 | ./bin/main
A
B
C
D

$ echo {a..d} | xargs -n2 | ./bin/main
A B
C D

$ echo {a,B,C,d} | xargs -n2 | ./bin/main
A B
C D


```



もともと大文字
```

$ echo {A..D} | xargs -n1
A
B
C
D



$ echo {A..D} | xargs -n1 | ./bin/main
A
B
C
D

$ echo {A..D} | xargs -n2 | ./bin/main
A B
C D
```


数値でもいけた

go便利

```

$ ./bin/main
^C

$ echo -ne 1 | ./bin/main
1


$ seq 10 | ./bin/main
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


$ seq 10 | xargs -n3 | ./bin/main
1 2 3
4 5 6
7 8 9
10
```


あとはスプリットやジョインでいいかんじにすればいけそう

