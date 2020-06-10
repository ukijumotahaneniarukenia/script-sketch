- https://slack.com/intl/ja-jp/downloads/instructions/ubuntu


dockerコンテナ内でもいけた


```
$ dpkg -i slack-desktop-4.4.3-amd64.deb
Selecting previously unselected package slack-desktop.
(Reading database ... 107466 files and directories currently installed.)
Preparing to unpack slack-desktop-4.4.3-amd64.deb ...
Unpacking slack-desktop (4.4.3) ...
dpkg: dependency problems prevent configuration of slack-desktop:
 slack-desktop depends on libappindicator3-1; however:
  Package libappindicator3-1 is not installed.

dpkg: error processing package slack-desktop (--install):
 dependency problems - leaving unconfigured
Processing triggers for mime-support (3.60ubuntu1) ...
Errors were encountered while processing:
 slack-desktop
```

一度remove


```
$ apt remove slack-desktop
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
  slack-desktop
0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
1 not fully installed or removed.
After this operation, 148 MB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 107690 files and directories currently installed.)
Removing slack-desktop (4.4.3) ...
Processing triggers for mime-support (3.60ubuntu1) ...

$ apt remove slack-desktop
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package slack-desktop
```


そしてライブラリインストール


```
$ apt install -y libappindicator3-1
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  libindicator3-7
Suggested packages:
  indicator-application
The following NEW packages will be installed:
  libappindicator3-1 libindicator3-7
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 45.5 kB of archives.
After this operation, 174 kB of additional disk space will be used.
Get:1 http://ftp.jaist.ac.jp/pub/Linux/ubuntu bionic/main amd64 libindicator3-7 amd64 16.10.0+18.04.20180321.1-0ubuntu1 [26.1 kB]
Get:2 http://ftp.jaist.ac.jp/pub/Linux/ubuntu bionic/main amd64 libappindicator3-1 amd64 12.10.1+18.04.20180322.1-0ubuntu1 [19.4 kB]
Fetched 45.5 kB in 1s (58.4 kB/s)
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package libindicator3-7.
(Reading database ... 107466 files and directories currently installed.)
Preparing to unpack .../libindicator3-7_16.10.0+18.04.20180321.1-0ubuntu1_amd64.deb ...
Unpacking libindicator3-7 (16.10.0+18.04.20180321.1-0ubuntu1) ...
Selecting previously unselected package libappindicator3-1.
Preparing to unpack .../libappindicator3-1_12.10.1+18.04.20180322.1-0ubuntu1_amd64.deb ...
Unpacking libappindicator3-1 (12.10.1+18.04.20180322.1-0ubuntu1) ...
Setting up libindicator3-7 (16.10.0+18.04.20180321.1-0ubuntu1) ...
Setting up libappindicator3-1 (12.10.1+18.04.20180322.1-0ubuntu1) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
```


再度インストール

```
$ dpkg -i slack-desktop-4.4.3-amd64.deb
Selecting previously unselected package slack-desktop.
(Reading database ... 107476 files and directories currently installed.)
Preparing to unpack slack-desktop-4.4.3-amd64.deb ...
Unpacking slack-desktop (4.4.3) ...
Setting up slack-desktop (4.4.3) ...
Processing triggers for mime-support (3.60ubuntu1) ...



$ which slack
/usr/bin/slack

```


事前にfirefoxをインストール

```

apt install -y firefox

```

起動。ちょいとラグがある。３０秒ぐらい

```
$ slack 1>$HOME/launch-slack-desktop.log 2>&1 &
```


プロセス確認

```
$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine        1  0.0  0.0  19528  3464 pts/0    Ss    6月09   0:00 bash /etc/init/run.sh ubuntu
kuraine        8  0.0  0.1 271348 41332 ?        S     6月09   0:56 fcitx
kuraine        9  0.0  0.0  19936  3960 pts/0    S+    6月09   0:00 bash
kuraine       36  0.0  0.0  45840  2108 ?        S     6月09   0:00 dbus-launch --autolaunch 847e280aea924d0abb2f1146764b1a80 --binary-syntax --close-stderr
kuraine       37  0.0  0.0  47496  2632 ?        Ss    6月09   0:00 /usr/bin/dbus-daemon --syslog-only --fork --print-pid 5 --print-address 7 --session
kuraine       43  0.0  0.0  47632  3244 ?        Ss    6月09   0:00 /usr/bin/dbus-daemon --syslog --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
kuraine       47  0.0  0.0  27592   212 ?        SN    6月09   0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-QR57PRDouJ,guid=fa9c6976741da16b2d6608125ede7982 43
kuraine       48  0.0  0.0  97244 29564 ?        Sl    6月09   0:02 /usr/lib/mozc/mozc_server
kuraine    60556  0.0  0.0  20716  5032 pts/1    Ss   21:37   0:00 /bin/bash
kuraine    60932  1.0  0.4 810880 132316 pts/1   Sl   22:37   0:01 slack
kuraine    60938  0.0  0.1 368840 40032 pts/1    S    22:37   0:00 /usr/lib/slack/slack --type=zygote
kuraine    60940  0.0  0.0 368840  6944 pts/1    S    22:37   0:00 /usr/lib/slack/slack --type=zygote
kuraine    60965  0.2  0.2 510132 76484 pts/1    Sl   22:37   0:00 /usr/lib/slack/slack --type=gpu-process --field-trial-handle=12726257617328375813,17588230253315171014,131072 --disable-fea
kuraine    60974  0.9  0.1 452432 57508 pts/1    Sl   22:37   0:01 /usr/lib/slack/slack --type=utility --field-trial-handle=12726257617328375813,17588230253315171014,131072 --disable-feature
kuraine    60995  4.7  0.6 12575852 217060 pts/1 Sl   22:37   0:05 /usr/lib/slack/slack --type=renderer --autoplay-policy=no-user-gesture-required --force-color-profile=srgb --field-trial-ha
kuraine    61088  0.0  0.0  35560  3308 pts/1    R+   22:38   0:00 ps aux

```


サインインすると、ブラウザが立ち上がるので、事前にfirefoxなどをインストールしておく

ワークスペースの名前を入力

script-sketch.slack.com

メールアドレスとパスワードを入力




ワークスペース自動でリダイレクトされんかったら、サインキーをコピーしておき、slackアプリを再起動

サインインページがオープンされているブラウザをアクティブにすると、自動でワークスペースに入ることができた。


便利

