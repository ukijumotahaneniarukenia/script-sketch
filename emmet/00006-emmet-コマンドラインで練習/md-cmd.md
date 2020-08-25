- https://github.com/Delapouite/emmet-cli
```
$ sudo npm install -g emmet-cli
```

こういうイメージ

```
$ echo 'div>(header>ul>li*2>a)+footer>p' | jq -Rr '[splits("[^0-9a-zA-Z]\\K")|select(""!=.)|splits("[0-9a-zA-Z]+\\K")|select(""!=.)]'
[
  "div",
  ">",
  "(",
  "header",
  ">",
  "ul",
  ">",
  "li",
  "*",
  "2",
  ">",
  "a",
  ")",
  "+",
  "footer",
  ">",
  "p"
]
```



```
echo 'div>(header>ul>li*2>a)+footer>p' | jq -Rr '[splits("[^0-9a-zA-Z]\\K")|select(""!=.)|splits("[0-9a-zA-Z]+\\K")|select(""!=.)]|join("")'
```


```
div>(header>ul>li*2>a)+footer>p
```
