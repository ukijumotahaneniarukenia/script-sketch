- IN

```

```


- CMD

```
$node -e 'a="💩"+"\u{200D}"+"💩";console.log(a,a.length)'
$node -e 'a="a";console.log(a,a.length)'
$node -e 'a="💩"+"\u{200D}"+"💩";console.log(a,a.length)'
💩‍💩 5
$node -e 'a="💩";console.log(a,a.length)'
💩 2
$node -e 'a="a";console.log(a,a.length)'
a 1
$node -e 'a="あ";console.log(a,a.length)'
あ 1
$node -e 'a="森";console.log(a,a.length)'
森 1
$node -e 'a="💩";console.log(a,a.length)'
💩 2


$node -e 'a="💩";console.log(a,a.charCodeAt(-1))'
💩 NaN
$node -e 'a="💩";console.log(a,a.charCodeAt(0))'
💩 55357
$node -e 'a="💩";console.log(a,a.charCodeAt(1))'
💩 56489
$node -e 'a="💩";console.log(a,a.charCodeAt(2))'
💩 NaN
```

空文字対応のため、||演算子で空配列足し込んで、絵文字以外の文字を含まれることを想定し、
元バイト長から分割回数をひく

区切り文字はサロゲート区切り上位と下位の両方を指定

```
#/usr/bin/env node

s="💩モリモリ🌳鴎外";

let s = s.length - (s.match(/[\uD800-\uDBFF][\uDC00-\uDFFF]/g)||[]).length;

print(s);
```

空配列足し込んでいないとエラー

```
> s="あ"
'あ'
> s.match(/[\uD800-\uDBFF][\uDC00-\uDFFF]/g).length
Uncaught TypeError: Cannot read property 'length' of null
> s=""
''
> s.match(/[\uD800-\uDBFF][\uDC00-\uDFFF]/g).length
Uncaught TypeError: Cannot read property 'length' of null
> s="💩🌟"
'💩🌟'
> s.match(/[\uD800-\uDBFF][\uDC00-\uDFFF]/g).length
2
```
