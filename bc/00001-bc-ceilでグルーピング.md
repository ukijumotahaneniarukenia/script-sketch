


- CMD

```
seq 10 | xargs -I@ echo "if (@%3){@/3+1}else{@/3}" | bc | nl -w1
```


- OUT

```

1	1
2	1
3	1
4	2
5	2
6	2
7	3
8	3
9	3
10	4

```


- REF

  - https://unix.stackexchange.com/questions/168476/convert-a-float-to-the-next-integer-up-as-opposed-to-the-nearest
