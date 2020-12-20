
ダイナミックインポートだとトランスパイルでこけるので、使わない書き方が無難

ダイナミックインポート
- https://qiita.com/tonkotsuboy_com/items/f672de5fdd402be6f065

バベルで書きっぷりを揃えるようにトランスパイラ手順が必要

最新の書き方を主にダウングレードするような手順

- https://teratail.com/questions/114541#reply-174279
```
Babelをかませた後、Browserifyで依存関係解決する。

BabelはES2015+のコードをES5相当までダウングレードするだけのツール。

BrowserifyはrequireをJavaScript世界にでっち上げるだけのツール。
```

```
Uncaught ReferenceError: require is not defined
    at Object.__webpack_require__.f.require (main.js:141)
    at main.js:82
    at Array.reduce (<anonymous>)
    at Function.__webpack_require__.e (main.js:81)
    at HTMLButtonElement.eval (index.js:33)
main.js:141 Uncaught ReferenceError: require is not defined
    at Object.__webpack_require__.f.require (main.js:141)
    at main.js:82
    at Array.reduce (<anonymous>)
    at Function.__webpack_require__.e (main.js:81)
    at HTMLButtonElement.eval (index.js:16)
main.js:141 Uncaught ReferenceError: require is not defined
    at Object.__webpack_require__.f.require (main.js:141)
    at main.js:82
    at Array.reduce (<anonymous>)
    at Function.__webpack_require__.e (main.js:81)
    at HTMLButtonElement.eval (index.js:50)
```

package.jsonファイルが存在しているディレクトリで実行

```
npm install babel-loader @babel/core @babel/preset-env --save
```

webpack.config.jsファイルをメンテ

```

```


browserifyコマンドインストール

```
npm install browserify --save
```

単一ファイルに再バンドル

バンドル前

```
$ ls -lh
合計 32K
drwxrwxr-x 2 aine aine 4.0K 12月 20 18:21 .
drwxrwxr-x 7 aine aine 4.0K 12月 20 18:21 ..
-rw-rw-r-- 1 aine aine 3.2K 12月 20 18:21 lib_circle_js.main.js
-rw-rw-r-- 1 aine aine 3.0K 12月 20 18:21 lib_square_js.main.js
-rw-rw-r-- 1 aine aine 3.4K 12月 20 18:21 lib_triangle_js.main.js
-rwxr-xr-x 1 aine aine  10K 12月 20 18:21 main.js
```

```
$ cd 00068-nodejs-import文でModuleオブジェクトをコールバックに受け取り動的にクラスメソッド等を実行する/app/dist

$ ../node_modules/browserify/bin/cmd.js main.js lib_circle_js.main.js lib_square_js.main.js lib_triangle_js.main.js -o app.js
```

バンドル後

```
$ ls- lh
合計 44K
drwxrwxr-x 2 aine aine 4.0K 12月 20 18:31 .
drwxrwxr-x 7 aine aine 4.0K 12月 20 18:21 ..
-rw-rw-r-- 1 aine aine  11K 12月 20 18:31 app.js
-rw-rw-r-- 1 aine aine 3.2K 12月 20 18:21 lib_circle_js.main.js
-rw-rw-r-- 1 aine aine 3.0K 12月 20 18:21 lib_square_js.main.js
-rw-rw-r-- 1 aine aine 3.4K 12月 20 18:21 lib_triangle_js.main.js
-rwxr-xr-x 1 aine aine  10K 12月 20 18:21 main.js
```
