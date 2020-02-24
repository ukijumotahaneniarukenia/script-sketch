- IN

```
$cat test.json
[
  {
    "key": "items.0.id",
    "value": "2tM1DedEr6eqgdqJ8X4sP+CS3BVG/bkK4hS45ZnKnRQ=_170496cd57a:c60cb39:31d4c877"
  },
  {
    "key": "items.0.title",
    "value": "A Canadian Energy Company Bought an Oregon Sheriff’s Unit"
  },
  {
    "key": "items.1.id",
    "value": "kbcnL5XqWJi/iYn/BuKqrf/JSzXEf2szaOaXmzc6oZ4=_170496c85db:c60c640:31d4c877"
  },
  {
    "key": "items.1.title",
    "value": "経験者がいない状態で、戦略的DDDを現場でやってみた話/ OOC2020"
  }
]
```

- CMD

```
$cat test.json | jq -c --stream 'select(length==2)|{path:.[0]|map(if type == "number" then "[" + tostring + "]." else . end)|[join("")]|map("." + .)|.[],tuple:.[1]}'
```

- OUT

```
{"path":".[0].key","tuple":"items.0.id"}
{"path":".[0].value","tuple":"2tM1DedEr6eqgdqJ8X4sP+CS3BVG/bkK4hS45ZnKnRQ=_170496cd57a:c60cb39:31d4c877"}
{"path":".[1].key","tuple":"items.0.title"}
{"path":".[1].value","tuple":"A Canadian Energy Company Bought an Oregon Sheriff’s Unit"}
{"path":".[2].key","tuple":"items.1.id"}
{"path":".[2].value","tuple":"kbcnL5XqWJi/iYn/BuKqrf/JSzXEf2szaOaXmzc6oZ4=_170496c85db:c60c640:31d4c877"}
{"path":".[3].key","tuple":"items.1.title"}
{"path":".[3].value","tuple":"経験者がいない状態で、戦略的DDDを現場でやってみた話/ OOC2020"}
```
