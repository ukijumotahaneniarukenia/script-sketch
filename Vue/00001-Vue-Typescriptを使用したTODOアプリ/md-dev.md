VueとTypescriptでCRUDアプリ作成チュートリアル

- https://bezkoder.com/vue-typescript-crud/ これだめだけど、雰囲気分かった

```
  - Vueコマンドラインをインストール
    - https://jp.vuejs.org/v2/guide/installation.html
    - https://qiita.com/567000/items/dde495d6a8ad1c25fa43

$ sudo npm install -g @vue/cli

$ mkdir -p 00001-Vue-Typescriptを使用したTODOアプリ

$ vue create my-app

Vue CLI v4.4.6
? Please pick a preset: Manually select features
? Check the features needed for your project: Babel, TS
? Use class-style component syntax? Yes
? Use Babel alongside TypeScript (required for modern mode, auto-detected polyfills, transpiling JSX)? Yes
? Where do you prefer placing config for Babel, ESLint, etc.? In package.json
? Save this as a preset for future projects? No

🎉  Successfully created project my-app.
👉  Get started with the following commands:

$ cd my-app

$ npm run serve

$ firefox http://localhost:8080/

$ chrome http://localhost:8080/


ルーティングライブラリを追加
$ npm install --save vue-router


$ mkdir -p src/router

$ touch src/router/Router.ts


モデルのロジック実装ライブラリの追加
$ npm install --save axios

$ mkdir -p src/services

$ touch src/http-common.ts

$ touch src/services/TutorialDataService.ts

$ touch src/components/AddTutorial.vue

$ touch src/components/TutorialsList.vue

$ touch src/components/Tutorial.vue

$ touch vue.config.js

$ cd my-app

$ npm run serve

$ firefox http://localhost:8080/

$ chrome http://localhost:8080/

$ rm src/components/HelloWorld.vue
```
