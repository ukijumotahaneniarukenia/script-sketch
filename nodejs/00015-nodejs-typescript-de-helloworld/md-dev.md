- https://future-architect.github.io/typescript-guide/ecosystem.html

初期セットアップ

```
cd ~/script-sketch/nodejs
mkdir -p 00015-nodejs-typescript-de-helloworld

npm init -y

npm install --save-dev ts-node typescript
```


```
$ls -l
total 24
drwxr-xr-x.  3 kuraine kuraine 4096  5月 21 00:13 ./
drwxr-xr-x.  7 kuraine kuraine 4096  5月 21 00:11 ../
-rw-r--r--.  1 kuraine kuraine   64  5月 21 00:15 helloworld.ts
drwxr-xr-x. 12 kuraine kuraine 4096  5月 21 00:13 node_modules/
-rw-r--r--.  1 kuraine kuraine 2810  5月 21 00:13 package-lock.json
-rw-r--r--.  1 kuraine kuraine  332  5月 21 00:13 package.json
```

実行

```
$npm start helloworld.ts
npm ERR! missing script: start

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/kuraine/.npm/_logs/2020-05-20T15_18_38_768Z-debug.log
```

これならいける

```
$npx ts-node helloworld.ts
ハローワールド
```

package.jsonファイルに以下を追加

```
"scripts": {
  "start": "ts-node"
}
```


追加後

```
{
  "name": "00015-nodejs-typescript-de-helloworld",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "ts-node": "^8.10.1",
    "typescript": "^3.9.3"
  },
  "scripts":{
    "start":"ts-node"
  }
}
```

```
$npm start helloworld.ts

> 00015-nodejs-typescript-de-helloworld@1.0.0 start /home/kuraine/script-sketch/nodejs/00015-nodejs-typescript-de-helloworld
> ts-node "helloworld.ts"

ハローワールド
```
