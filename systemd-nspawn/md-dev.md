- PRE

```
$ sudo apt install -y debootstrap
$ sudo apt install -y systemd-container
$ which systemd-nspawn
```

- VER

```
$ dpkg --print-architecture
amd64

$ lsb_release -cs
focal

$ lsb_release -r|awk -F'\t' '{print $2}'|tr '.' '-'
20-04

$ machinectl --version
systemd 245 (245.4-4ubuntu3.2)
+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid

$ debootstrap --version
debootstrap 1.0.118ubuntu1.1

コンテナホスト
$ systemd-nspawn --version
systemd 245 (245.4-4ubuntu3.2)
+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid

コンテナゲスト
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemd --version
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
systemd 245 (245.4-4ubuntu3)
+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid
Connection to machine vir-ubuntu-20-04 terminated.

```

コンテナの作成
  - https://www.debian.org/releases/jessie/powerpc/apds03.html.ja
  - https://wiki.debian.org/Debootstrap

```
このディレクトリはrootユーザーのみ入れる
$ cd /var/lib/machines

$ mkdir -p vir-ubuntu-20-04

５分ぐらいかかる
$ time debootstrap --arch=amd64 focal /var/lib/machines/vir-ubuntu-20-04 http://archive.ubuntu.com/ubuntu

標準出力に以下のINFOログの文言が出力されればOK

I: Base system installed successfully.

テンプレート作成（隠しファイルごとコピー）
$ cp -a vir-ubuntu-20-04/ vir-ubuntu-20-04-template

```

やり直す場合

停止してからテンプレートから複製

```
$ cd /var/lib/machines

$ ls
vir-ubuntu-20-04/  vir-ubuntu-20-04-template/

root ukijumotahaneniarukenia aine-MS-7B98 23:45:54 /var/lib/machines$
$ machinectl terminate vir-ubuntu-20-04

$ machinectl terminate vir-ubuntu-20-04
Could not terminate machine: No machine 'vir-ubuntu-20-04' known

$ rm -rf vir-ubuntu-20-04

$ cp -a vir-ubuntu-20-04-template vir-ubuntu-20-04

$ ls
vir-ubuntu-20-04/  vir-ubuntu-20-04-template/

コンテナホスト起動時にコンテナゲストも自動起動するように設定（ディレクトリ名が同じであれば、毎回する必要はないと思う）
$ systemctl stop systemd-nspawn@vir-ubuntu-20-04.service #ラグが少しある。２分ぐらい。
$ systemctl start systemd-nspawn@vir-ubuntu-20-04.service
$ systemctl enable systemd-nspawn@vir-ubuntu-20-04.service
$ systemctl status systemd-nspawn@vir-ubuntu-20-04.service

$ machinectl shell root@vir-ubuntu-20-04 /bin/which sed
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/sed
Connection to machine vir-ubuntu-20-04 terminated.

レポジトリの設定
$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/sed -i.bak 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

DNSの設定など
$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/sed -i.bak 's/#DNS=/DNS=8.8.8.8/' /etc/systemd/resolved.conf

コンテナゲスト上でネットワークサービスの自動起動設定と開始、状態確認
- https://wiki.debian.org/nspawn
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl enable systemd-networkd
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl start systemd-networkd
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl status systemd-networkd

ワンラインはきついか
$ machinectl shell root@vir-ubuntu-20-04 /bin/bash

一般ユーザーの作成とrootユーザーのパスワードを設定

dbusのセッションエラーを避けるため、コンテナホストとコンテナゲストは同じユーザを作成

DEFAULT_USER_ID=1000
DEFAULT_USER_NAME=aine
DEFAULT_GROUP_ID=1000
DEFAULT_GROUP_NAME=aine

groupadd -g $DEFAULT_GROUP_ID $DEFAULT_GROUP_NAME && \
useradd -m -g $DEFAULT_GROUP_NAME -u $DEFAULT_USER_ID $DEFAULT_USER_NAME && \
chsh -s /bin/bash $DEFAULT_USER_NAME && \
echo $DEFAULT_USER_NAME':'$DEFAULT_USER_NAME'_pwd' | chpasswd && \
echo "$DEFAULT_USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
echo 'root:root_pwd' | chpasswd


一般ユーザーでsudoが使えるように

- https://qiita.com/tukiyo3/items/3642a99bd971fa829246

echo "Set disable_coredump false" >> /etc/sudo.conf

ネットワーク自動起動設定後のコンテナホストを再起動
```

再起動後の状態確認

```
$ cd /var/lib/machines

$ machinectl list -all
MACHINE          CLASS     SERVICE        OS     VERSION ADDRESSES                
.host            host      -              ubuntu 20.04   192.168.1.109            
                                                         172.17.0.1               
                                                         192.168.80.161           
                                                         169.254.31.62            
                                                         fe80::b3e4:7419:ec90:108e
                                                         fe80::42:b9ff:fed3:d9bf  
                                                         fe80::20dd:feff:fe74:4ac0
                                                         fe80::340a:adff:fe1d:51eb
                                                         fe80::30fd:acff:fe9c:2a3a
vir-ubuntu-20-04 container systemd-nspawn ubuntu 20.04   192.168.80.162           
                                                         169.254.193.228          
                                                         fe80::40b7:1bff:fe41:636a

2 machines listed.
```


