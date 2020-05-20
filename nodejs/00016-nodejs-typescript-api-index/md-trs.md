- 事象

```
⨯ Unable to compile TypeScript:
index.ts:1:8 - error TS1259: Module '"/home/kuraine/script-sketch/nodejs/00016-nodejs-typescript-kankeinaikedo-api-index/node_modules/@types/express/index"' can only be default-imported using the 'esModuleInterop' flag

1 import express from 'express'
         ~~~~~~~

  node_modules/@types/express/index.d.ts:116:1
    116 export = e;
        ~~~~~~~~~~~
    This module is declared with using 'export =', and can only be used with a default import when using the 'esModuleInterop' flag.

```


- 原因

  コンパイルオプションがない


- 対処

tsconfig.jsonファイルに以下を追記


```
{
  "compilerOptions": {
    "esModuleInterop": true
  }
}
```


- 予防

デフォでつくっておく
