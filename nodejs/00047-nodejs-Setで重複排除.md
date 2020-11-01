CMD

```
$ node -e 'let a=[1,1,2,3,4,4,5];console.log(a)'
```

OUT

```
[
  1, 1, 2, 3,
  4, 4, 5
]
```

CMD

```
$ node -e 'let a=[1,1,2,3,4,4,5];console.log(new Set(a))'
```

OUT

```
Set { 1, 2, 3, 4, 5 }
```

CMD

```
$ node -e 'let a=[1,1,2,3,4,4,5];console.log(...new Set(a))'
```

OUT

```
1 2 3 4 5
```

CMD
```
$ node -e 'let a=[1,1,2,3,4,4,5];console.log([...new Set(a)])'
```

OUT

```
[ 1, 2, 3, 4, 5 ]
```
