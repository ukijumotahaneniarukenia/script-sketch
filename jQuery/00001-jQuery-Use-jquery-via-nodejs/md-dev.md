- https://qiita.com/ritukiii/items/a28033b30d7681492c98


```
//一般ユーザーで実行
$ npm --yes init
Wrote to /home/kuraine/script-sketch/jQuery/00001-jQuery-Use-jquery-via-nodejs/package.json:

{
  "name": "00001-jQuery-Use-jquery-via-nodejs",
  "version": "1.0.0",
  "description": "",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}




$ npm install jquery --save


//ブラウザで実行できるようにトランスフォームコマンドをインストール
//開発環境のみ必要
$ npm install -D browserify



$ npm bin
/home/kuraine/script-sketch/jQuery/00001-jQuery-Use-jquery-via-nodejs/node_modules/.bin



$ ls -lh $(npm bin)/browserify
lrwxrwxrwx 1 kuraine kuraine 24  6月 13 00:06 /home/kuraine/script-sketch/jQuery/00001-jQuery-Use-jquery-via-nodejs/node_modules/.bin/browserify -> ../browserify/bin/cmd.js

//Webサーバー起動
$ apachectl stop
$ apachectl start

//rootユーザーで実行
$ sudo cp test.html /var/www/html/test.html
$ sudo $(npm bin)/browserify app.js -o /var/www/html/app.js

```

ブラウザを立ち上げ、以下のURLを入力

- http://localhost:80/test.html

文字が赤くなっていればおｋ
