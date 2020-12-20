CMD

```
$ node -e 'let a=[1, [2, 5], [6, 7], 9];console.log(a)'
```

OUT

```
[ 1, [ 2, 5 ], [ 6, 7 ], 9 ]
```

CMD

```
$ node -e 'let a=[1, [2, 5], [6, 7], 9];console.log(a.flat())'
```

OUT

```
[ 1, 2, 5, 6, 7, 9 ]
```

CMD

```
$ node -e 'let a=[1, [2, 5], [6, 7], 9];console.log(...a)'
```

OUT

```
1 [ 2, 5 ] [ 6, 7 ] 9
```
