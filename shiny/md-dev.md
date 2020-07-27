# rlistライブラリ

- 起動時の状態

dockerホスト側。自身がプロキシサーバーとして振る舞って外部にでている

```
$ps uax | grep docker
root      2430  3.9  0.8 4370016 287008 ?      Ssl   2月05  22:23 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
root      4506  0.0  0.0 364392  8600 ?        Sl    2月05   0:00 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8787 -container-ip 172.17.0.2 -container-port 8787
root      4520  0.0  0.0 216928  6456 ?        Sl    2月05   0:00 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 3838 -container-ip 172.17.0.2 -container-port 3838
root      4529  0.0  0.0 109092  7184 ?        Sl    2月05   0:02 containerd-shim -namespace moby -workdir /var/lib/containerd/io.containerd.runtime.v1.linux/moby/30d09f47dfb5957bf76f6b591e1d0908c1f7ae39497c895d687d0e2b2035550f -address /run/containerd/containerd.sock -containerd-binary /usr/bin/containerd -runtime-root /var/run/docker/runtime-runc
aine     23150  0.0  0.0 112732   972 pts/0    S+   08:19   0:00 grep --color=auto docker
```

これ便利
- https://teratail.com/questions/151601

- https://www.slideshare.net/mobile/yutamura1

- https://qiita.com/nozma/items/d4879bf55e8637c0686e
パラレルけいさん

- https://wtnvenga.hatenablog.com/entry/2017/12/03/230102

Go言語乗り出したのも、並列並行処理に興味を持ったから


# mapply関数

- https://sudori.info/stat/stat_mapply_clusterMap.html

# メタプログラミング

- http://chiral.hatenablog.com/entry/20121210/1355065348

# RパッケージのinstallログからANTICONFを見つけて設定ファイルを見直す
```
Rscript install_packages.R | tee pack_inst_log
```

```
grep "ANTICONF ERROR" pack_inst_log -A 10
```

