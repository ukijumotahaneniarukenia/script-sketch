# 001
- 事象
  - 以前コミットしたnuxtjs製アプリが動かない

- 原因
  - Error: No ESLint configuration found.

- 対策
  - 足りない設定ファイルを追加する
  - 今回の場合は.eslintrc.jsファイルのみのマージだけで、前回と再現が取れた
```
kuraine@592a267eced0 ~/script-sketch/nuxtjs$diff test test2
Only in test2: .editorconfig
Only in test2: .eslintrc.js
```

```
cp test2/.eslintrc.js test/.eslintrc.js
```

```
kuraine@592a267eced0 ~/script-sketch/nuxtjs/test2$ll .eslintrc.js
-rw-r--r--. 1 kuraine kuraine 484  2月 23 14:41 .eslintrc.js
kuraine@592a267eced0 ~/script-sketch/nuxtjs/test2$cat .eslintrc.js
module.exports = {
  root: true,
  env: {
    browser: true,
    node: true
  },
  parserOptions: {
    parser: 'babel-eslint'
  },
  extends: [
    // https://github.com/vuejs/eslint-plugin-vue#priority-a-essential-error-prevention
    // consider switching to `plugin:vue/strongly-recommended` or `plugin:vue/recommended` for stricter rules.
    'plugin:vue/essential'
  ],
  // required to lint *.vue files
  plugins: [
    'vue'
  ],
  // add your custom rules here
  rules: {}
}
```
- 予防
  - 同じ手順に沿って新規でアプリ作成し、diff取ってどちらか一方にしかないファイルに検討をつけて、差分更新し、原因のファイル名を突き止める
