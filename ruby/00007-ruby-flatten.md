- IN

```
$echo "test.csv test2.csv"
test.csv test2.csv
```

- CMD

```
$echo "test.csv test2.csv" | ruby -e 'a=STDIN.readlines.map{|line|line.split(/\s{1,}/)};p a, a.flatten'
```

- OUT

```
[["test.csv", "test2.csv"]]
["test.csv", "test2.csv"]
```
