- https://snipcart.com/blog/next-js-ecommerce-tutorial

- https://app.snipcart.com/dashboard

- https://qiita.com/rana_kualu/items/915345b8f3f870cfe2aa


```
$ mkdir -p 00009-React-ショッピングカートアプリ

$ cd 00009-React-ショッピングカートアプリ

$ mkdir -p my-app


$ cd my-app/


$ npm init -y

$ npm install --save react @types/react react-dom @types/react-dom next @types/next @zeit/next-typescript @zeit/next-sass node-sass

$ npm install --save typescript @types/node

$ touch next.config.js

プロジェクトでTypeScriptとSassを使用することをNext.jsに指示
$ cat <<EOS >next.config.js
const withTypescript = require('@zeit/next-typescript')
const withSass = require('@zeit/next-sass')
module.exports = withTypescript(withSass());
EOS

$ cat <<EOS >.babelrc.js
module.exports = {
  presets: ['next/babel', '@zeit/next-typescript/babel']
}
EOS

package.jsonファイルに次のスクリプトを追加

$ cat package.json
{
  "name": "my-app",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "dev": "next",
    "build": "next build",
    "start": "next start",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "@types/next": "^9.0.0",
    "@types/react": "^16.9.43",
    "@types/react-dom": "^16.9.8",
    "@zeit/next-sass": "^1.0.1",
    "@zeit/next-typescript": "^1.1.1",
    "next": "^9.4.4",
    "node-sass": "^4.14.1",
    "react": "^16.13.1",
    "react-dom": "^16.13.1"
  }
}


インデックスページ作成
$ mkdir -p pages

$ touch pages/index.tsx
function Index(){
    return (
      <div className="app">
        <p>Hello world!</p>
      </div>
    )
  }

export default Index

$ npm run dev

$ chrome http://localhost:3000/

$ firefox http://localhost:3000/

コンポーネント作成
$ mkdir -p components


```