疎通確認

確認する前に一度、コンテナホストを再起動しておく

コンテナ内から外部へ出ていけるか

```

$ machinectl start vir-ubuntu-20-04

$ machinectl list
MACHINE          CLASS     SERVICE        OS     VERSION ADDRESSES
vir-ubuntu-20-04 container systemd-nspawn ubuntu 20.04   -        

1 machines listed.

$ machinectl shell aine@vir-ubuntu-20-04 /bin/which echo
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/echo
Connection to machine vir-ubuntu-20-04 terminated.

$ machinectl shell aine@vir-ubuntu-20-04 /bin/which sudo
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/sudo
Connection to machine vir-ubuntu-20-04 terminated.


$ machinectl shell aine@vir-ubuntu-20-04 /bin/which apt
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/apt
Connection to machine vir-ubuntu-20-04 terminated.

$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt update
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
Get:1 http://ftp.jaist.ac.jp/pub/Linux/ubuntu focal InRelease [265 kB]
Get:2 http://ftp.jaist.ac.jp/pub/Linux/ubuntu focal/main amd64 Packages [970 kB]
Get:3 http://ftp.jaist.ac.jp/pub/Linux/ubuntu focal/main Translation-en [506 kB]
Fetched 1741 kB in 1s (1352 kB/s)                             
Reading package lists... Done
Building dependency tree... Done
All packages are up to date.
Connection to machine vir-ubuntu-20-04 terminated.

$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt install -y iputils-tracepath  dnsutils x11-apps

$ machinectl shell root@vir-ubuntu-20-04 /bin/which nslookup
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/nslookup
Connection to machine vir-ubuntu-20-04 terminated.

$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/nslookup www.google.com
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	www.google.com
Address: 172.217.26.36
Name:	www.google.com
Address: 2404:6800:4004:80f::2004

Connection to machine vir-ubuntu-20-04 terminated.

$ machinectl shell root@vir-ubuntu-20-04 /bin/which tracepath
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/tracepath
Connection to machine vir-ubuntu-20-04 terminated.

$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/tracepath 172.217.26.36
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
 1?: [LOCALHOST]                      pmtu 1500
 1:  _gateway                                              0.039ms 
 1:  _gateway                                              0.079ms 
 2:  192.168.1.1                                           0.662ms 
 3:  192.168.1.1                                           0.615ms pmtu 1454
 3:  nas827.p-kanagawa.nttpc.ne.jp                         4.788ms 
 4:  210.139.125.169                                       5.248ms 
 5:  210.165.249.177                                       5.289ms 
 6:  210.165.249.181                                       5.803ms asymm  5 
 7:  p254--504.tky-nk-acr02.sphere.ad.jp                   7.499ms asymm  6 
 8:  no reply
 9:  72.14.205.32                                          7.918ms asymm 13 
^C
Connection to machine vir-ubuntu-20-04 terminated.

```

環境変数

machinectlの場合

```
オプション未指定のroot
$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/env
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
LANG=C.UTF-8
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
HOME=/root
LOGNAME=root
USER=root
SHELL=/bin/sh
INVOCATION_ID=181894398c9847af90dc827872ff68f8
TERM=xterm-256color
MAIL=/var/mail/root
XDG_SESSION_ID=12
XDG_RUNTIME_DIR=/run/user/0
XDG_SESSION_TYPE=tty
XDG_SESSION_CLASS=user
Connection to machine vir-ubuntu-20-04 terminated.

オプション未指定の一般ユーザー
$ machinectl shell aine@vir-ubuntu-20-04 /usr/bin/env
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
LANG=C.UTF-8
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
HOME=/home/aine
LOGNAME=aine
USER=aine
SHELL=/bin/bash
INVOCATION_ID=01fcd433665b403cad02c017ddae6899
TERM=xterm-256color
MAIL=/var/mail/aine
XDG_SESSION_ID=16
XDG_RUNTIME_DIR=/run/user/1000
XDG_SESSION_TYPE=tty
XDG_SESSION_CLASS=user
Connection to machine vir-ubuntu-20-04 terminated.
```

systemd-nspawnの場合

X関連の変数が引き継がれてない印象（コマンド引数で指定する必要がある）

```
オプション未指定のroot
$ systemd-nspawn -D /var/lib/machines/vir-ubuntu-20-04 env
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
container=systemd-nspawn
TERM=xterm-256color
HOME=/root
USER=root
LOGNAME=root
container_uuid=35dd48b2-1f80-4cf7-953e-1ae292de544a
NOTIFY_SOCKET=/run/systemd/nspawn/notify
Container vir-ubuntu-20-04 exited successfully.

オプション未指定の一般ユーザー（userオプションを除いて）
$ systemd-nspawn --user=aine -D /var/lib/machines/vir-ubuntu-20-04 env
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
container=systemd-nspawn
TERM=xterm-256color
HOME=/home/aine
USER=aine
LOGNAME=aine
container_uuid=35dd48b2-1f80-4cf7-953e-1ae292de544a
NOTIFY_SOCKET=/run/systemd/nspawn/notify
```




