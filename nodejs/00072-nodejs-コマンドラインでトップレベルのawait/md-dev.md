- https://v8.dev/features/top-level-await

- https://stackoverflow.com/questions/46515764/how-can-i-use-async-await-at-the-top-level

- https://stackoverflow.com/questions/59585793/top-level-await-doesnt-work-in-the-latest-node-js

- https://dev.to/mikeesto/top-level-await-in-node-2jad

デフォルトだと許可されていないが
```
$ node a.js
/home/aine/script-sketch/nodejs/00072-nodejs-コマンドラインでトップレベルのawait/a.js:1
await Promise.resolve(console.log("うんこ"));
^^^^^

SyntaxError: await is only valid in async function
    at wrapSafe (internal/modules/cjs/loader.js:979:16)
    at Module._compile (internal/modules/cjs/loader.js:1027:27)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1092:10)
    at Module.load (internal/modules/cjs/loader.js:928:32)
    at Function.Module._load (internal/modules/cjs/loader.js:769:14)
    at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:72:12)
    at internal/main/run_main_module.js:17:47
```

スクリプトの同一階層にpackage.jsonがあると実行できる

```
$ cat package.json
{
  "type": "module"
}

$ node a.js
うんこ
```


ワンライナーで書くとこう

```
$ node -e 'await Promise.resolve(console.log("うんこ"));' --experimental-modules --input-type=module --harmony-top-level-await
うんこ
```

スクリプトをimportして使うとこう

```
$ node -e 'import("./a.js")' --experimental-modules --input-type=module --harmony-top-level-await
うんこ
```
