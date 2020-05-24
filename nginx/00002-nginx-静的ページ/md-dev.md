rootユーザーで起動

設定ファイル

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


プロセス起動

デフォルトは80使用

```
/etc/init.d/nginx start

ps uax

USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  19520  1716 pts/0    Ss   16:47   0:00 bash /etc/init/run.sh ubuntu
kuraine      7  0.0  0.0  19916  2292 pts/0    S+   16:47   0:00 bash
kuraine   1134  0.0  0.0  20016  2576 pts/1    Ss   17:08   0:00 /bin/bash
root      2896  0.0  0.0  54548  1840 pts/1    S    17:35   0:00 su root
root      2897  0.0  0.0  19916  2500 pts/1    S    17:35   0:00 bash
root      2933  0.0  0.0  33328   868 ?        Ss   17:35   0:00 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
nginx     2934  0.0  0.0  33724  1648 ?        S    17:35   0:00 nginx: worker process
root      2938  0.0  0.0  35548  1728 pts/1    R+   17:35   0:00 ps uax


$lsof -i:80
COMMAND  PID  USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
nginx   2933  root    6u  IPv4 1917247      0t0  TCP *:http (LISTEN)
nginx   2934 nginx    6u  IPv4 1917247      0t0  TCP *:http (LISTEN)
```

アクセス

```
$curl -i http://localhost:80/
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Sun, 24 May 2020 08:39:18 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Tue, 21 Apr 2020 12:43:12 GMT
Connection: keep-alive
ETag: "5e9eea60-264"
Accept-Ranges: bytes

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```


ページの置き場所

```
$ls-l /usr/share/nginx
total 20
drwxr-xr-x. 3 root root 4096  5月 24 17:16 ./
drwxr-xr-x. 1 root root 4096  5月 24 17:16 ../
drwxr-xr-x. 2 root root 4096  5月 24 17:16 html/

$ls -l /usr/share/nginx/html
total 20
drwxr-xr-x. 2 root root 4096  5月 24 17:16 ./
drwxr-xr-x. 3 root root 4096  5月 24 17:16 ../
-rw-r--r--. 1 root root  494  4月 21 21:43 50x.html
-rw-r--r--. 1 root root  612  4月 21 21:43 index.html
```

テストページ作成

```
mkdir -p /usr/share/nginx/html/{a..c}
echo A> /usr/share/nginx/html/a/a.html
echo B> /usr/share/nginx/html/b/b.html
echo C> /usr/share/nginx/html/c/c.html
```

アクセス

```
$curl -i http://localhost:80/a/a.html
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Sun, 24 May 2020 08:43:22 GMT
Content-Type: text/html
Content-Length: 2
Last-Modified: Sun, 24 May 2020 08:42:29 GMT
Connection: keep-alive
ETag: "5eca3375-2"
Accept-Ranges: bytes

A

$curl -i http://localhost:80/b/a.html
HTTP/1.1 404 Not Found
Server: nginx/1.18.0
Date: Sun, 24 May 2020 08:43:30 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive

<html>
<head><title>404 Not Found</title></head>
<body>
<center><h1>404 Not Found</h1></center>
<hr><center>nginx/1.18.0</center>
</body>
</html>

$curl -i http://localhost:80/b/b.html
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Sun, 24 May 2020 08:43:34 GMT
Content-Type: text/html
Content-Length: 2
Last-Modified: Sun, 24 May 2020 08:42:36 GMT
Connection: keep-alive
ETag: "5eca337c-2"
Accept-Ranges: bytes

B

$curl -i http://localhost:80/c/c.html
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Sun, 24 May 2020 08:43:39 GMT
Content-Type: text/html
Content-Length: 2
Last-Modified: Sun, 24 May 2020 08:42:43 GMT
Connection: keep-alive
ETag: "5eca3383-2"
Accept-Ranges: bytes

C
```

ログの確認

```
$cat /var/log/nginx/access.log
127.0.0.1 - - [24/May/2020:17:39:18 +0900] "GET / HTTP/1.1" 200 612 "-" "curl/7.58.0" "-"
127.0.0.1 - - [24/May/2020:17:43:22 +0900] "GET /a/a.html HTTP/1.1" 200 2 "-" "curl/7.58.0" "-"
127.0.0.1 - - [24/May/2020:17:43:30 +0900] "GET /b/a.html HTTP/1.1" 404 153 "-" "curl/7.58.0" "-"
127.0.0.1 - - [24/May/2020:17:43:34 +0900] "GET /b/b.html HTTP/1.1" 200 2 "-" "curl/7.58.0" "-"
127.0.0.1 - - [24/May/2020:17:43:39 +0900] "GET /c/c.html HTTP/1.1" 200 2 "-" "curl/7.58.0" "-"

$cat /var/log/nginx/error.log
2020/05/24 17:43:30 [error] 2934#2934: *3 open() "/usr/share/nginx/html/b/a.html" failed (2: No such file or directory), client: 127.0.0.1, server: localhost, request: "GET /b/a.html HTTP/1.1", host: "localhost"
```

プロセス停止


```
$/etc/init.d/nginx stop
$ps uax
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  19520  1716 pts/0    Ss   16:47   0:00 bash /etc/init/run.sh ubuntu
kuraine      7  0.0  0.0  19916  2292 pts/0    S+   16:47   0:00 bash
kuraine   1134  0.0  0.0  20016  2576 pts/1    Ss   17:08   0:00 /bin/bash
root      2896  0.0  0.0  54548  1840 pts/1    S    17:35   0:00 su root
root      2897  0.0  0.0  20024  2576 pts/1    S    17:35   0:00 bash
root      3077  0.0  0.0  35548  1728 pts/1    R+   17:45   0:00 ps uax
```