ホスト名

machinectlの場合

よくない

```
$ machinectl terminate vir-ubuntu-20-04
root ukijumotahaneniarukenia aine-MS-7B98 23:37:55 /var/lib/machines$

$ machinectl list
No machines.

$ machinectl start vir-ubuntu-20-04

$ machinectl start vir-ubuntu-20-04
root ukijumotahaneniarukenia aine-MS-7B98 23:37:08 /var/lib/machines$

$ machinectl list
MACHINE          CLASS     SERVICE        OS     VERSION ADDRESSES       
vir-ubuntu-20-04 container systemd-nspawn ubuntu 20.04   192.168.161.114…

1 machines listed.

$ machinectl shell aine@vir-ubuntu-20-04 /bin/hostname
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
aine-MS-7B98
Connection to machine vir-ubuntu-20-04 terminated.
```

systemd-nspawnの場合

いいかんじ

```
$ systemd-nspawn -D /var/lib/machines/vir-ubuntu-20-04 hostname
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
vir-ubuntu-20-04
Container vir-ubuntu-20-04 exited successfully.
```



プロセス

machinectlの場合は、rootPIDがsystemdになっっている

```
rootユーザーの場合
$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/ps auxwwf
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.1  0.0  21036 10656 ?        Ss   23:48   0:00 /usr/lib/systemd/systemd
root          16  0.2  0.0  35232 11452 ?        Ss   23:48   0:00 /lib/systemd/systemd-journald
systemd+      51  0.2  0.0  24112 12804 ?        Ss   23:48   0:00 /lib/systemd/systemd-resolved
root          53  0.0  0.0   5568  2668 ?        Ss   23:48   0:00 /usr/sbin/cron -f
message+      54  0.0  0.0   7376  4164 ?        Ss   23:48   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root          56  0.0  0.0  26196 17912 ?        Ss   23:48   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog        57  0.0  0.0 224476  4488 ?        Ssl  23:48   0:00 /usr/sbin/rsyslogd -n -iNONE
root          58  0.2  0.0  16956  7744 ?        Ss   23:48   0:00 /lib/systemd/systemd-logind
root          63  0.0  0.0   4384  2212 pts/0    Ss+  23:48   0:00 /sbin/agetty -o -p -- \u --noclear --keep-baud console 115200,38400,9600 vt220
root         103  0.0  0.0   7632  3400 pts/1    Rs+  23:49   0:00 /usr/bin/ps auxwwf
root         110  0.0  0.0  22564  3508 pts/1    S+   23:49   0:00  \_ (sd-
root         105  0.0  0.0  18172  8660 ?        Ss   23:49   0:00 /lib/systemd/systemd --user
root         106  0.0  0.0  22372  3432 ?        S    23:49   0:00  \_ (sd-pam)
Connection to machine vir-ubuntu-20-04 terminated.

$ machinectl shell aine@vir-ubuntu-20-04 /usr/bin/ps auxwwf
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0 169804 11904 ?        Ss   Jul27   0:00 /usr/lib/systemd/systemd
root          16  0.0  0.0  51620 16460 ?        Ds   Jul27   0:00 /lib/systemd/systemd-journald
systemd+      51  0.0  0.0  24112 12500 ?        Ss   Jul27   0:00 /lib/systemd/systemd-resolved
root          53  0.0  0.0   5568  2584 ?        Ss   Jul27   0:00 /usr/sbin/cron -f
message+      54  0.0  0.0   7376  4536 ?        Ss   Jul27   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root          56  0.0  0.0  26196 17720 ?        Ss   Jul27   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog        57  0.0  0.0 224476  4448 ?        Ssl  Jul27   0:00 /usr/sbin/rsyslogd -n -iNONE
root          58  0.0  0.0  16956  7748 ?        Ss   Jul27   0:00 /lib/systemd/systemd-logind
root          60  0.0  0.0   4384  2040 pts/0    Ss+  Jul27   0:00 /sbin/agetty -o -p -- \u --noclear --keep-baud console 115200,38400,9600 vt220
systemd+     192  0.0  0.0  26740  7984 ?        Ss   00:01   0:00 /lib/systemd/systemd-networkd
aine        8295  0.0  0.0   7632  3348 pts/1    Rs+  00:18   0:00 /usr/bin/ps auxwwf
aine        8302  0.0  0.0 171192  4840 pts/1    S+   00:18   0:00  \_ (sd-
aine        8297  0.0  0.0  18172  8656 ?        Ss   00:18   0:00 /lib/systemd/systemd --user
aine        8298  0.0  0.0 171000  4768 ?        S    00:18   0:00  \_ (sd-pam)
Connection to machine vir-ubuntu-20-04 terminated.
```

systemd-nspawnの場合は、rootPIDがsystemdになっっていない

```
rootユーザー
$ systemd-nspawn --user=root --chdir=/root --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -D /var/lib/machines/vir-ubuntu-20-04 /usr/bin/ps auxwwf
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0   5800  1168 pts/0    Rs+  23:51   0:00 /usr/bin/ps auxwwf
Container vir-ubuntu-20-04 exited successfully.

一般ユーザー

$ systemd-nspawn --user=aine --chdir=/home/aine --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -D /var/lib/machines/vir-ubuntu-20-04 /usr/bin/ps auxwwf
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
aine           1  0.0  0.0   5800  1156 pts/0    Rs+  00:19   0:00 /usr/bin/ps auxwwf
Container vir-ubuntu-20-04 exited successfully.
```

