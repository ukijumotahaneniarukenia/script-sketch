```

$npx ts-node index.ts 1>/dev/null 2>&1 </dev/null &
[1] 12625

$lsof -i:3000
COMMAND   PID    USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
node    12625 kuraine   18u  IPv6 40981368      0t0  TCP *:3000 (LISTEN)

$ps uax | grep npx | grep -v grep
kuraine  12625  9.6  0.3 698964 121596 pts/2   Sl   01:24   0:02 node /bin/npx ts-node index.ts


$curl -i http://localhost:3000/api/v1/list
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: application/json; charset=utf-8
Content-Length: 152
ETag: W/"98-MZefXjELYo/mwB38Ys+Y0QLajD8"
Date: Wed, 20 May 2020 16:25:40 GMT
Connection: keep-alive

[{"title":"うんこ","done":true},{"title":"もりもり","done":false},{"title":"森鴎外","done":false},{"title":"うんどろめだ","done":false}]kuraine doc-ubuntu-19-10-go-vscode ~/script-sketch/nodejs/00017-nodejs-typescript-api-index-json$


$curl -s http://localhost:3000/api/v1/list | jq
[
  {
    "title": "うんこ",
    "done": true
  },
  {
    "title": "もりもり",
    "done": false
  },
  {
    "title": "森鴎外",
    "done": false
  },
  {
    "title": "うんどろめだ",
    "done": false
  }
]


#前回分のプロセス起動していると先がちでそっち見に行っちゃうから、けしとく

$sudo kill -9 12625
```