# 参考文献
[最新版Rstudio](https://www.rstudio.com/products/rstudio/download/preview/)</br>

# rstudio-server

## サーバープロセス起動

rstudioユーザーがsudo経由で実行

```
rstudio@c3873a2538c7 ~$sudo /usr/lib/rstudio-server/extras/init.d/redhat/rstudio-server start 1>~/launch-rstudio-server.log 2>&1
```

ログ確認

```
$ls -l ~/launch-rstudio-server.log
-rw-rw-r--. 1 rstudio rstudio 70  1月 26 12:24 /home/rstudio/launch-rstudio-server.log
$tail ~/launch-rstudio-server.log
Starting rstudio-server: [  OK  ]
```

プロセス確認

```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
rstudio      1  0.0  0.0  42696  1552 pts/0    Ss+  11:58   0:00 /usr/lib/systemd/systemd
rstudio      6  0.0  0.0  14376  2036 pts/1    Ss   11:58   0:00 /bin/bash
rstudio+   919  0.0  0.0 214964  4284 ?        Ssl  12:18   0:00 /usr/lib/rstudio-server/bin/rserver
rstudio    957  0.0  0.0  54296  1872 pts/1    R+   12:19   0:00 ps aux
```

ブラウザからアクセス

```
ID:rstudio
PW:rstudio_pwd
```

http://192.168.1.109:8787/


プロセス確認

ログインユーザーに対してサーバーがトークンを払い出している。

```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
rstudio      1  0.0  0.0  42696  1552 pts/0    Ss+  11:58   0:00 /usr/lib/systemd/systemd
rstudio      6  0.0  0.0  14376  2036 pts/1    Ss   11:58   0:00 /bin/bash
rstudio    661  0.2  0.2 479684 70260 ?        Sl   12:03   0:02 /usr/lib/rstudio-server/bin/rsession -u rstudio --launcher-token 19CB7452
rstudio+   919  0.0  0.0 214964  4284 ?        Ssl  12:18   0:00 /usr/lib/rstudio-server/bin/rserver
rstudio    958  0.0  0.0  54296  1872 pts/1    R+   12:20   0:00 ps aux
```

ログ確認

```
$ls -l ~/launch-rstudio-server.log
-rw-rw-r--. 1 rstudio rstudio 70  1月 26 12:24 /home/rstudio/launch-rstudio-server.log
$tail ~/launch-rstudio-server.log
Starting rstudio-server: [  OK  ]
```

## サーバープロセス停止

rstudioユーザーがsudo経由で実行

```
rstudio@c3873a2538c7 ~$sudo /usr/lib/rstudio-server/extras/init.d/redhat/rstudio-server stop 1>~/launch-rstudio-server.log 2>&1
```

トークンを払い出したプロセスは前回の作業状態を復元するためのバッググランドプロセスなので、そっとしておく

```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
rstudio      1  0.0  0.0  42696  1552 pts/0    Ss+  11:58   0:00 /usr/lib/systemd/systemd
rstudio      6  0.0  0.0  14376  2036 pts/1    Ss   11:58   0:00 /bin/bash
rstudio    661  0.2  0.2 479684 70260 ?        Sl   12:03   0:02 /usr/lib/rstudio-server/bin/rsession -u rstudio --launcher-token 19CB7452
rstudio    958  0.0  0.0  54296  1872 pts/1    R+   12:20   0:00 ps aux
```


ログ確認

```
$ls -l ~/launch-rstudio-server.log
-rw-rw-r--. 1 rstudio rstudio 70  1月 26 12:24 /home/rstudio/launch-rstudio-server.log
$tail ~/launch-rstudio-server.log
Starting rstudio-server: [  OK  ]
Stopping rstudio-server: [  OK  ]
```


# shiny-server

## サーバープロセス起動


shinyユーザーで実行

```
$ls -l /opt/shiny-server/bin/shiny-server
-rwxr-xr-x. 1 root root 25343  9月 12  2018 /opt/shiny-server/bin/shiny-server
$/opt/shiny-server/bin/shiny-server 1>~/launch-shiny-server.log 2>&1 &
[1] 1075
```

ログ確認
```
$ls -l ~/launch-shiny-server.log
-rw-rw-r--. 1 shiny shiny 280  1月 26 12:26 /home/shiny/launch-shiny-server.log

$tail ~/launch-shiny-server.log
[2020-01-26T12:26:19.834] [INFO] shiny-server - Shiny Server v1.5.9.923 (Node.js v8.11.3)
[2020-01-26T12:26:19.835] [INFO] shiny-server - Using config file "/etc/shiny-server/shiny-server.conf"
[2020-01-26T12:26:19.863] [INFO] shiny-server - Starting listener on http://[::]:3838
```

プロセス確認

```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
rstudio      1  0.0  0.0  42696  1552 pts/0    Ss+  11:58   0:00 /usr/lib/systemd/systemd
rstudio      6  0.0  0.0  14376  2044 pts/1    Ss   11:58   0:00 /bin/bash
rstudio    661  0.2  0.2 479684 70260 ?        Sl   12:03   0:04 /usr/lib/rstudio-server/bin/rsession -u rstudio --launcher-token 19CB7452
shiny     1075  0.1  0.0 935760 31856 pts/1    Sl   12:26   0:00 /opt/shiny-server/ext/node/bin/shiny-server /opt/shiny-server/lib/main.js
root      1093  0.1  0.0  87256  2620 pts/1    S    12:28   0:00 su shiny
shiny     1094  0.0  0.0  14376  2012 pts/1    S    12:28   0:00 bash
shiny     1107  0.0  0.0  54296  1868 pts/1    R+   12:28   0:00 ps aux
```

待受ポート確認

```
$lsof -i:3838
COMMAND    PID  USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
shiny-ser 1075 shiny   10u  IPv6 16273522      0t0  TCP *:sos (LISTEN)
```

ブラウザからアクセス

http://192.168.1.109:3838/

shiny-serverプロセス停止

```
$sudo kill -9 272
```

プロセス確認
```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
rstudio      1  0.0  0.0  42696  1552 pts/0    Ss+  11:58   0:00 /usr/lib/systemd/systemd
rstudio      6  0.0  0.0  14376  2044 pts/1    Ss   11:58   0:00 /bin/bash
rstudio    661  0.2  0.2 479684 70260 ?        Sl   12:03   0:04 /usr/lib/rstudio-server/bin/rsession -u rstudio --launcher-token 19CB7452
root      1093  0.0  0.0  87256  2620 pts/1    S    12:28   0:00 su shiny
shiny     1094  0.0  0.0  14376  2060 pts/1    S    12:28   0:00 bash
shiny     1116  0.0  0.0  54296  1872 pts/1    R+   12:31   0:00 ps aux
```

shiny-serverのレンダラでうまく行っていないときは以下の情報をもとに
**/var/lib/shiny-server**ディレクトリの権限を変更する。

https://github.com/rocker-org/shiny/issues/49 </br>

```
$ls -l /var/lib | grep shiny-server
drwxr-xr-x. 2 root root 4096  1月 26 09:12 shiny-server
$sudo chown shiny:shiny /var/lib/shiny-server
$ls -l /var/lib | grep shiny-server
drwxr-xr-x. 1 shiny shiny 4096  1月 26 09:12 shiny-server
```

# dockerイメージ作成
```
time docker build -t centos-7-6-18-10-shiny-rstudio . | tee log
```

# dockerコンテナ作成
```
docker run --privileged --shm-size=8gb -v /sys/fs/cgroup:/sys/fs/cgroup:ro -itd -v /etc/localtime:/etc/localtime -v /run/udev:/run/udev -v /run/systemd:/run/systemd -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/lib/dbus:/var/lib/dbus -v /var/run/dbus:/var/run/dbus -v /etc/machine-id:/etc/machine-id -p 8787:8787 -p 3838:3838 --name centos-7-6-18-10-shiny-rstudio -itd centos-7-6-18-10-shiny-rstudio
```

# dockerコンテナ潜入
```
docker exec --user rstudio -it centos-7-6-18-10-shiny-rstudio /bin/bash
```

