- https://github.com/reduxjs/redux/blob/master/examples/counter/public/index.html

```

振る舞いを定義した関数のアクションパターンごとに応じた振る舞いを定義したのち、
コンポーネントのProps（引数に）状態を更新したいインスタンスと状態の振る舞いを定義した関数を渡すことで、ページ間での状態管理を実現している

これは各関数を作成したあと、各関数の呼び出しパターンをswicth文で制御する感覚と似ている。
swicth文で呼び出すときに引数に同じインスタンスを与える感覚と似ている。戻り値は呼び出し先の関数に依存する感じ。

$ mkdir -p 00001-React-Reduxで状態管理

$ cd 00001-React-Reduxで状態管理

$ npx create-react-app app --use-npm

$ cd app

$ npm install --save redux

$ npm install --save react-redux

$ mkdir -p src/components

$ touch src/components/Counter.js

$ mkdir -p src/reducers

$ touch src/components/CounterActionPattern.js

$ rm src/App.css src/App.js src/App.test.js
```
