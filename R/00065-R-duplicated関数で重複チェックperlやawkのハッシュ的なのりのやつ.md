- CMD


```
$Rscript -e 'c(rep("c",2),rep("d",2),rep("c",2),rep("d",3))'
```

- OUT

```
[1] "c" "c" "d" "d" "c" "c" "d" "d" "d"
```

- CMD

```
$Rscript -e 'duplicated(c(rep("c",2),rep("d",2),rep("c",2),rep("d",3)))'
```

- OUT

```
[1] FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

- CMD

```
$Rscript -e '!duplicated(c(rep("c",2),rep("d",2),rep("c",2),rep("d",3)))'
```

- OUT
```
[1]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
```
