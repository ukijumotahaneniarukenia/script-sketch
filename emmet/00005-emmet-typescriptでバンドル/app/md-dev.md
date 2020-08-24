```
$ mkdir -p 00003-emmet-typescriptでがんばる


$ cd 00003-emmet-typescriptでがんばる


$ mkdir -p app


$ cd app/


$ npm init -y


$ npm install emmet


$ sudo npm install -g typescript

$ sudo npm install -g @types/typescript


$ tsc a.ts 
node_modules/emmet/dist/src/stylesheet/index.d.ts:4:38 - error TS2307: Cannot find module './scope' or its corresponding type declarations.

4 import { CSSAbbreviationScope } from './scope';
                                       ~~~~~~~~~


Found 1 error.



$ npm install scope
npm WARN app@1.0.0 No description
npm WARN app@1.0.0 No repository field.

+ scope@0.10.1
added 1 package from 1 contributor and audited 8 packages in 1.883s
found 0 vulnerabilities



修正前
import { CSSAbbreviationScope } from './scope';


修正後
import { CSSAbbreviationScope } from '../../../../scope';



$ tsc a.ts 

$ ls a.*
a.js  a.ts


$ node a.js
<p><a href=""></a></p>


パッキング

$ npm install webpack webpack-cli typescript ts-loader


$ cat tsconfig.json <<EOS
{
    "compilerOptions": {
        "target": "ESNext",
        "module": "CommonJS",
        "noImplicitAny": true
    }
}
EOS


$ cat webpack.config.js <<EOS
module.exports = {
    mode: 'development',
    entry: './a.ts',
    output: {
        path: __dirname,
        filename: 'bundle.js'
    },
    module: {
        rules: [
            {
                test: /\.ts$/,
                loader: 'ts-loader'
            }
        ]
    },
    resolve: {
        extensions: ['.ts', '.js']
    }
}
EOS

$ npm start

> app@1.0.0 start /home/aine/script-sketch/emmet/00005-emmet-typescriptでバンドル/app
> webpack

Hash: 7122f4d7c3eaa7d43ce2
Version: webpack 4.44.1
Time: 983ms
Built at: 2020-08-24 23:14:31
    Asset     Size  Chunks             Chunk Names
bundle.js  181 KiB    main  [emitted]  main
Entrypoint main = bundle.js
[./a.ts] 174 bytes {main} [built]
    + 4 hidden modules


プロジェクトローカルでインストールした実行コマンドをエイリアスつけて実行する場合はscriptに記載


$ cat package.json <<EOS
{
  "name": "app",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "webpack"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "@types/typescript": "^2.0.0",
    "emmet": "^2.1.2",
    "scope": "^0.10.1",
    "ts-loader": "^8.0.3",
    "typescript": "^4.0.2",
    "webpack": "^4.44.1",
    "webpack-cli": "^3.3.12"
  }
}
EOS


$ node bundle.js
<p><a href=""></a></p>


ポータブルかどうか

$ cp bundle.js $HOME


$ cd $HOME


$ node bundle.js
<p><a href=""></a></p>



```
