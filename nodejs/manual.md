# Mysqlに接続
https://kaworu.jpn.org/javascript/node.jsでMySQLに接続する

http://www.tohoho-web.com/ex/nodejs.html

配列操作

https://qiita.com/rana_kualu/items/24e5b6009ad831102db4#5-convert-array-to-an-object

# json-serverプロセス起動

REST API作成捗る

https://www.webprofessional.jp/mock-rest-apis-using-json-server/ </br>
https://app.codegrid.net/entry/2017-json-server-1 </br>


標準入力に/dev/null与えるとバッググランド実行になる
https://blog.prophet.jp/1232</br>


```
$npm init --yes
Wrote to /home/kuraine/script_scratch/node/package.json:

{
  "name": "node",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}

$ls
package.json

グローバルにいんすこするときはrootユーザで。
$sudo npm install -g json-server
/usr/bin/json-server -> /usr/lib/node_modules/json-server/lib/cli/bin.js
+ json-server@0.15.1
added 237 packages from 128 contributors in 9.606s

$which json-server
/usr/bin/json-server

テストデータ
$cat db.json
{
  "movies": [
    {"id": 1, "name": "The Godfather", "director":"Francis Ford Coppola", "rating": 9.1},
    {"id": 2, "name": "Casablanca", "director": "Michael Curtiz", "rating": 8.8}
  ]
}



$json-server --watch db.json 1>$(pwd)/launch_json-server.log 2>&1 </dev/null &
[1] 20479
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14376  1828 pts/0    Ss+  09:27   0:00 /bin/bash
kuraine  20153  0.0  0.0  14512  2280 pts/1    Ss   15:56   0:00 /bin/bash
kuraine  20380  0.0  0.0  14380  2104 pts/2    Ss+  16:15   0:00 /bin/bash
kuraine  20479  2.4  0.0 685072 31396 pts/1    Sl   16:30   0:00 node /usr/bin/json-server --watch db.json
kuraine  20491  0.0  0.0  54296  1860 pts/1    R+   16:30   0:00 ps aux

$tail $(pwd)/launch_json-server.log

  Resources
  http://localhost:3000/movies

  Home
  http://localhost:3000

  Type s + enter at any time to create a snapshot of the database
  Watching...

APIたたく
$curl -X GET "http://localhost:3000/movies"
[
  {
    "id": 1,
    "name": "The Godfather",
    "director": "Francis Ford Coppola",
    "rating": 9.1
  },
  {
    "id": 2,
    "name": "Casablanca",
    "director": "Michael Curtiz",
    "rating": 8.8
  }
]
```

# ライブラリいんすこ手順
https://teratail.com/questions/170515

```
# こうするとディレクトリ名や.gitの状態に応じてふさわしい空のpackage.jsonを生成してくれる
$ npm init --yes

$ ls
package.json

# 改めてインストール
$ npm install bitcore-lib-cash

$ ls
node_modules/ package.json
# 多分lockファイルも生成されてると思うけど

# package.jsonを開いて見れば、dependencesという依存モジュールの欄にbitcore-lib-cashが存在する事を確認できる
$ cat package.json

# node_modules配下をGitの管理外にしておく
$ echo "node_modules/*" > .gitignore

# 次からはnpm installだけでdependences対象のbitcore-lib-cashがインストールされる
$ npm install
```
