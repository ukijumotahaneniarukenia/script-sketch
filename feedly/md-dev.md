# プロセス起動

```
$sudo /usr/sbin/httpd 1>~/launch-apache-httpd.log 2>&1
```

# プロセス起動確認

```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
apache       1  0.0  0.0  14380  2012 pts/0    Ss+  22:19   0:00 /bin/bash
apache      98  0.1  0.0  14380  2028 pts/1    Ss   22:24   0:00 /bin/bash
root       122  0.0  0.0 224064  3456 ?        Ss   22:24   0:00 /usr/sbin/httpd
apache     123  0.0  0.0 224064  2936 ?        S    22:24   0:00 /usr/sbin/httpd
apache     124  0.0  0.0 224064  2936 ?        S    22:24   0:00 /usr/sbin/httpd
apache     125  0.0  0.0 224064  2936 ?        S    22:24   0:00 /usr/sbin/httpd
apache     126  0.0  0.0 224064  2936 ?        S    22:24   0:00 /usr/sbin/httpd
apache     127  0.0  0.0 224064  2936 ?        S    22:24   0:00 /usr/sbin/httpd
apache     128  0.0  0.0  54304  1868 pts/1    R+   22:24   0:00 ps uax
```

# ログ確認

```
$tail -f ~/launch-apache-httpd.log
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
```

# プロセス停止

```
$ps uax | grep /usr/sbin/httpd | awk '{print $2}' | xargs -I@ kill -9 @
```

# ブラウザからアクセス

- http://192.168.1.109:8080

- http://localhost:8080


# ファイル作成

- apacheユーザーで作業

```
cd /var/www/html
echo うんこ> index.html
mkdir -p unko
echo うこんのちから>unko/detail.html
apache@af3606527cb1 /var/www/html$ll *
-rw-rw-r--. 1 apache apache   10  2月  7 22:34 index.html

unko:
total 4
-rw-rw-r--. 1 apache apache 22  2月  7 22:36 detail.html
tree
.
|-- index.html
`-- unko
    `-- detail.html

1 directory, 2 files
```

- http://localhost:8080/index.html

- http://localhost:8080/unko/detail.html


- dockerホストからアクセス

```
$curl -v http://localhost:8080/unko/detail.html
* About to connect() to localhost port 8080 (#0)
*   Trying ::1...
* Connected to localhost (::1) port 8080 (#0)
> GET /unko/detail.html HTTP/1.1
> User-Agent: curl/7.29.0
> Host: localhost:8080
> Accept: */*
> 
< HTTP/1.1 200 OK
< Date: Fri, 07 Feb 2020 13:39:41 GMT
< Server: Apache/2.4.6 (CentOS)
< Last-Modified: Fri, 07 Feb 2020 13:36:40 GMT
< ETag: "16-59dfc7ac7e8fd"
< Accept-Ranges: bytes
< Content-Length: 22
< Content-Type: text/html; charset=UTF-8
< 
うこんのちから
* Connection #0 to host localhost left intact
$curl -v http://localhost:8080/index.html
* About to connect() to localhost port 8080 (#0)
*   Trying ::1...
* Connected to localhost (::1) port 8080 (#0)
> GET /index.html HTTP/1.1
> User-Agent: curl/7.29.0
> Host: localhost:8080
> Accept: */*
> 
< HTTP/1.1 200 OK
< Date: Fri, 07 Feb 2020 13:39:50 GMT
< Server: Apache/2.4.6 (CentOS)
< Last-Modified: Fri, 07 Feb 2020 13:34:54 GMT
< ETag: "a-59dfc74776f51"
< Accept-Ranges: bytes
< Content-Length: 10
< Content-Type: text/html; charset=UTF-8
< 
うんこ
* Connection #0 to host localhost left intact
```