X転送

- https://nosada.hatenablog.com/entry/2018/03/24/232855

コンテナホスト側でX転送許可

```
$ xhost +local:
non-network local connections being added to access control list
```


machinectlの場合

```
$ machinectl start vir-ubuntu-20-04

$ machinectl list
MACHINE          CLASS     SERVICE        OS     VERSION ADDRESSES       
vir-ubuntu-20-04 container systemd-nspawn ubuntu 20.04   192.168.105.130…

1 machines listed.


$ machinectl shell root@vir-ubuntu-20-04 /bin/which firefox
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.

Connection to machine vir-ubuntu-20-04 terminated.

ないので、いれる

$ machinectl shell root@vir-ubuntu-20-04 /bin/which apt
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/apt
Connection to machine vir-ubuntu-20-04 terminated.

$ time machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt install -y firefox

$ machinectl shell root@vir-ubuntu-20-04 /bin/which firefox
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/firefox
Connection to machine vir-ubuntu-20-04 terminated.

DISPLAY環境変数設定
$ machinectl --setenv=DISPLAY=:0.0 shell aine@vir-ubuntu-20-04 /usr/bin/env
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
LANG=C.UTF-8
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
HOME=/home/aine
LOGNAME=aine
USER=aine
SHELL=/bin/bash
INVOCATION_ID=4af92f8ab6154b7e8feda468af891cd4
DISPLAY=:0.0
TERM=xterm-256color
MAIL=/var/mail/aine
XDG_SESSION_ID=31
XDG_RUNTIME_DIR=/run/user/1000
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
XDG_SESSION_TYPE=tty
XDG_SESSION_CLASS=user
Connection to machine vir-ubuntu-20-04 terminated.

エラー

$ machinectl --setenv=DISPLAY=:0.0 shell aine@vir-ubuntu-20-04 /usr/bin/firefox
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
Unable to init server: Could not connect: Connection refused
Error: cannot open display: :0.0
Connection to machine vir-ubuntu-20-04 terminated.

システム関連パスをマウント

ユーザーの名前空間を使用していない場合のみbind可能らしいので、machinectlではX転送は今の所難しそう。
- https://www.freedesktop.org/software/systemd/man/machinectl.html
bind NAME PATH [PATH]

Note that this option is currently only supported for systemd-nspawn(1) containers, and only if user namespacing (--private-users) is not used. 


$ machinectl bind vir-ubuntu-20-04 /run/systemd
Failed to bind mount: Can't bind mount on container with user namespacing applied.
root ukijumotahaneniarukenia aine-MS-7B98 23:23:52 /var/lib/machines$
$ machinectl bind vir-ubuntu-20-04 /run/systemd /run/systemd
Failed to bind mount: Can't bind mount on container with user namespacing applied.
root ukijumotahaneniarukenia aine-MS-7B98 23:24:05 /var/lib/machines$
$ machinectl bind vir-ubuntu-20-04 /run/systemd /run/systemd --read-only
Failed to bind mount: Can't bind mount on container with user namespacing applied.

マウントできない

```

systemd-nspawnの場合

バッググラウンドはちょっとめんどいことなったので、やめ。やるなら、サービス化。

```
コンテナゲスト停止
$ machinectl terminate vir-ubuntu-20-04

$ machinectl list 
No machines.

rootユーザーで起動（基本起動しない）

検索できる

$ systemd-nspawn --user=root --chdir=/root --setenv=XDG_RUNTIME_DIR=/run/user/$(id -u) --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -U -D /var/lib/machines/vir-ubuntu-20-04 /usr/bin/firefox
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
Selected user namespace base 1547173888 and range 65536.
Gtk-Message: 00:26:20.428: Failed to load module "canberra-gtk-module"
Gtk-Message: 00:26:20.429: Failed to load module "canberra-gtk-module"
Gtk-Message: 00:26:21.445: Failed to load module "canberra-gtk-module"
Gtk-Message: 00:26:21.445: Failed to load module "canberra-gtk-module"
Gtk-Message: 00:26:21.523: Failed to load module "canberra-gtk-module"
Gtk-Message: 00:26:21.524: Failed to load module "canberra-gtk-module"
Gtk-Message: 00:26:21.735: Failed to load module "canberra-gtk-module"
Gtk-Message: 00:26:21.740: Failed to load module "canberra-gtk-module"
Gtk-Message: 00:26:22.448: Failed to load module "canberra-gtk-module"
Gtk-Message: 00:26:22.449: Failed to load module "canberra-gtk-module"
Container vir-ubuntu-20-04 exited successfully.

一般ユーザーで起動

$ id aine
uid=1000(aine) gid=1000(aine) groups=1000(aine),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),120(lpadmin),131(lxd),132(sambashare),998(docker)

$ id aine -u
1000

以下のエラーが山のように出るが、一応検索できる。標準出力に出力されている。

(firefox:1): dconf-CRITICAL **: 00:28:23.223: unable to create directory '/run/user/1000/dconf': Permission denied.  dconf will not work properly.

$ systemd-nspawn --user=aine --chdir=/home/aine --setenv=XDG_RUNTIME_DIR=/run/user/$(id aine -u) --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -U -D /var/lib/machines/vir-ubuntu-20-04 /usr/bin/firefox 1>/dev/null 2>&1

```

