CMD

```
$ node -e 'console.log(Object.prototype.toString.call({s:0,e:9}))'
```

OUT

```
[object Object]
```

CMD

```
$ node -e 'console.log(Object.prototype.toString.call([{s:0},{e:9}]))'
```

OUT

```
[object Array]
```

CMD

```
$ node -e 'console.log(Object.prototype.toString.call([0,9]))'
```

OUT

```
[object Array]
```

CMD

```
$ node -e 'console.log(Object.prototype.toString.call(["a","b"]))'
```

OUT

```
[object Array]
```

CMD

```
$ node -e 'console.log(Object.prototype.toString.call("a"))'
```

OUT

```
[object String]
```

CMD

```
$ node -e 'console.log(Object.prototype.toString.call(0))'
```

OUT

```
[object Number]
```

CMD

```
$ node -e 'console.log(Object.prototype.toString.call(null))'
```

OUT

```
[object Null]
```

CMD

```
$ node -e 'console.log(Object.prototype.toString.call(undefined))'
```

OUT

```
[object Undefined]
```

CMD

```
$ node -e 'console.log(Object.prototype.toString.call(""))'
```

OUT

```
[object String]
```

CMD

```
$ node -e 'console.log(Object.prototype.toString.call(true))'
```

OUT

```
[object Boolean]
```


CMD
```
$ node -e 'console.log(Object.prototype.toString.call(false))'
```

OUT
```
[object Boolean]
```
