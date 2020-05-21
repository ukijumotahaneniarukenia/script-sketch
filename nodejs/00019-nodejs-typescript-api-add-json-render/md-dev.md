```
$npm install --save-dev multer uuid
$npm install --save-dev @types/multer @types/uuid
```

こうやってうまくインテリセンス効いてくれんときはワークディレクトリに移動して

と打ってvscodeを再起動する

カレントディレクトリをマウントして起動する

```
$code .
```

POSTデータ処理用にインストール

```
$npm install --save-dev body-parser

$npm install --save-dev @types/body-parser

```

サーバープロセス起動

```
$npx ts-node index.ts
Listening on port 3000
Add: {"id":"f084ee42-2443-4bbc-92c4-49623be41446","title":"aaaaa","done":false}
^C
```

ブラウザからアクセス

http://localhost:3000/