権限周り

実行時ユーザーに一般ユーザーをしていしても、nobody nogroupの持ち物になり、かつ所有者のみ触れるファイルやディレクトリができるため、メンテできなくなる

コンテナホストから実行者ユーザーの権限再整備することで対応。コンテナホストとコンテナゲストのUIDとGIDはあべこべなので、面白い

コンテナホストから見ると、aineだが、コンテナゲストから見るとこれはnobody nogroupである。

これらのファイルないしディレクトリを都度、再整備してやる。

```
コンテナホスト側

$ ls -alh vir-ubuntu-20-04/home/aine
合計 32K
drwxr-xr-x 4 1547174888 1547174888 4.0K  7月 28 00:28 ./
drwxr-xr-x 3 1547173888 1547173888 4.0K  7月 27 23:54 ../
-rw------- 1 1547174888 1547174888   20  7月 27 23:57 .bash_history
-rw-r--r-- 1 1547174888 1547174888  220  2月 25 21:03 .bash_logout
-rw-r--r-- 1 1547174888 1547174888 3.7K  2月 25 21:03 .bashrc
drwx------ 3 1547174888 1547174888 4.0K  7月 28 00:28 .cache/
drwx------ 5 1547174888 1547174888 4.0K  7月 28 00:28 .mozilla/
-rw-r--r-- 1 1547174888 1547174888  807  2月 25 21:03 .profile

コンテナゲスト側
$ systemd-nspawn --user=aine --chdir=/home/aine -D /var/lib/machines/vir-ubuntu-20-04 ls -alh /home/aine
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
total 32K
drwxr-xr-x 4 1547174888 1547174888 4.0K Jul 28 00:28 .
drwxr-xr-x 3 1547173888 1547173888 4.0K Jul 27 23:54 ..
-rw------- 1 1547174888 1547174888   20 Jul 27 23:57 .bash_history
-rw-r--r-- 1 1547174888 1547174888  220 Feb 25 21:03 .bash_logout
-rw-r--r-- 1 1547174888 1547174888 3.7K Feb 25 21:03 .bashrc
drwx------ 3 1547174888 1547174888 4.0K Jul 28 00:28 .cache
drwx------ 5 1547174888 1547174888 4.0K Jul 28 00:28 .mozilla
-rw-r--r-- 1 1547174888 1547174888  807 Feb 25 21:03 .profile
Container vir-ubuntu-20-04 exited successfully.

$ systemd-nspawn --user=aine --chdir=/home/aine -D /var/lib/machines/vir-ubuntu-20-04 /bin/bash
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.

aine@vir-ubuntu-20-04:~$ pwd
/home/aine

aine@vir-ubuntu-20-04:~$ ls -lha
total 32K
drwxr-xr-x 4 1547174888 1547174888 4.0K Jul 28 00:28 .
drwxr-xr-x 3 1547173888 1547173888 4.0K Jul 27 23:54 ..
-rw------- 1 1547174888 1547174888   20 Jul 27 23:57 .bash_history
-rw-r--r-- 1 1547174888 1547174888  220 Feb 25 21:03 .bash_logout
-rw-r--r-- 1 1547174888 1547174888 3.7K Feb 25 21:03 .bashrc
drwx------ 3 1547174888 1547174888 4.0K Jul 28 00:28 .cache
drwx------ 5 1547174888 1547174888 4.0K Jul 28 00:28 .mozilla
-rw-r--r-- 1 1547174888 1547174888  807 Feb 25 21:03 .profile

不便
aine@vir-ubuntu-20-04:~$ cd .cache/
bash: cd: .cache/: Permission denied

コンテナホスト側から実行
$ chown -R aine:aine vir-ubuntu-20-04/home/aine

$ systemd-nspawn --user=aine --chdir=/home/aine -D /var/lib/machines/vir-ubuntu-20-04 ls -alh /home/aine
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
total 32K
drwxr-xr-x 4 aine       aine       4.0K Jul 28 00:28 .
drwxr-xr-x 3 1547173888 1547173888 4.0K Jul 27 23:54 ..
-rw------- 1 aine       aine         20 Jul 27 23:57 .bash_history
-rw-r--r-- 1 aine       aine        220 Feb 25 21:03 .bash_logout
-rw-r--r-- 1 aine       aine       3.7K Feb 25 21:03 .bashrc
drwx------ 3 aine       aine       4.0K Jul 28 00:28 .cache
drwx------ 5 aine       aine       4.0K Jul 28 00:28 .mozilla
-rw-r--r-- 1 aine       aine        807 Feb 25 21:03 .profile
Container vir-ubuntu-20-04 exited successfully.


コンテナゲスト側
$ systemd-nspawn --user=aine --chdir=/home/aine -D /var/lib/machines/vir-ubuntu-20-04 /bin/bash
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.

便利になった
aine@vir-ubuntu-20-04:cd .cache/
aine@vir-ubuntu-20-04:~/.cache$ pwd
/home/aine/.cache

```

