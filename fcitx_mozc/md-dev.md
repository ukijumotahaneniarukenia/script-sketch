- いけた環境
  docker-container-ubuntu-18-04-vim
  docker-container-ubuntu-18-04-c-cpp-codeblocks


  同一コンテナ内で、ことなるユーザーが起動した場合、プロセス番号は別付番される。
  入力自体に影響はでなかったが、1回起動できればいい。


  一般ユーザーで起動したプロセスをrootユーザーは利用できるが、逆は安定しなかった。


  一般ユーザーで1回だけ起動できる仕組みがあればいい。


  同時複数いけるか

  別のプロセスでインプットメソッドを同時に使うことはできない。

理由はソケットファイルをdockerホストと共有できないから？？先方が握っているため。

```
(WARN-597 dbusstuff.c:197) Connection Error (Failed to connect to socket /tmp/dbus-Alenbc5uFf: Connection refused)
```


  fcitxプロセスを先に起動したプロセスだけが占有できる

握っている方はこんなログでる

```
dbus[1894]: arguments to dbus_connection_send_with_reply() were incorrect, assertion "connection != NULL" failed in file ../../../dbus/dbus-connection.c line 3408.
This is normally a bug in some application using the D-Bus library.

  D-Bus not built with -rdynamic so unable to print a backtrace
=========================
FCITX 4.2.9.6 -- Get Signal No.: 6
Date: try "date -d @1588840457" if you are using GNU date ***
ProcessID: 1894
fcitx(+0x1627)[0x5579c4847627]
/lib/x86_64-linux-gnu/libc.so.6(+0x3ef20)[0x7f9453fbef20]
/lib/x86_64-linux-gnu/libc.so.6(gsignal+0xc7)[0x7f9453fbee97]
/lib/x86_64-linux-gnu/libc.so.6(abort+0x141)[0x7f9453fc0801]
/lib/x86_64-linux-gnu/libdbus-1.so.3(_dbus_abort+0x24)[0x7f9453747274]
/lib/x86_64-linux-gnu/libdbus-1.so.3(_dbus_strdup+0x0)[0x7f945373db00]
/lib/x86_64-linux-gnu/libdbus-1.so.3(dbus_connection_send_with_reply+0x1c7)[0x7f9453723897]
/usr/lib/x86_64-linux-gnu/fcitx/fcitx-xkbdbus.so(+0x1af9)[0x7f944a3d4af9]
/usr/lib/x86_64-linux-gnu/libfcitx-core.so.0(FcitxModuleLoad+0x171)[0x7f94549d4b81]
/usr/lib/x86_64-linux-gnu/libfcitx-core.so.0(+0x88b6)[0x7f94549c48b6]
/usr/lib/x86_64-linux-gnu/libfcitx-core.so.0(FcitxInstanceRun+0x330)[0x7f94549c5560]
fcitx(+0xf6c)[0x5579c4846f6c]
/lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xe7)[0x7f9453fa1b97]
fcitx(+0xfea)[0x5579c4846fea]
```


  先方のコンテナを落し(docker stop)、後方のfcitxプロセスを起動し直す(docker start)と、使えるようになる。

  インプットメソッドはシングルトン？？

  実用的には単一さえつかえれば、問題はなさそう。


- レポジトリの設定修正

```
cp -p /etc/apt/sources.list /etc/apt/sources.list.bak
sed -i -e 's/archive.ubuntu.com\|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
apt update
```

- インプットメソッドのインストール


```
apt install -y fcitx-mozc
```

- dbus-deamonコマンドのインストール

fcitx-mozcサーバーを常駐プロセスとしておくのに必要

```
apt install -y dbus-x11
```


- インプットメソッドにfcitxを使用するように設定

Xクライアント側の設定($HOME/.xprofile)とXサーバー側の設定($HOME/.bashrc)

```
cat << EOF >> $HOME/.xprofile
export LANG="ja_JP.UTF-8"
export XMODIFIERS="@im=fcitx"
export XMODIFIER="@im=fcitx"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export DefaultIMModule=fcitx
EOF
```

```
cat << EOF >> $HOME/.bashrc
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
EOF
```


- fcitxのバッググラウンド起動

```
fcitx 1>launch-fcitx.log 2>&1 &
```

- 全角半角キーに入力切り替えイベントを割付
  - キャプチャ参照
  - HotKey->Trigger Input Methosd->Zenkakuhankakuを押下後、全角半角キーを押下する
  - AddonタブでClipboardを選択し、Configureボタンを押下し、OKボタンを押下する

```
fcitx-configtool 1>launch-fcitx-configtool.log 2>&1 &
```

- うまくうごいていると以下のような感じ
  - 右上にmozcのオレンジ色の**あ**が見えるはず
```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  19652  1980 pts/0    Ss+  11:54   0:00 /bin/bash
kuraine   7487  0.0  0.0 263412 24160 ?        S    15:41   0:00 fcitx
kuraine   7551  0.0  0.0  45692   816 ?        S    15:45   0:00 dbus-launch --autolaunch bc74deaa9e044c079ed6fc963d084157 --binary-syntax --close-stderr
kuraine   7552  0.0  0.0  47488  1064 ?        Ss   15:45   0:00 /usr/bin/dbus-daemon --syslog-only --fork --print-pid 5 --print-address 7 --session
kuraine   7558  0.0  0.0  47488  1424 ?        Ss   15:45   0:00 /usr/bin/dbus-daemon --syslog --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
kuraine   7562  0.0  0.0  27584   436 ?        SN   15:45   0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-pezkpngH9j,guid=d99d3b24109d08b97802ce5e5eb3ae84 7558
kuraine   7563  0.0  0.0  96844 14720 ?        Sl   15:45   0:00 /usr/lib/mozc/mozc_server
kuraine   7570  0.1  0.0  19808  2200 pts/2    Ss   15:47   0:00 /bin/bash
kuraine   7577  0.0  0.0  35548  1568 pts/2    R+   15:47   0:00 ps aux
```

- レポジトリの設定修正
  - もとにもどす
```
cp -p /etc/apt/sources.list.bak /etc/apt/sources.list
apt update
```


- 動作確認

一度コンテナから出て再度入りなおし、全角半角キーを押下すると入力切替ができる

xterm起動

```
xterm
```

コンテナを削除すると、右上のアイコンも消える