デフォルトから設定変えた


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

    log_format main '$remote_addr - $remote_user [$time_local] '
                           '"$request" $status $bytes_sent '
                           '"$http_referer" "$http_user_agent" "$gzip_ratio"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;


    server {
      listen       8888;
      server_name  nnn;
      root /var/www/html;

      access_log  /var/log/nginx/nnn-access.log  main;
      error_log  /var/log/nginx/nnn-error.log warn;

      error_page 400 401 402 403 404 /40X.html;
      location /40X.html {
          root /var/www/html/error-pages;
      }

      error_page 500 502 503 504 /50X.html;
      location /50X.html {
          root /var/www/html/error-pages;
      }
    }

    #gzip  on;

    #include /etc/nginx/conf.d/*.conf;
}
```


ページ作成

```
mkdir -p  /var/www/html
mkdir -p  /var/www/html/error-pages


mkdir -p /var/www/html/{a..c}

echo A> /var/www/html/a/a.html
echo B> /var/www/html/b/b.html
echo C> /var/www/html/c/c.html



echo 40Xだよーん> /var/www/html/error-pages/40X.html


echo 50Xだよーん> /var/www/html/error-pages/50X.html
```

```
$lsof -P -i:8080
COMMAND  PID  USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
nginx   3551  root    8u  IPv4 1966023      0t0  TCP *:8080 (LISTEN)
nginx   3552 nginx    8u  IPv4 1966023      0t0  TCP *:8080 (LISTEN)
```

アクセス

500番をだしたいためにcgi用意したがうまくできぬか

```
$curl -i http://localhost:8888/a/a.html
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Sun, 24 May 2020 12:15:54 GMT
Content-Type: text/html
Content-Length: 2
Last-Modified: Sun, 24 May 2020 12:15:03 GMT
Connection: keep-alive
ETag: "5eca6547-2"
Accept-Ranges: bytes

A
$curl -i http://localhost:8888/b/b.html
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Sun, 24 May 2020 12:15:59 GMT
Content-Type: text/html
Content-Length: 2
Last-Modified: Sun, 24 May 2020 12:15:03 GMT
Connection: keep-alive
ETag: "5eca6547-2"
Accept-Ranges: bytes

B
$curl -i http://localhost:8888/c/c.html
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Sun, 24 May 2020 12:16:03 GMT
Content-Type: text/html
Content-Length: 2
Last-Modified: Sun, 24 May 2020 12:15:03 GMT
Connection: keep-alive
ETag: "5eca6547-2"
Accept-Ranges: bytes

C
$curl -i http://localhost:8888/d/c.html
HTTP/1.1 404 Not Found
Server: nginx/1.18.0
Date: Sun, 24 May 2020 12:16:09 GMT
Content-Type: text/html
Content-Length: 16
Connection: keep-alive
ETag: "5eca6547-10"

40Xだよーん
```

ディレクトリこうぞうなど

```
$tree -ug /var/www
/var/www
├── [www-data www-data]  cgi-bin
│   ├── [www-data www-data]  a.sh
│   └── [www-data www-data]  error-page
│       ├── [www-data www-data]  40X.html
│       └── [www-data www-data]  50X.html
└── [root     root    ]  html
    ├── [root     root    ]  a
    │   └── [root     root    ]  a.html
    ├── [root     root    ]  b
    │   └── [root     root    ]  b.html
    ├── [root     root    ]  c
    │   └── [root     root    ]  c.html
    └── [root     root    ]  error-pages
        ├── [root     root    ]  40X.html
        └── [root     root    ]  50X.html

7 directories, 8 files
```

ログ確認

```
$ls -l /var/log/nginx/*
-rw-r-----. 1 nginx adm    0  5月 24 21:14 /var/log/nginx/access.log
-rw-r-----. 1 nginx adm    0  5月 24 21:14 /var/log/nginx/error.log
-rw-r--r--. 1 root  root 392  5月 24 21:16 /var/log/nginx/nnn-access.log
-rw-r--r--. 1 root  root 203  5月 24 21:16 /var/log/nginx/nnn-error.log

$cat /var/log/nginx/nnn-access.log
127.0.0.1 - - [24/May/2020:21:15:54 +0900] "GET /a/a.html HTTP/1.1" 200 236 "-" "curl/7.58.0" "-"
127.0.0.1 - - [24/May/2020:21:15:59 +0900] "GET /b/b.html HTTP/1.1" 200 236 "-" "curl/7.58.0" "-"
127.0.0.1 - - [24/May/2020:21:16:03 +0900] "GET /c/c.html HTTP/1.1" 200 236 "-" "curl/7.58.0" "-"
127.0.0.1 - - [24/May/2020:21:16:09 +0900] "GET /d/c.html HTTP/1.1" 404 191 "-" "curl/7.58.0" "-"

$cat /var/log/nginx/nnn-error.log
2020/05/24 21:16:09 [error] 3890#3890: *4 open() "/var/www/html/d/c.html" failed (2: No such file or directory), client: 127.0.0.1, server: nnn, request: "GET /d/c.html HTTP/1.1", host: "localhost:8888"
```
