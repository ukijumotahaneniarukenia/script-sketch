- https://www.youtube.com/watch?v=wPQ1-33teR4

- https://github.com/john-smilga/setup-filese-react-phone-e-commerce-project

```
$ mkdir -p 00009-React-ショッピングカートアプリ

$ cd 00009-React-ショッピングカートアプリ

$ npx create-react-app my-app --use-npm --template typescript

$ cd my-app/

$ npm start

$ code .


$ chrome http://localhost:3000/

$ firefox http://localhost:3000/
```


CSSプラグインインストール

```
$ npm install --save bootstrap
```


フォントのリンク先を取得

- https://fonts.google.com/specimen/Permanent+Marker?query=perma&sidebar.open&selection.family=Permanent+Marker#standard-styles

```
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
```

ページフォントを取得

- https://fontawesome.com/



コンポーネント作成

```
$ mkdir -p src/components

$ touch src/components/NavBar.tsx

$ touch src/components/Product.tsx

$ touch src/components/ProductList.tsx

$ touch src/components/Cart.tsx

$ touch src/components/Details.tsx

$ touch src/components/Default.tsx
```

ルーティング入れるため、いんすこ

```
$ npm install --save react-router-dom

型定義いんすこ
$ npm install --save @types/react-router-dom
```
