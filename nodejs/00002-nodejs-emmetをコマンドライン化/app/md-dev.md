```
$ mkdir 00002-nodejs-emmetをコマンドライン化


$ cd 00002-nodejs-emmetをコマンドライン化/


$ mkdir -p app

$ cd app/

$ echo '/node_modules/* /package-lock.json' | xargs -n1 >.gitignore


$ npm init -y


$ npm install emmet


$ npm install scope


$ npm install webpack webpack-cli

$ cat <<EOS > webpack.config.js
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

$ cat <<EOS > package.json
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


unko exclude must !!!!

$ echo 'ul>li.sample$*5' | node app.js
<ul>
	<li class="sample1"></li>
	<li class="sample2"></li>
	<li class="sample3"></li>
	<li class="sample4"></li>
	<li class="sample5"></li>
	<unko></unko>
</ul>

$ echo 'ul>li.sample$*5' | node app.js | grep -vP 'unko'
<ul>
	<li class="sample1"></li>
	<li class="sample2"></li>
	<li class="sample3"></li>
	<li class="sample4"></li>
	<li class="sample5"></li>
</ul>


$ echo 'head>(meta:vp+title{サンプルページダヨーン}' | node app.js | grep -vP 'unko'
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>サンプルページダヨーン</title>
</head>


$ echo 'ul>li' | node app.js
<ul>
	<li></li>
</ul>

アスタリスクを含む場合はunko除外で

$ echo 'ul>li*5' | node app.js
<ul>
	<li></li>
	<li></li>
	<li></li>
	<li></li>
	<li></li>
	<unko></unko>
</ul>


デフォでうんこ除外しておけばいい

$ echo 'ul>li.item$@-*5' | node app.js | grep -vP 'unko'
<ul>
	<li class="item5"></li>
	<li class="item4"></li>
	<li class="item3"></li>
	<li class="item2"></li>
	<li class="item1"></li>
</ul>


```
