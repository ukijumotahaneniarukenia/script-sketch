- CMD

```
ruby -e'a,b=$*.map &:to_i;p (a..b).reduce :+' 3 5
```

- OUT

```
12
```


- CMD

```
ruby -e'a,b=$*.map &:to_i;p (a..b).reduce :lcm' 3 5
```

- OUT

```
60
```

- CMD

```
$ ruby -e 'p eval "3.lcm(4)"'
```

- OUT

```
12
```

- CMD

```
$ ruby -e'a,b=$*.map &:to_i;p a.to_s;(a..b).reduce{|a,e|p a.to_s+".lcm("+e.to_s+")"}' 3 7
```

- OUT

```
"3"
"3.lcm(4)"
"3.lcm(4).lcm(5)"
"3.lcm(4).lcm(5).lcm(6)"
"3.lcm(4).lcm(5).lcm(6).lcm(7)"
```

- CMD

```
$ ruby -e'a,b=$*.map &:to_i;p c=a.to_s;p eval c;(a..b).reduce{|a,e|c=a.to_s+".lcm("+e.to_s+")";p c;p eval c;}' 3 9|xargs -n2
```

- OUT

```
3 3
3.lcm(4) 12
12.lcm(5) 60
60.lcm(6) 60
60.lcm(7) 420
420.lcm(8) 840
840.lcm(9) 2520
```
