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
$printf "%s\n" {a..j} | xargs -n3 | php 標準入力.php
```

- OUT

```
Array
(
    [0] => Array
        (
            [0] => a
            [1] => b
            [2] => c

        )

    [1] => Array
        (
            [0] => d
            [1] => e
            [2] => f

        )

    [2] => Array
        (
            [0] => g
            [1] => h
            [2] => i

        )

    [3] => Array
        (
            [0] => j

        )

)
Array
(
    [0] => a
    [1] => b
    [2] => c

)
```