日本語化

machinectlの場合

```
$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt install -y locales

$ machinectl shell root@vir-ubuntu-20-04 /usr/sbin/locale-gen ja_JP.UTF-8

環境変数は渡さなくてもでる
$ machinectl shell root@vir-ubuntu-20-04 /bin/bash
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
root@aine-MS-7B98:~# echo うんこ
うんこ

```

systemd-nspawnの場合

```
$ systemd-nspawn -D /var/lib/machines/vir-ubuntu-20-04 /bin/which apt
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
/usr/bin/apt
Container vir-ubuntu-20-04 exited successfully.



$ systemd-nspawn -D /var/lib/machines/vir-ubuntu-20-04 /usr/bin/apt install -y locales


$ systemd-nspawn -D /var/lib/machines/vir-ubuntu-20-04 /bin/which locale-gen
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
/usr/sbin/locale-gen
Container vir-ubuntu-20-04 exited successfully.


$ systemd-nspawn -D /var/lib/machines/vir-ubuntu-20-04 /usr/sbin/locale-gen ja_JP.UTF-8
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
Generating locales (this might take a while)...
  ja_JP.UTF-8... done
Generation complete.
Container vir-ubuntu-20-04 exited successfully.


環境変数は渡さないとだめ
$ systemd-nspawn --setenv=LANG=ja_JP.UTF-8 -D /var/lib/machines/vir-ubuntu-20-04 /bin/bash
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
root@vir-ubuntu-20-04:/# echo うんこ
うんこ

```


- POST

物理削除したら、この作業いらんことに気づいた。

```
コンテナゲストの自動起動解除

$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl disable systemd-networkd
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
Removed /etc/systemd/system/dbus-org.freedesktop.network1.service.
Removed /etc/systemd/system/sockets.target.wants/systemd-networkd.socket.
Removed /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service.
Removed /etc/systemd/system/multi-user.target.wants/systemd-networkd.service.
Connection to machine vir-ubuntu-20-04 terminated.


コンテナゲストのネットワークサービス停止（ソケット）
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl stop systemd-networkd.socket
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.

Connection to machine vir-ubuntu-20-04 terminated.


コンテナゲストのネットワークサービス停止（ソケット以外）
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl stop systemd-networkd
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.

Connection to machine vir-ubuntu-20-04 terminated.

コンテナゲストのネットワークサービス強制停止
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl kill systemd-networkd
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.

Connection to machine vir-ubuntu-20-04 terminated.


コンテナホスト側でのコンテナゲストの自動起動解除
$ systemctl disable systemd-nspawn@vir-ubuntu-20-04.service
Removed /etc/systemd/system/machines.target.wants/systemd-nspawn@vir-ubuntu-20-04.service.

コンテナホスト側でのコンテナゲストの停止
$ systemctl stop systemd-nspawn@vir-ubuntu-20-04.service

コンテナホスト側でのコンテナゲストの強制停止
$ systemctl kill systemd-nspawn@vir-ubuntu-20-04.service
Removed /etc/systemd/system/machines.target.wants/systemd-nspawn@vir-ubuntu-20-04.service.

コンテナゲストファイルの物理削除

$ cd /var/lib/machines
$ rm -rf vir-ubuntu-20-04
```

IME

machinectlの場合

