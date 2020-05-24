以下の作業はすべｔrootユーザー

nginxのインストール

```
bash /usr/local/src/script-repo/ubuntu-18-04-install-nginx.sh
```


CGIファイル格納ディレクトリの作成

cgiスクリプトの実行ユーザーがwww-dataなので、配下全てその人の持ち物にしておく

fcgiソフトのインストールでwww-dataユーザーないしグループが自動で追加される

```
mkdir -p /var/www/cgi-bin
chown -R www-data:www-data /var/www/cgi-bin
```

CGI側の設定ファイル

特に修正せず

```
vi /etc/init.d/fcgiwrap
```


NGINX側の設定ファイル

CGI個別用にディレクティブ設定ファイルを切り出す

```
cat <<EOS >/etc/nginx/conf.d/cgi-bash.conf
server {
    listen       8888;
    server_name  localhost;

    location ~ \.(pl|sh|cgi)$ {
      root   /var/www/cgi-bin;
      fastcgi_pass      unix:/var/run/fcgiwrap.socket; #ソケットファイルによるnginxとfcgi側の通信方法を採用
      include           /etc/nginx/fastcgi_params; #CGIスクリプトで使用できる環境変数をインクルード
      fastcgi_param     SCRIPT_FILENAME   \$document_root\$fastcgi_script_name;  #rootディレクトリ配下のCGIスクリプトが環境変数を使用できるように設定
    }
}
EOS
```

```
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

cat <<EOS >/etc/nginx/nginx.conf
user  www-data;
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

    access_log  /var/log/nginx/access.log  main; #mainはログフォーマットのエイリアス名とリンクしている（いた）

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf; #個別の定義ファイルをインクルード
}
EOS
```

CGIスクリプトの作成

```
cat <<EOS >/var/www/cgi-bin/a.sh
#!/usr/bin/env bash

echo "Content-type: text/html"

echo うんこ
EOS

chown -R www-data:www-data /var/www/cgi-bin
```

nginxプロセス起動

```
$/etc/init.d/nginx start


$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  19520  1716 pts/0    Ss   18:49   0:00 bash /etc/init/run.sh ubuntu
kuraine      7  0.0  0.0  19916  2304 pts/0    S+   18:49   0:00 bash
kuraine    372  0.0  0.0  19916  2488 pts/1    Ss   18:51   0:00 /bin/bash
root       415  0.0  0.0  54548  1840 pts/1    S    18:53   0:00 su root
root       416  0.0  0.0  20024  2572 pts/1    S    18:53   0:00 bash
root      1902  0.0  0.0  33328   904 ?        Ss   19:18   0:00 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
www-data  1903  0.0  0.0  33760  1688 ?        S    19:18   0:00 nginx: worker process
root      1913  0.0  0.0  35548  1728 pts/1    R+   19:18   0:00 ps aux


$lsof -P -i:8888
COMMAND  PID     USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
nginx   1902     root    6u  IPv4 2146324      0t0  TCP *:8888 (LISTEN)
nginx   1903 www-data    6u  IPv4 2146324      0t0  TCP *:8888 (LISTEN)
```

fcgiプロセス起動

```
$/etc/init.d/fcgiwrap start
 * Starting FastCGI wrapper fcgiwrap                                                                                                                                                   [ OK ] 

$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  19520  1716 pts/0    Ss   18:49   0:00 bash /etc/init/run.sh ubuntu
kuraine      7  0.0  0.0  19916  2304 pts/0    S+   18:49   0:00 bash
kuraine    372  0.0  0.0  19916  2488 pts/1    Ss   18:51   0:00 /bin/bash
root       415  0.0  0.0  54548  1840 pts/1    S    18:53   0:00 su root
root       416  0.0  0.0  20024  2588 pts/1    S    18:53   0:00 bash
root      2265  0.0  0.0  33328   904 ?        Ss   19:27   0:00 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
www-data  2266  0.0  0.0  33760  1924 ?        S    19:27   0:00 nginx: worker process
www-data  2397  0.0  0.0  25196   692 ?        Ss   19:34   0:00 /usr/sbin/fcgiwrap -f
root      2426  0.0  0.0  35548  1728 pts/1    R+   19:35   0:00 ps aux
```

アクセス

```
$curl -i http://localhost:8888/a.sh
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Sun, 24 May 2020 10:35:52 GMT
Content-Type: text/html
Transfer-Encoding: chunked
Connection: keep-alive

うんこ
```



プロセスの停止

```
$/etc/init.d/fcgiwrap stop
 * Stopping FastCGI wrapper fcgiwrap                                                                                                                                                   [ OK ] 

$/etc/init.d/nginx stop

$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  19520  1716 pts/0    Ss   18:49   0:00 bash /etc/init/run.sh ubuntu
kuraine      7  0.0  0.0  19916  2304 pts/0    S+   18:49   0:00 bash
kuraine    372  0.0  0.0  19916  2500 pts/1    Ss   18:51   0:00 /bin/bash
root      2482  0.0  0.0  54548  1840 pts/1    S    19:39   0:00 su root
root      2483  0.0  0.0  19916  2524 pts/1    S    19:39   0:00 bash
root      2635  0.0  0.0  35548  1728 pts/1    R+   19:49   0:00 ps aux
```


CGIスクリプトのログ

```
$ls -l /var/log/nginx/*
-rw-r-----. 1 nginx adm 0  5月 24 20:05 /var/log/nginx/access.log
-rw-r-----. 1 nginx adm 0  5月 24 20:05 /var/log/nginx/error.log

$curl -i http://localhost:8888/a.sh
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Sun, 24 May 2020 11:05:25 GMT
Content-Type: text/html
Transfer-Encoding: chunked
Connection: keep-alive

うんこ

ls -l /var/log/nginx/*
-rw-r-----. 1 nginx adm 94  5月 24 20:05 /var/log/nginx/access.log
-rw-r-----. 1 nginx adm  0  5月 24 20:05 /var/log/nginx/error.log

$cat /var/log/nginx/access.log
127.0.0.1 - - [24/May/2020:20:05:25 +0900] "GET /a.sh HTTP/1.1" 200 175 "-" "curl/7.58.0" "-"

$curl -i http://localhost:8888/b.sh
HTTP/1.1 403 Forbidden
Server: nginx/1.18.0
Date: Sun, 24 May 2020 11:05:58 GMT
Content-Type: text/plain
Transfer-Encoding: chunked
Connection: keep-alive

403 Forbidden

$ls -l /var/log/nginx/*
-rw-r-----. 1 nginx adm 188  5月 24 20:05 /var/log/nginx/access.log
-rw-r-----. 1 nginx adm 372  5月 24 20:05 /var/log/nginx/error.log

$cat /var/log/nginx/error.log
2020/05/24 20:05:58 [error] 2864#2864: *3 FastCGI sent in stderr: "Cannot get script name, are DOCUMENT_ROOT and SCRIPT_NAME (or SCRIPT_FILENAME) set and is the script executable?" while reading response header from upstream, client: 127.0.0.1, server: localhost, request: "GET /b.sh HTTP/1.1", upstream: "fastcgi://unix:/var/run/fcgiwrap.socket:", host: "localhost:8888"
```

