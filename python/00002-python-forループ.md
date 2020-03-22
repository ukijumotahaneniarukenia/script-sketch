- CMD

```
python3 -c 'for i in range(10):print(i)'
```

- OUT

```
0
1
2
3
4
5
6
7
8
9
```


- CMD

```
$python3 -c '[print(i) for i in range(10)]'
```

- OUT

```
0
1
2
3
4
5
6
7
8
9
```


- CMD

```
$python3 -c '[print(str(i)+"-"+str(j)) for i in range(5) for j in range(7)]'
```


- OUT
```
0-0
0-1
0-2
0-3
0-4
0-5
0-6
1-0
1-1
1-2
1-3
1-4
1-5
1-6
2-0
2-1
2-2
2-3
2-4
2-5
2-6
3-0
3-1
3-2
3-3
3-4
3-5
3-6
4-0
4-1
4-2
4-3
4-4
4-5
4-6
```
