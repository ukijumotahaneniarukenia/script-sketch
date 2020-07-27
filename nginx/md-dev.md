- https://qiita.com/MuuKojima/items/afc0ad8309ba9c5ed5ee
- https://www.nginx.com/resources/wiki/start/topics/tutorials/install/


# nginxプロセス起動

systemdコマンド使えないので、泥臭く。

nginxプロセス起動。rootユーザで実行。
```
$sudo /usr/sbin/nginx
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
nginx        1  0.0  0.0  42688  1564 pts/0    Ss+  00:29   0:00 /usr/sbin/init
nginx        6  0.0  0.0  14376  2060 pts/1    Ss   00:29   0:00 /bin/bash
root       288  0.0  0.0  46448   976 ?        Ss   00:42   0:00 nginx: master process /usr/sbin/nginx
nginx      289  0.0  0.0  46860  1928 ?        S    00:42   0:00 nginx: worker process
nginx      290  0.0  0.0  54296  1868 pts/1    R+   00:43   0:00 ps aux
```

confファイルを引数に渡して実行するときは以下のように。
```
$sudo /usr/sbin/nginx -c /etc/nginx/nginx.conf
```

最初のconfファイルの設定は以下。

プロセスをいい感じに負荷分散するような設定と同時アクセス数の閾値、
nginxサーバーが返却するファイルのデフォルトのMIMEタイプ等を設定している模様。
あとはログファイルの場所とセッション時間など。

リバースプロキシ設定で何かやってみる。

```
$cat /etc/nginx/nginx.conf

user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```

アクセス前のログ

権限関連で、削除は出来ぬようになっている。

```
$ll /var/log/nginx/*
-rw-r-----. 1 nginx adm 0  1月  5 00:40 /var/log/nginx/access.log
-rw-r-----. 1 nginx adm 0  1月  5 00:41 /var/log/nginx/error.log
```

待ち受けポート
```
$lsof -i:80
COMMAND PID  USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
nginx   289 nginx    6u  IPv4 3872312      0t0  TCP *:http (LISTEN)
```

# ブラウザよりサービス起動確認
```
http://192.168.1.109:8080
```

![](./1.png)

アクセス後のログ

```
$ll /var/log/nginx/*
-rw-r-----. 1 nginx adm 324  1月  5 00:44 /var/log/nginx/access.log
-rw-r-----. 1 nginx adm 458  1月  5 00:44 /var/log/nginx/error.log

$cat /var/log/nginx/access.log
192.168.1.109 - - [05/Jan/2020:00:44:53 +0900] "GET /adminer.php HTTP/1.1" 404 153 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" "-"
192.168.1.109 - - [05/Jan/2020:00:44:53 +0900] "GET /favicon.ico HTTP/1.1" 404 153 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" "-"

$cat /var/log/nginx/error.log
2020/01/05 00:44:53 [error] 289#289: *1 open() "/usr/share/nginx/html/adminer.php" failed (2: No such file or directory), client: 192.168.1.109, server: localhost, request: "GET /adminer.php HTTP/1.1", host: "192.168.1.109:8080"
2020/01/05 00:44:53 [error] 289#289: *1 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 192.168.1.109, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "192.168.1.109:8080"
```

資産の配備場所

```
$ll /usr/share/nginx/html/*
-rw-r--r--. 1 root root 494  8月 14 00:04 /usr/share/nginx/html/50x.html
-rw-r--r--. 1 root root 612  8月 14 00:04 /usr/share/nginx/html/index.html
```

てすと

rootユーザーしか触れぬようになっているので、rootユーザで作業

```
$sudo mkdir -p /usr/share/nginx/html/nnn

$sudo cp /usr/share/nginx/html/index.html /usr/share/nginx/html/nnn/test.html

$cat /usr/share/nginx/html/nnn/test.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to 💞</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to うんこ💞</h1>
<p>賣んこｳﾝｺうんんんんUNKO</p>
</body>
</html>
```


ブラウザよりアクセス
```
http://192.168.1.109:8080/nnn/test.html
```

![](./2.png)


アクセス後のログ

```
$cat /var/log/nginx/access.log
192.168.1.109 - - [05/Jan/2020:00:44:53 +0900] "GET /adminer.php HTTP/1.1" 404 153 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" "-"
192.168.1.109 - - [05/Jan/2020:00:44:53 +0900] "GET /favicon.ico HTTP/1.1" 404 153 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" "-"
192.168.1.109 - - [05/Jan/2020:00:49:50 +0900] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" "-"
192.168.1.109 - - [05/Jan/2020:00:53:40 +0900] "GET /nnn/test.html HTTP/1.1" 200 307 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" "-"
```

# nginxプロセス停止

masterプロセスに紐づくプロセスをkillすれば、派生したworkerプロセスもkillされる。

```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
nginx        1  0.0  0.0  42688  1564 pts/0    Ss+  00:29   0:00 /usr/sbin/init
nginx        6  0.0  0.0  14376  2096 pts/1    Ss   00:29   0:00 /bin/bash
root       288  0.0  0.0  46448   976 ?        Ss   00:42   0:00 nginx: master process /usr/sbin/nginx
nginx      289  0.0  0.0  46860  2164 ?        S    00:42   0:00 nginx: worker process
nginx      524  0.0  0.0  54296  1872 pts/1    R+   00:55   0:00 ps aux
$sudo kill 288
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
nginx        1  0.0  0.0  42688  1564 pts/0    Ss+  00:29   0:00 /usr/sbin/init
nginx        6  0.0  0.0  14376  2096 pts/1    Ss   00:29   0:00 /bin/bash
nginx      527  0.0  0.0  54296  1856 pts/1    R+   00:55   0:00 ps aux
```

# ログリフレ

無にする

flutendと絡めるときはローテして日ごとにフォルダ切って移動させる

```
$>/var/log/nginx/access.log
$>/var/log/nginx/error.log
$ll /var/log/nginx/*
-rw-r-----. 1 nginx adm 0  1月  5 00:40 /var/log/nginx/access.log
-rw-r-----. 1 nginx adm 0  1月  5 00:41 /var/log/nginx/error.log
```

