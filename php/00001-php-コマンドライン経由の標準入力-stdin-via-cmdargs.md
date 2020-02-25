# 1

- IN

```
```

- CMD

```
$php コマンドライン経由の00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php
```

- OUT

```
Array
(
    [0] => コマンドライン経由の00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php
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
$php コマンドライン経由の00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php {a..j}
```

- OUT

```
Array
(
    [0] => コマンドライン経由の00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php
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
$php コマンドライン経由の00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php "$(printf "%s\n" {a..j} | xargs -n3)"
```


- OUT

```
Array
(
    [0] => コマンドライン経由の00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php
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
$php コマンドライン経由の00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php $(printf "%s\n" {a..j} | xargs -n3)
```

- OUT

```
Array
(
    [0] => コマンドライン経由の00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php
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

# 5

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
$php 00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php $(printf "%s\n" {a..j} | xargs -n3)
```


- OUT

```
Array
(
    [0] => 00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php
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

# 6

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
$php 00001-php-コマンドライン経由の標準入力-stdin-via-cmdargs.php "$(printf "%s\n" {a..j} | xargs -n3)"
```


- OUT

```
Array
(
    [0] => a b c
    [1] => d e f
    [2] => g h i
    [3] => j
)
```
