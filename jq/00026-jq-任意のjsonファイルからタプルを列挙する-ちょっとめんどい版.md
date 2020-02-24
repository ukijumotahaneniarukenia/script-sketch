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
cat test.json | jq -rc 'paths|map(if type=="number" then "["+tostring+"]" else "."+. end)|join("")' | sed -r 's;^;\.;' | \
  while read tgt;do
    PATH_EXPR=$(echo "$tgt|select(type==\"number\" or type==\"string\" or type==\"boolean\")")
    RT=$(printf "%s %s\n" "jq -r -c '$PATH_EXPR'" test.json | sh)
    if [ "XXX$RT" != "XXX" ]; then
      printf "%s\t%s\n" "$(printf "%s\n" "$PATH_EXPR")" "$(printf "%s %s\n" "jq -c '$PATH_EXPR'" test.json | sh)"
    fi
  done
```


- OUT

```
.[0].key|select(type=="number" or type=="string" or type=="boolean")	"items.0.id"
.[0].value|select(type=="number" or type=="string" or type=="boolean")	"2tM1DedEr6eqgdqJ8X4sP+CS3BVG/bkK4hS45ZnKnRQ=_170496cd57a:c60cb39:31d4c877"
.[1].key|select(type=="number" or type=="string" or type=="boolean")	"items.0.title"
.[1].value|select(type=="number" or type=="string" or type=="boolean")	"A Canadian Energy Company Bought an Oregon Sheriff’s Unit"
.[2].key|select(type=="number" or type=="string" or type=="boolean")	"items.1.id"
.[2].value|select(type=="number" or type=="string" or type=="boolean")	"kbcnL5XqWJi/iYn/BuKqrf/JSzXEf2szaOaXmzc6oZ4=_170496c85db:c60c640:31d4c877"
.[3].key|select(type=="number" or type=="string" or type=="boolean")	"items.1.title"
.[3].value|select(type=="number" or type=="string" or type=="boolean")	"経験者がいない状態で、戦略的DDDを現場でやってみた話/ OOC2020"
```
