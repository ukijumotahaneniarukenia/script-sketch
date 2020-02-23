- 

```
kuraine@592a267eced0 ~/script-sketch/nuxtjs$diff test test2
Only in test2: .editorconfig
Only in test2: .eslintrc.js
Common subdirectories: test/.nuxt and test2/.nuxt
diff test/README.md test2/README.md
1c1
< # test
---
> # test2
Common subdirectories: test/assets and test2/assets
Common subdirectories: test/components and test2/components
diff test/launch-nuxtjs.log test2/launch-nuxtjs.log
2c2
< > test@1.0.0 dev /home/kuraine/script-sketch/nuxtjs/test
---
> > test2@1.0.0 dev /home/kuraine/script-sketch/nuxtjs/test2
12,30c12,30
< ✔ Server: Compiled successfully in 2.21s
< ✔ Client: Compiled with some errors in 2.48s
< 
<  ERROR  Failed to compile with 1 errors
< 
< Module build failed (from ./node_modules/eslint-loader/index.js):
< Error: No ESLint configuration found.
<     at Config.getLocalConfigHierarchy (/home/kuraine/script-sketch/nuxtjs/test/node_modules/eslint/lib/config.js:255:39)
<     at Config.getConfigHierarchy (/home/kuraine/script-sketch/nuxtjs/test/node_modules/eslint/lib/config.js:179:43)
<     at Config.getConfigVector (/home/kuraine/script-sketch/nuxtjs/test/node_modules/eslint/lib/config.js:286:21)
<     at Config.getConfig (/home/kuraine/script-sketch/nuxtjs/test/node_modules/eslint/lib/config.js:329:29)
<     at processText (/home/kuraine/script-sketch/nuxtjs/test/node_modules/eslint/lib/cli-engine.js:163:33)
<     at CLIEngine.executeOnText (/home/kuraine/script-sketch/nuxtjs/test/node_modules/eslint/lib/cli-engine.js:620:17)
<     at lint (/home/kuraine/script-sketch/nuxtjs/test/node_modules/eslint-loader/index.js:278:17)
<     at Object.module.exports (/home/kuraine/script-sketch/nuxtjs/test/node_modules/eslint-loader/index.js:273:21)
< 
< You may use special comments to disable some warnings.
< Use // eslint-disable-next-line to ignore the next line.
< Use /* eslint-disable */ to ignore all warnings in a file.
---
> ✔ Server: Compiled successfully in 1.47s
> ✔ Client: Compiled successfully in 1.73s
> ℹ Waiting for file changes
> ℹ Memory usage: 134 MB (RSS: 213 MB)
> ↻ Updated pages/index.vue
> ℹ Compiling Server
> ℹ Compiling Client
> ✔ Server: Compiled successfully in 386.80ms
> ✔ Client: Compiled successfully in 356.57ms
> ↻ Updated nuxt.config.js
> ℹ Listening on: http://172.17.0.2:3000/
> ℹ Preparing project for development
> ℹ Initial build may take a while
> ✔ Builder initialized
> ✔ Nuxt files generated
> ℹ Compiling Client
> ℹ Compiling Server
> ✔ Server: Compiled successfully in 1.28s
> ✔ Client: Compiled successfully in 1.45s
32c32
< ℹ Memory usage: 175 MB (RSS: 234 MB)
---
> ℹ Memory usage: 164 MB (RSS: 229 MB)
Common subdirectories: test/layouts and test2/layouts
Common subdirectories: test/middleware and test2/middleware
Common subdirectories: test/node_modules and test2/node_modules
diff test/package-lock.json test2/package-lock.json
2c2
<   "name": "test",
---
>   "name": "test2",
diff test/package.json test2/package.json
2c2
<   "name": "test",
---
>   "name": "test2",
Common subdirectories: test/pages and test2/pages
Common subdirectories: test/plugins and test2/plugins
Common subdirectories: test/static and test2/static
Common subdirectories: test/store and test2/store
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


```
cp test2/.eslintrc.js test/.eslintrc.js
```


```
kuraine@592a267eced0 ~/script-sketch/nuxtjs/test2$ll .editorconfig
-rw-r--r--. 1 kuraine kuraine 207  2月 23 14:41 .editorconfig
kuraine@592a267eced0 ~/script-sketch/nuxtjs/test2$cat .editorconfig
# editorconfig.org
root = true

[*]
indent_size = 2
indent_style = space
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.md]
trim_trailing_whitespace = false
```
