調査基準

#1. ルーティング設定・多言語対応等の仕組み（ダイナミックネストルーティングできるか）

#2. コンポーネントフレームワークの使いっぷり

#3. 状態管理フレームワークの使いっぷり（オンメモリの場合）

#4. テストフレームワークの使いっぷり（スクリプトレベルとE２Eレベル）

#5. 言語レベルの操作感（作業ワークフローのハンディさ）

#6. ビルド手順整備（webpack、npx、npm、tsconfig.json、package.json）

#7. レスポンシブ対応（モバイルでも見やすいか）

#8. データ永続化用のDB（firestore、realm、mongodb）

#9. 認証周り（firebase）

#10. エコシステム対応（PWA化、AMP化、Electron等）

VueのVuetify、ReactのMaterial-Uiのイメージ

- Vueのコンポーネントフレームワーク

  - Vuetify

    - https://vuetifyjs.com/ja/components/alerts/

- Reactのコンポーネントフレームワーク

  - react-bootstrap

    - https://github.com/react-bootstrap/react-bootstrap/blob/master/www/src/examples/Modal/Basic.js

  - material-ui

    - https://github.com/mui-org/material-ui/tree/master/docs/src/pages/getting-started/templates/blog

- Reactの状態管理フレームワーク

  - Redux
    
    - https://github.com/reduxjs/redux/blob/master/examples/shopping-cart/src/reducers/products.js

コンポーネントフレームワーク外観 CSSレベルかCSSかつJSレベルかの2つ

  - https://www.newgenapps.com/blog/best-frameworks-to-create-responsive-websites/

  - https://dev.to/davidepacilio/35-free-react-templates-and-themes-32ci
  
  - https://www.codeinwp.com/blog/vue-ui-component-libraries/

調査実施手順

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

デフォはjavascript
$ npx create-react-app app --use-npm

or

$ npx create-react-app app --use-npm --template typescript

$ cd app

$ npm install @material-ui/core --save

$ npm install @material-ui/icons --save

$ mkdir -p src/components
```