```
$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt install -y ibus-mozc

root@aine-MS-7B98:~# ibus-daemon -dxr

root         104  0.0  0.0 306240  5892 ?        Ssl  19:10   0:00 ibus-daemon -dxr
root         107  0.0  0.0 158260  6048 ?        Sl   19:10   0:00 /usr/libexec/ibus-memconf
root         110  0.0  0.0   7084  3896 ?        Ss   19:10   0:00 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root         118  0.0  0.0 232060  6260 ?        Sl   19:10   0:00 /usr/libexec/ibus-portal


$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/ps auxwwf
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0 169780 11920 ?        Ss   01:19   0:00 /usr/lib/systemd/systemd
root          16  0.0  0.0  35172 11996 ?        Ss   01:19   0:00 /lib/systemd/systemd-journald
systemd+      43  0.0  0.0  26740  7872 ?        Ss   01:19   0:00 /lib/systemd/systemd-networkd
systemd+      52  0.0  0.0  24112 12672 ?        Ss   01:19   0:00 /lib/systemd/systemd-resolved
root          54  0.0  0.0   5568  2636 ?        Ss   01:19   0:00 /usr/sbin/cron -f
message+      55  0.0  0.0   7376  4040 ?        Ss   01:19   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root          57  0.0  0.0  26196 17748 ?        Ss   01:19   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog        58  0.0  0.0 224476  4432 ?        Ssl  01:19   0:00 /usr/sbin/rsyslogd -n -iNONE
root          60  0.0  0.0  16960  7848 ?        Ss   01:19   0:00 /lib/systemd/systemd-logind
root          67  0.0  0.0   4384  2036 pts/0    Ss+  01:19   0:00 /sbin/agetty -o -p -- \u --noclear --keep-baud console 115200,38400,9600 vt220
root        9682  0.0  0.0   8768  3316 pts/1    Rs+  01:30   0:00 /usr/bin/ps auxwwf
root        9691  0.0  0.0 171168  4816 pts/1    S+   01:30   0:00  \_ (sd-
root        9684  0.0  0.0  18316  9196 ?        Ss   01:30   0:00 /lib/systemd/systemd --user
root        9685  0.0  0.0 170976  4744 ?        S    01:30   0:00  \_ (sd-pam)
Connection to machine vir-ubuntu-20-04 terminated.


rootユーザーで常駐化
$ machinectl shell root@vir-ubuntu-20-04 /bin/which ibus-daemon
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/ibus-daemon
Connection to machine vir-ubuntu-20-04 terminated.

$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/ibus-daemon -dxr
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.

Connection to machine vir-ubuntu-20-04 terminated.

$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/ps auxwwf
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0 169780 11920 ?        Ss   01:19   0:00 /usr/lib/systemd/systemd
root          16  0.0  0.0  35172 12100 ?        Ss   01:19   0:00 /lib/systemd/systemd-journald
systemd+      43  0.0  0.0  26740  7872 ?        Ss   01:19   0:00 /lib/systemd/systemd-networkd
systemd+      52  0.0  0.0  24112 12672 ?        Ss   01:19   0:00 /lib/systemd/systemd-resolved
root          54  0.0  0.0   5568  2636 ?        Ss   01:19   0:00 /usr/sbin/cron -f
message+      55  0.0  0.0   7376  4040 ?        Ss   01:19   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root          57  0.0  0.0  26196 17748 ?        Ss   01:19   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog        58  0.0  0.0 224476  4432 ?        Ssl  01:19   0:00 /usr/sbin/rsyslogd -n -iNONE
root          60  0.0  0.0  16960  7848 ?        Ss   01:19   0:00 /lib/systemd/systemd-logind
root          67  0.0  0.0   4384  2036 pts/0    Ss+  01:19   0:00 /sbin/agetty -o -p -- \u --noclear --keep-baud console 115200,38400,9600 vt220
root        9712  0.2  0.0  18316  9444 ?        Ss   01:31   0:00 /lib/systemd/systemd --user
root        9713  0.0  0.0 170976  4744 ?        S    01:31   0:00  \_ (sd-pam)
root        9725  0.0  0.0   7084  3804 ?        Ss   01:31   0:00  \_ /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root        9734  0.0  0.0 233196  6044 ?        Sl   01:31   0:00  \_ /usr/libexec/ibus-portal
root        9720  0.2  0.0 307640  6076 ?        Ssl  01:31   0:00 /usr/bin/ibus-daemon -dxr
root        9723  0.0  0.0 159396  5972 ?        Sl   01:31   0:00  \_ /usr/libexec/ibus-memconf
root        9741  0.0  0.0   8768  3356 pts/1    Rs+  01:31   0:00 /usr/bin/ps auxwwf
root        9742  0.0  0.0 171168  4816 pts/1    S+   01:31   0:00  \_ (sd-
Connection to machine vir-ubuntu-20-04 terminated.

一般ユーザーからも見える
$ machinectl shell aine@vir-ubuntu-20-04 /usr/bin/ps auxwwf
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0 169780 11920 ?        Ss   01:19   0:00 /usr/lib/systemd/systemd
root          16  0.0  0.0  43368 15876 ?        Ss   01:19   0:00 /lib/systemd/systemd-journald
systemd+      43  0.0  0.0  26740  7872 ?        Ss   01:19   0:00 /lib/systemd/systemd-networkd
systemd+      52  0.0  0.0  24112 12672 ?        Ss   01:19   0:00 /lib/systemd/systemd-resolved
root          54  0.0  0.0   5568  2636 ?        Ss   01:19   0:00 /usr/sbin/cron -f
message+      55  0.0  0.0   7580  4552 ?        Ss   01:19   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root          57  0.0  0.0  26196 17748 ?        Ss   01:19   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog        58  0.0  0.0 224476  4432 ?        Ssl  01:19   0:00 /usr/sbin/rsyslogd -n -iNONE
root          60  0.0  0.0  16960  7848 ?        Ss   01:19   0:00 /lib/systemd/systemd-logind
root          67  0.0  0.0   4384  2036 pts/0    Ss+  01:19   0:00 /sbin/agetty -o -p -- \u --noclear --keep-baud console 115200,38400,9600 vt220
root        9712  0.0  0.0  18316  9480 ?        Ss   01:31   0:00 /lib/systemd/systemd --user
root        9713  0.0  0.0 170976  4744 ?        S    01:31   0:00  \_ (sd-pam)
root        9725  0.0  0.0   7084  3804 ?        Ss   01:31   0:00  \_ /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root        9734  0.0  0.0 233196  6120 ?        Sl   01:31   0:00  \_ /usr/libexec/ibus-portal
root        9720  0.0  0.0 307640  6096 ?        Ssl  01:31   0:00 /usr/bin/ibus-daemon -dxr
root        9723  0.0  0.0 159396  5972 ?        Sl   01:31   0:00  \_ /usr/libexec/ibus-memconf
aine        9760  0.0  0.0   8768  3288 pts/1    Rs+  01:32   0:00 /usr/bin/ps auxwwf
aine        9769  0.0  0.0 171168  4824 pts/1    S+   01:32   0:00  \_ (sd-
aine        9762  0.0  0.0  18320  9356 ?        Ss   01:32   0:00 /lib/systemd/systemd --user
aine        9763  0.0  0.0 170976  4752 ?        S    01:32   0:00  \_ (sd-pam)
Connection to machine vir-ubuntu-20-04 terminated.


```


