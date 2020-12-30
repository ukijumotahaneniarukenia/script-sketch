- チュートリアル

  - https://ja.reactjs.org/tutorial/tutorial.html

- アプリのチュートリアル

  - https://create-react-app.dev/docs/getting-started

- https://material-ui.com/

- https://github.com/mui-org/material-ui/tree/master/docs/src/pages/getting-started/templates/blog

#1. プロジェクトディレクトリを作成する

#2. コンポーネントディレクトリを作成する

#3. コンポーネントディレクトリにテンプレートを参考にしファイルを作成する

#4. App.js or App.tsxに作成したコンポーネントファイルをインクルードする

#5. npm startでエラー出たら、npm install --save等で依存関係を解決する

#6. #3に戻る

#7. 完成後、npm buildで資産を梱包する

#8. web serverに梱包した資産を固めて配備する

```
$ mkdir -p 00001-React-ブログ

$ cd 00001-React-ブログ/

$ npx create-react-app app --use-npm --template javascript

or

$ npx create-react-app app --use-npm --template typescript

$ cd app

$ npm install @material-ui/core --save

$ npm install @material-ui/icons --save

$ mkdir -p app/src/components
```
