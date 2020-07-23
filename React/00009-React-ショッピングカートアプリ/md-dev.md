```
- https://www.youtube.com/watch?v=wPQ1-33teR4

- https://github.com/john-smilga/setup-filese-react-phone-e-commerce-project

- https://github.com/sarkhanrasullu/react-store-app/

$ mkdir -p 00009-React-ショッピングカートアプリ

$ cd 00009-React-ショッピングカートアプリ

$ npx create-react-app my-app --use-npm --template typescript

$ cd my-app/

$ npm start

$ code .


$ chrome http://localhost:3000/

$ firefox http://localhost:3000/

CSSプラグインインストール

$ npm install --save bootstrap

フォントのリンク先を取得

- https://fonts.google.com/specimen/Permanent+Marker?query=perma&sidebar.open&selection.family=Permanent+Marker#standard-styles

```
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
```

ページフォントを取得

- https://fontawesome.com/



コンポーネント作成
$ mkdir -p src/components

$ touch src/components/NavBar.tsx

$ touch src/components/Product.tsx

$ touch src/components/ProductList.tsx

$ touch src/components/Cart.tsx

$ touch src/components/Details.tsx

$ touch src/components/Default.tsx


ルーティング入れるため、いんすこ
$ npm install --save react-router-dom

型定義いんすこ
$ npm install --save @types/react-router-dom


CSSレンダリングのため
- https://styled-components.com/

$ npm install --save styled-components
$ npm install --save @types/styled-components


ボタンのCSSコンポーネント
$ touch src/components/ButtonContainer.tsx

$ touch src/components/Title.tsx

$ touch src/components/ProductContextWrapper.tsx

$ touch src/components/Modal.tsx

$ mkdir -p  src/components/Cart

$ touch src/components/Cart/Cart.tsx

ディレクトリ内の起動エントリを定義するために作成
$ touch src/components/Cart/package.json

カート実装の詰め込み
$ touch src/components/Cart/CartColumns.tsx

$ touch src/components/Cart/EmptyCart.tsx


$ touch src/components/Cart/CartList.tsx


$ touch src/components/Cart/CartItem.tsx

$ touch src/components/Cart/CartTotals.tsx

PayPalで支払い決済機能を追加

$ npm install --save react-paypal-express-checkout

- https://www.npmjs.com/package/react-paypal-express-checkout

型定義内から、素のやつで作成
$ touch src/components/Cart/PayPalButton.js

課題
paypalの決済はfirebaseなどに移譲したほうがよさげ


Reactはクラス単位かファンクション単位で管理できるが、historyのブラウザオブジェク卜をどちらで保持できるかがボトルネックになりそう
```
