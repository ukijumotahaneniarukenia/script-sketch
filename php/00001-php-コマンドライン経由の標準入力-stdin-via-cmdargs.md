# 1

- IN

```
```

- CMD

```
$php コマンドライン経由の標準入力.php
```

- OUT

```
Array
(
    [0] => コマンドライン経由の標準入力.php
)
```

# 2

- IN

```
$echo {a..j}
a b c d e f g h i j
```

- CMD

```
$php コマンドライン経由の標準入力.php {a..j}
```

- OUT

```
Array
(
    [0] => コマンドライン経由の標準入力.php
    [1] => a
    [2] => b
    [3] => c
    [4] => d
    [5] => e
    [6] => f
    [7] => g
    [8] => h
    [9] => i
    [10] => j
)
```

# 3

- IN

```
$printf "%s\n" {a..j} | xargs -n3
a b c
d e f
g h i
j
```


- CMD

```
$php コマンドライン経由の標準入力.php "$(printf "%s\n" {a..j} | xargs -n3)"
```


- OUT

```
Array
(
    [0] => コマンドライン経由の標準入力.php
    [1] => a b c
d e f
g h i
j
)
```

# 4

- IN

```
$printf "%s\n" {a..j} | xargs -n3
a b c
d e f
g h i
j
```

- CMD

```
$php コマンドライン経由の標準入力.php $(printf "%s\n" {a..j} | xargs -n3)
```

- OUT

```
Array
(
    [0] => コマンドライン経由の標準入力.php
    [1] => a
    [2] => b
    [3] => c
    [4] => d
    [5] => e
    [6] => f
    [7] => g
    [8] => h
    [9] => i
    [10] => j
)
```
