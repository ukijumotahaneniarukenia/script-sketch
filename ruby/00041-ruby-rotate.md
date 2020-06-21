- IN

```

```

- CMD

```
ruby -e 'a = [ "a", "b", "c", "d" ];a.size.times{p a.rotate(_1+1)}'
```


- OUT

```
["b", "c", "d", "a"]
["c", "d", "a", "b"]
["d", "a", "b", "c"]
["a", "b", "c", "d"]
```


- CMD

```
ruby -e 'a = [ "a", "b", "c", "d" ];a.size.times{p a.rotate(_1+1).reverse}'
```


- OUT

```
["a", "d", "c", "b"]
["b", "a", "d", "c"]
["c", "b", "a", "d"]
["d", "c", "b", "a"]
```


- CMD

```
ruby -e 'a = [ "a", "b", "c", "d" ];b=[];a.size.times{b.push(a.rotate(_1+1))};b.transpose.map{|e|p e}'
```


- OUT

```
["b", "c", "d", "a"]
["c", "d", "a", "b"]
["d", "a", "b", "c"]
["a", "b", "c", "d"]
```


- CMD

```
ruby -e 'a = [ "a", "b", "c", "d" ];b=[];a.size.times{b.push(a.rotate(_1+1)).reverse};b.transpose.map{|e|p e}'
```


- OUT

```
["b", "c", "d", "a"]
["c", "d", "a", "b"]
["d", "a", "b", "c"]
["a", "b", "c", "d"]
```
