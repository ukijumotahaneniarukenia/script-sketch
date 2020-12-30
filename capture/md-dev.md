わかりやすい自動テスト

- http://webtech-walker.com/archive/2013/04/xvfb-js-unit-test.html

X環境がない場合のDockerfile

```
FROM centos:7.6.1810

ARG OS_VERSION
ARG REPO

ENV LANG=ja_JP.UTF-8

RUN yum install -y git
RUN cd /usr/local/src && git clone https://github.com/ukijumotahaneniarukenia/$REPO.git

RUN cd /usr/local/src/$REPO && echo ./$OS_VERSION-install-docker-host-user.sh | bash

RUN cd /usr/local/src/$REPO && echo './$OS_VERSION-install-default-user.sh 1001 apache 1001 apache' | bash

RUN cd /usr/local/src/$REPO && echo ./$OS_VERSION-install-repository-pkg.sh | bash

USER apache
WORKDIR /home/apache
```


rootユーザーで実行

```
$firefox
Failed to open connection to "session" message bus: Unable to autolaunch a dbus-daemon without a $DISPLAY for X11
Running without a11y support!

(firefox:217): Gtk-WARNING **: 02:51:18.423: Locale not supported by C library.
	Using the fallback 'C' locale.
Error: no DISPLAY environment variable specified
```

xvfbコマンドインストール

- https://qiita.com/kt3k/items/cea3c6de3c2337004a84#phantomjs-%E3%81%AE%E4%BD%95%E3%81%8C%E5%95%8F%E9%A1%8C%E3%81%8B
- https://blog.amedama.jp/entry/2016/01/03/115602

rootユーザーで実行

```
$yum -y install xorg-x11-server-Xvfb

以下も依存関係で必要
$yum install -y which xauth
```

firefoxをバッググラウンドで実行

転送先のディスプレイ番号のデフォルトは99からincrement

```
$xvfb-run firefox http://google.com 1>$HOME/launch-firefox.log 2>&1 &
[1] 566

$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
apache       1  0.0  0.0  13260  1356 pts/0    Ss   02:49   0:00 bash /etc/init/run.sh
apache       7  0.0  0.0  13400  1684 pts/0    S+   02:49   0:00 bash
apache      20  0.0  0.0  13400  1920 pts/1    Ss   02:49   0:00 /bin/bash
root        41  0.0  0.0  86156  2520 pts/1    S    02:49   0:00 su root
root        42  0.0  0.0  13400  1928 pts/1    S    02:49   0:00 bash
root       566  0.0  0.0  11136  1388 pts/1    S    02:55   0:00 /bin/sh /usr/bin/xvfb-run firefox http://google.com
root       576  1.4  0.0  99984  8852 pts/1    S    02:55   0:00 Xvfb :99 -screen 0 640x480x8 -nolisten tcp
root       580 75.5  0.6 2800168 210044 pts/1  Sl   02:55   0:01 /usr/lib64/firefox/firefox http://google.com
root       643 31.5  0.3 2618504 119092 pts/1  Sl   02:55   0:00 /usr/lib64/firefox/firefox -contentproc -childID 1 -isForBrowser -prefsLen 1 -prefMapSize 180092 -parentBuildID 20200507181246 -greomni /usr/lib64
root       689 11.0  0.2 2576616 71852 pts/1   Sl   02:55   0:00 /usr/lib64/firefox/firefox -contentproc -childID 2 -isForBrowser -prefsLen 6619 -prefMapSize 180092 -parentBuildID 20200507181246 -greomni /usr/li
root       729  8.5  0.1 2566032 62728 pts/1   Sl   02:55   0:00 /usr/lib64/firefox/firefox -contentproc -childID 3 -isForBrowser -prefsLen 7405 -prefMapSize 180092 -parentBuildID 20200507181246 -greomni /usr/li
root       787  6.0  0.1 2542188 42872 pts/1   Sl   02:55   0:00 /usr/lib64/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 10377 -prefMapSize 180092 -parentBuildID 20200507181246 -greomni /usr/l
root       811  0.0  0.0  53328  1752 pts/1    R+   02:55   0:00 ps aux
```

キャプチャとるためのコマンドインストール

rootユーザーで実行
```
yum -y install xwd netpbm-progs
```

rootユーザーで実行

サイズ感からうまくいっていない

```
xwd -display :99 -root | xwdtopnm | pnmtopng >/home/aine/media/01.png

$cd /home/aine/media
$xwd -display :99 -root | xwdtopnm | pnmtopng > 01.png
xwdtopnm: WARNING: Producing maxval 65535 output.  This involves multiple bytes per sample, which some programs, e.g. 'xv', can't handle.  See manual.
xwdtopnm: writing PPM file
$ls -l
total 12
-rw-r--r--. 1 root root 2577 May 23 02:59 01.png
-rw-------. 1 root root 3322 Dec  4  2018 anaconda-ks.cfg
-rw-r--r--. 1 root root  792 May 23 02:55 launch-firefox.log
```


xvfb-runコマンド経由じゃない場合

```
$Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
[1] 1257

$export DISPLAY=:99

#firefoxはnew-windowのほうがうまくいく

$firefox --new-window https://www.centos.org/ 1 >$HOME/launch-firefox.log 2>&1 &

$xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/03.png
$xwdtopnm: writing PPM file
$cd /home/aine/media
$ls -l
total 64
-rw-r--r--. 1 root root 57229 May 23 03:33 03.png
$chown -R aine:aine *
$ls -l
-rw-r--r--. 1 aine aine  57229 May 23 03:33 03.png
```






















まとめ

このイメージに近い

- https://qiita.com/tukiyo3/items/37de0a70c07a95aedb7e


```

yum -y install firefox ipa-{,p}gothic-fonts ipa-{,p}mincho-fonts

yum -y install xorg-x11-server-Xvfb

yum install -y which xauth

yum -y install xwd netpbm-progs

yum install -y httpd

```
