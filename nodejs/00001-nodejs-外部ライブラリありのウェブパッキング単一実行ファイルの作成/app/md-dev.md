```
$ mkdir -p 00001-nodejs-外部ライブラリありのウェブパッキング単一実行ファイルの作成


$ cd 00001-nodejs-外部ライブラリありのウェブパッキング単一実行ファイルの作成


$ mkdir -p app

$ cd app/

$ echo '/node_modules/* /package-lock.json' | xargs -n1 >.gitignore


$ npm init -y


$ npm install emmet

$ npm install scope


$ code .

$ cat <<EOS
"use strict";

exports.__esModule = true;

let emmet = require("emmet");

console.log(emmet["default"]('p>a'));

let fs = require("fs")

let input =fs.readFileSync("/dev/stdin","utf8");

console.log(input);
EOS



$ npm install webpack webpack-cli

$ cat <<EOS >webpack.config.js
module.exports = {
    mode: 'development',
    entry: './main.js',
    target: 'node',
    output: {
        path: __dirname,
        filename: 'app.js'
    },
    module: {
        rules: [
            {
                test: /\.js$/,
            }
        ]
    },
    resolve: {
        extensions: ['.ts', '.js']
    }
}
EOS


$ cat <<EOS >package.json
{
  "name": "app",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
     "start" : "webpack"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "emmet": "^2.1.2",
    "scope": "^0.10.1",
    "webpack": "^4.44.1",
    "webpack-cli": "^3.3.12"
  }
}
EOS



$ npm start

> app@1.0.0 start /home/aine/script-sketch/nodejs/00001-nodejs-外部ライブラリありのウェブパッキング単一実行ファイルの作成/app
> webpack

Hash: e9c32c9fb11ce8f322a2
Version: webpack 4.44.1
Time: 145ms
Built at: 2020-08-25 0:22:24
 Asset     Size  Chunks             Chunk Names
app.js  182 KiB    main  [emitted]  main
Entrypoint main = app.js
[./main.js] 207 bytes {main} [built]
[fs] external "fs" 42 bytes {main} [built]
    + 4 hidden modules


$ echo うんこ | node app.js
<p><a href=""></a></p>
うんこ


ポータブルか

$ cp app.js $HOME/

$ cd $HOME

$ echo うんこ | node app.js
<p><a href=""></a></p>
うんこ

$ echo 'body>(ul>li.sample$*5)' | node app.js | grep -vP 'unko'
<body>
	<ul>
		<li class="sample1"></li>
		<li class="sample2"></li>
		<li class="sample3"></li>
		<li class="sample4"></li>
		<li class="sample5"></li>
	</ul>
</body>


```
