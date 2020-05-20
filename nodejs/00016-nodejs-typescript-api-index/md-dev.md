https://future-architect.github.io/typescript-guide/ecosystem.html

https://qiita.com/pochopocho13/items/79a4735031ce11a91df7

https://github.com/peperonX/mywebapi/blob/master/01_hello/index.js


```
cd ~/script-sketch/nodejs

mkdir -p 00016-nodejs-typescript-api-index

npm init -y

npm install --save-dev ts-node typescript

cat <<EOS >tsconfig.json
{
  "compilerOptions": {
    "esModuleInterop": true
  }
}
EOS

touch index.ts

npm install --save-dev express
npm install --save-dev @types/express

```

ポートオープン

標準出力やエラー出力などをポコってわいてくるのも含めて沈下させるには標準入力にnullデバイスファイルを与える

```
$npx ts-node index.ts 1>/dev/null 2>&1 </dev/null &
[1] 11126

$lsof -i:3000
COMMAND   PID    USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
node    11126 kuraine   18u  IPv6 40939445      0t0  TCP *:3000 (LISTEN)

```

コマンドラインよりアクセス

```
$curl -i http://localhost:3000/
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 24
ETag: W/"18-P9PwDyoaQJEFCg1jgCKbjJl71yU"
Date: Wed, 20 May 2020 16:11:20 GMT
Connection: keep-alive

ハロー・ワールドkuraine doc-ubuntu-19-10-go-vscode ~/script-sketch/nodejs/00016-nodejs-typescript-api-index$
```

ブラウザよりアクセス

http://localhost:3000/
