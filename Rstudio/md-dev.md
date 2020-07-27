- あんていている

これ便利
- https://teratail.com/questions/151601

- https://www.slideshare.net/mobile/yutamura1

- https://qiita.com/nozma/items/d4879bf55e8637c0686e

[パラレルけいさん](https://wtnvenga.hatenablog.com/entry/2017/12/03/230102)

[mapply関数](https://sudori.info/stat/stat_mapply_clusterMap.html)

[メタプログラミング](http://chiral.hatenablog.com/entry/20121210/1355065348)

[最新版Rstudio](https://www.rstudio.com/products/rstudio/download/preview/)

サーバープロセス起動

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

サーバープロセス停止

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

