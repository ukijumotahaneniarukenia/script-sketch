- DAT

```
$mkdir -p test{1,2}
$touch test1/{a..d}
$touch test2/{a..d}
$touch test1/{h..j}
$touch test2/{l..n}
$touch test1/{x..z}
$touch test2/{x..z}
```

```
$ls test1
a  b  c  d  h  i  j  x  y  z
$ls test2
a  b  c  d  l  m  n  x  y  z
```

- CMD

```
$./main 1 'ls test1' 'ls test2'
lft:10
rgt:10
XXX:7
@["a", "b", "c", "d", "x", "y", "z"]
```

```
$./main 2 'ls test1' 'ls test2'
lft:10
rgt:10
XXX:13
@["a", "b", "c", "d", "h", "i", "j", "l", "m", "n", "x", "y", "z"]
```

```
$./main 3 'ls test1' 'ls test2'
lft:10
rgt:10
XXX:3
@["h", "i", "j"]
```

```
$./main 3 'ls test2' 'ls test1'
lft:10
rgt:10
XXX:3
@["l", "m", "n"]
```

```
$./main 4 'ls test1' 'ls test2'
lft:10
rgt:10
XXX:6
@["h", "i", "j", "l", "m", "n"]
```
