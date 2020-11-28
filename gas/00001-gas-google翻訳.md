- REF
  - https://qiita.com/tanabee/items/c79c5c28ba0537112922

- PRE
  - https://script.google.com/home
  - 権限をAnyoneにしておく
```
function doGet(e) {
  var p = e.parameter;
  var translatedText = LanguageApp.translate(p.text, p.source, p.target);
  return ContentService.createTextOutput(translatedText);
}
```


- CMD
  - 日本語から英語
```
wget -q 'https://script.google.com/macros/s/AKfycbwScG8AAKZazwP0pV_ab5I7zOd1YSwS81xXwIhS7fL2ETaXUrQ/exec?text=舌足らずの発音&source=ja&target=en' -O a
```

```
$ echo America/Mexico_City | xargs -I@ curl -s -X GET -L 'https://script.google.com/macros/s/AKfycbyOLetU0NY1NF8sJyZTmaYK6YK9O5wotKFx4KfTXq3XAv_nvq4/exec?text=@&source=en&target=ja' | awk 4
アメリカ/メキシコシティ
```

- OUT

```
$ cat a
Unobtrusive pronunciation
```


- CMD
  - 英語から日本語

```
wget -q 'https://script.google.com/macros/s/AKfycbwScG8AAKZazwP0pV_ab5I7zOd1YSwS81xXwIhS7fL2ETaXUrQ/exec?text=lisp&source=en&target=ja' -O a
```

- OUT

```
$ cat a
舌足らずの発音
```

- CMD

  - 長文を翻訳する場合


```
$ wget -q 'https://www.aozora.gr.jp/cards/000035/files/1567_14913.html' -O - | pup '.main_text' | grep -P '\p{Hiragana}|\p{Han}|\p{Katakana}'>a

$ cat a | tr -d \\\n | tr -d [:print:] > b

テキストプロパティの上限は500文字程度
$ cat b | grep -Po '.{1,500}'>c


$ cat c | xargs -I@ wget -q 'https://script.google.com/macros/s/AKfycbwScG8AAKZazwP0pV_ab5I7zOd1YSwS81xXwIhS7fL2ETaXUrQ/exec?text=@&source=ja&target=en' -O -
```

- POST

  - 作業終わり次第プロジェクト削除

  - ゴミ箱ではだめで、完全に削除で

