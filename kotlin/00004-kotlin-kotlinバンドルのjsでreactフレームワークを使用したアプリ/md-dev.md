- https://play.kotlinlang.org/hands-on/Building%20Web%20Applications%20with%20React%20and%20Kotlin%20JS/02_Setting_up

ideaでインポート マウントに５分かかった

firefoxとjdk11必要

```
$ apt install -y firefox

$ jdk必要
```


```
$ cd web-app-react-kotlin-js-gradle/


なにがしか詰まったらbuildデイレクトリごと削除
$ rm -rf build
```


フォアグランド起動

動作確認はこっちでいい

```
$ ./gradlew browserDevelopmentRun --continuous 1>launch-kotlin-js-gradle-web.log 2>&1 </dev/null
```

バッググランド起動

デプロイはこっち

```
$ ./gradlew browserDevelopmentRun --continuous 1>launch-kotlin-js-gradle-web.log 2>&1 </dev/null &
```


ポートはdockerコンテナ内で完結できたので、外部に公開する必要はない。EXPOSEする必要はない。

```
$ lsof -P -i:8080
COMMAND   PID    USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
node    10051 kuraine   18u  IPv4 17793462      0t0  TCP localhost:8080 (LISTEN)
```



ブラウザよりアクセス

firefoxあれば、自動的に立ち上がる

```
$ http://localhost:8080
```

```
$ curl -i http://localhost:8080
HTTP/1.1 200 OK
X-Powered-By: Express
Accept-Ranges: bytes
Cache-Control: public, max-age=0
Last-Modified: Sat, 30 May 2020 08:45:40 GMT
ETag: W/"cc-17264c21694"
Content-Type: text/html; charset=UTF-8
Content-Length: 204
Date: Sat, 30 May 2020 08:47:47 GMT
Connection: keep-alive

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello, Kotlin/JS!</title>
</head>
<body>
    <div id="root"></div>
    <script src="confexplorer.js"></script>
</body>
</html>
```



プロセスの停止

```
$ ps uax | grep jdk-11 | grep -v grep | awk '{print $2}' | xargs -n1 kill -9


$ ps uax | grep nodejs | grep -v grep | awk '{print $2}' | xargs -n1 kill -9

```