ファイラーを開く

なぞ。ちゃんとみえる。xterm開けばいいんじゃないか。

```
$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt install -y nautilus


$ machinectl shell root@vir-ubuntu-20-04 /bin/which nautilus
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/nautilus
Connection to machine vir-ubuntu-20-04 terminated.

$ systemd-nspawn --user=root --chdir=/root --setenv=XDG_RUNTIME_DIR=/run/user/$(id -u) --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -U -D /var/lib/machines/vir-ubuntu-20-04 bash -c 'nautilus'

```


ターミナルエミュレータ

起動できた。

起動できたエミュレータからfirefoxも起動できた。

```
$ machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt install -y gnome-terminal

$ machinectl shell root@vir-ubuntu-20-04 /bin/which gnome-terminal
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
/usr/bin/gnome-terminal
Connection to machine vir-ubuntu-20-04 terminated.


$ systemd-nspawn --user=root --chdir=/root --setenv=XDG_RUNTIME_DIR=/run/user/$(id -u) --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -U -D /var/lib/machines/vir-ubuntu-20-04 bash -c 'gnome-terminal'
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
Selected user namespace base 1547173888 and range 65536.
# Couldn't register with accessibility bus: Did not receive a reply. Possible causes include: the remote application did not send a reply, the message bus security policy blocked the reply, the reply timeout expired, or the network connection was broken.
# _g_io_module_get_default: Found default implementation local (GLocalVfs) for ‘gio-vfs’
# posix_spawn avoided (fd close requested) 
# _g_io_module_get_default: Found default implementation dconf (DConfSettingsBackend) for ‘gsettings-backend’
# watch_fast: "/org/gnome/terminal/legacy/" (establishing: 0, active: 0)
# unwatch_fast: "/org/gnome/terminal/legacy/" (active: 0, establishing: 1)
# watch_established: "/org/gnome/terminal/legacy/" (establishing: 0)
Container vir-ubuntu-20-04 exited successfully.

- https://bbs.archlinux.org/viewtopic.php?pid=1438842#p1438842


$ systemd-nspawn --user=root --chdir=/root --setenv=XDG_RUNTIME_DIR=/run/user/$(id -u) --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -U -D /var/lib/machines/vir-ubuntu-20-04 bash -c 'export NO_AT_BRIDGE=1 && gnome-terminal'
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
Selected user namespace base 1547173888 and range 65536.
# _g_io_module_get_default: Found default implementation local (GLocalVfs) for ‘gio-vfs’
# posix_spawn avoided (fd close requested) 
# _g_io_module_get_default: Found default implementation dconf (DConfSettingsBackend) for ‘gsettings-backend’
# watch_fast: "/org/gnome/terminal/legacy/" (establishing: 0, active: 0)
# unwatch_fast: "/org/gnome/terminal/legacy/" (active: 0, establishing: 1)
# watch_established: "/org/gnome/terminal/legacy/" (establishing: 0)
Container vir-ubuntu-20-04 exited successfully.

$ systemd-nspawn --user=root --chdir=/root --setenv=XDG_RUNTIME_DIR=/run/user/$(id -u) --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -U -D /var/lib/machines/vir-ubuntu-20-04 bash -c 'export NO_AT_BRIDGE=1 && gnome-terminal && sleep 10'

一日アップ
$ systemd-nspawn --user=root --chdir=/root --setenv=XDG_RUNTIME_DIR=/run/user/$(id -u) --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -U -D /var/lib/machines/vir-ubuntu-20-04 bash -c 'export NO_AT_BRIDGE=1 && gnome-terminal && sleep 86400'
`
LANG tukereba ikesou
--setenv=LANG=ja_JP.UTF-8

$ systemd-nspawn --setenv=LANG=ja_JP.UTF-8 --user=root --chdir=/root --setenv=XDG_RUNTIME_DIR=/run/user/$(id -u) --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -U -D /var/lib/machines/vir-ubuntu-20-04 bash -c 'export NO_AT_BRIDGE=1 && gnome-terminal && sleep 86400'

```

課題

```
machinectlでのIMEの常駐化はできるが、X転送がきつい

systemd-nspawnではX転送いけるが、IMEの常駐化がムズイ

これでいけたらよかった
$ systemd-nspawn --user=root --chdir=/root --setenv=XDG_RUNTIME_DIR=/run/user/$(id -u) --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -U -D /var/lib/machines/vir-ubuntu-20-04 bash -c 'ibus-daemon -dxr && sleep 5 && export GTK_IM_MODULE=ibus && export XMODIFIERS=@im=ibus && export QT_IM_MODULE=ibus && ps uaxwwf && firefox'
```
