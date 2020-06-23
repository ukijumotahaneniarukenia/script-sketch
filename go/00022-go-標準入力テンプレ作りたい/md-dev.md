- https://play.golang.org/p/JQRF1WIEvP


- IN

```
$ echo うんこでそう | grep -Po . | xargs -n3
う ん こ
で そ う
```

- CMD

```
echo うんこでそう | grep -Po . | xargs -n3 | ./bin/main
```

- OUT

```
map[1:[う ん こ] 2:[で そ う]]
1 [う ん こ]
2 [で そ う]
```

- IN

```
$ echo うんこでそう | grep -Po . | xargs -n2
う ん
こ で
そ う
```

- CMD

```
echo うんこでそう | grep -Po . | xargs -n2 | ./bin/main
```

- OUT

```
map[1:[う ん] 2:[こ で] 3:[そ う]]
1 [う ん]
2 [こ で]
3 [そ う]
```

- IN

```
$ echo うんこでそう | grep -Po . | xargs -n4
う ん こ で
そ う
```

- CMD

```
echo うんこでそう | grep -Po . | xargs -n4 | ./bin/main
```

- OUT

```
map[1:[う ん こ で] 2:[そ う]]
1 [う ん こ で]
2 [そ う]
```
