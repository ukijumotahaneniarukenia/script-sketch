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

$ systemd-nspawn --version
systemd 245 (245.4-4ubuntu3.2)
+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid

```

ポイントは自動起動設定後の再起動

コンテナホストOSとコンテナゲストOSのバージョン同じなら、事前にコピーしておけばおｋ

こんな感じ
```
$ cp /etc/apt/sources.list /var/lib/machines/vir-ubuntu-20-04/etc/apt/sources.list
```

コンテナの作成
  - https://www.debian.org/releases/jessie/powerpc/apds03.html.ja
  - https://wiki.debian.org/Debootstrap

```
$ mkdir -p /var/lib/machines/vir-ubuntu-20-04

５分ぐらいかかる
$ time debootstrap --arch=amd64 focal /var/lib/machines/vir-ubuntu-20-04 http://archive.ubuntu.com/ubuntu

標準出力に以下のINFOログの文言が出力されればOK

I: Base system installed successfully.

以下のように最小構成のコンテナが入った。

$ ls -lh /var/lib/machines/vir-ubuntu-20-04/
合計 60K
lrwxrwxrwx  1 root root    7  7月 26 13:03 bin -> usr/bin/
drwxr-xr-x  2 root root 4.0K  4月 15 20:09 boot/
drwxr-xr-x  4 root root 4.0K  7月 26 13:03 dev/
drwxr-xr-x 59 root root 4.0K  7月 26 13:04 etc/
drwxr-xr-x  2 root root 4.0K  4月 15 20:09 home/
lrwxrwxrwx  1 root root    7  7月 26 13:03 lib -> usr/lib/
lrwxrwxrwx  1 root root    9  7月 26 13:03 lib32 -> usr/lib32/
lrwxrwxrwx  1 root root    9  7月 26 13:03 lib64 -> usr/lib64/
lrwxrwxrwx  1 root root   10  7月 26 13:03 libx32 -> usr/libx32/
drwxr-xr-x  2 root root 4.0K  7月 26 13:03 media/
drwxr-xr-x  2 root root 4.0K  7月 26 13:03 mnt/
drwxr-xr-x  2 root root 4.0K  7月 26 13:03 opt/
drwxr-xr-x  2 root root 4.0K  4月 15 20:09 proc/
drwx------  2 root root 4.0K  7月 26 13:03 root/
drwxr-xr-x  8 root root 4.0K  7月 26 13:04 run/
lrwxrwxrwx  1 root root    8  7月 26 13:03 sbin -> usr/sbin/
drwxr-xr-x  2 root root 4.0K  7月 26 13:03 srv/
drwxr-xr-x  2 root root 4.0K  4月 15 20:09 sys/
drwxrwxrwt  2 root root 4.0K  7月 26 13:04 tmp/
drwxr-xr-x 13 root root 4.0K  7月 26 13:03 usr/
drwxr-xr-x 11 root root 4.0K  7月 26 13:03 var/

```

コンテナに入る

- https://qiita.com/n01e0/items/3146b9a749907e93ab93

```
$ cd /var/lib/machines

$ machinectl start vir-ubuntu-20-04
root ukijumotahaneniarukenia aine-MS-7B98 17:04:31 /var/lib/machines$

$ machinectl list
MACHINE          CLASS     SERVICE        OS     VERSION ADDRESSES
vir-ubuntu-20-04 container systemd-nspawn ubuntu 20.04   -        

1 machines listed.
```

コンテナホスト起動時にコンテナゲストも自動起動するように設定

```
systemctl enable systemd-nspawn@vir-ubuntu-20-04.service
```


コンテナホスト上でネットワークサービスの自動起動設定と開始、状態確認

- https://wiki.debian.org/nspawn

```
$ systemctl enable systemd-networkd
$ systemctl start systemd-networkd
$ systemctl status systemd-networkd
```


コンテナゲスト上でネットワークサービスの自動起動設定と開始、状態確認

```
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl enable systemd-networkd
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl start systemd-networkd
$ machinectl shell root@vir-ubuntu-20-04 /bin/systemctl status systemd-networkd
```



コンテナにログイン


```
machinectl shell root@vir-ubuntu-20-04 /bin/bash
```

コンテナ側での操作

レポジトリの設定

```
sed -i.bak 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list
```

DNSの設定など

```
sed -i.bak 's/#DNS=/DNS=8.8.8.8/' /etc/systemd/resolved.conf
```

一般ユーザーの作成とrootユーザーのパスワードを設定

```
DEFAULT_USER_ID=9999
DEFAULT_USER_NAME=kuraine
DEFAULT_GROUP_ID=9999
DEFAULT_GROUP_NAME=kuraine


groupadd -g $DEFAULT_GROUP_ID $DEFAULT_GROUP_NAME && \
useradd -m -g $DEFAULT_GROUP_NAME -u $DEFAULT_USER_ID $DEFAULT_USER_NAME && \
chsh -s /bin/bash $DEFAULT_USER_NAME && \
echo $DEFAULT_USER_NAME':'$DEFAULT_USER_NAME'_pwd' | chpasswd && \
echo "$DEFAULT_USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
echo 'root:root_pwd' | chpasswd


一般ユーザーでsudoが使えるように

- https://qiita.com/tukiyo3/items/3642a99bd971fa829246

echo "Set disable_coredump false" >> /etc/sudo.conf


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


$ machinectl shell kuraine@vir-ubuntu-20-04 /bin/bash

kuraine@aine-MS-7B98:~$ sudo echo うんこ
うんこ


$ machinectl shell root@vir-ubuntu-20-04 /bin/bash
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.


root@aine-MS-7B98:~# apt update


root@aine-MS-7B98:~# apt install -y iputils-tracepath  dnsutils x11-apps traceroute


root@aine-MS-7B98:~# nslookup www.google.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	www.google.com
Address: 172.217.175.228
Name:	www.google.com
Address: 2404:6800:4004:80f::2004

root@aine-MS-7B98:~# tracepath 172.217.175.228
 1?: [LOCALHOST]                      pmtu 1500
 1:  _gateway                                              0.102ms 
 1:  _gateway                                              0.028ms 
 2:  192.168.1.1                                           0.595ms 
 3:  192.168.1.1                                           0.698ms pmtu 1454
 3:  nas827.p-kanagawa.nttpc.ne.jp                        17.375ms 
 4:  210.139.125.173                                      17.809ms 
 5:  210.165.249.181                                      19.048ms 
 6:  p254--504.tky-nk-acr02.sphere.ad.jp                  17.518ms 
 7:  no reply
 8:  72.14.213.57                                         22.189ms asymm 13 
 9:  no reply
10:  no reply
11:  no reply
12:  no reply
13:  no reply
14:  no reply
15:  no reply

root@aine-MS-7B98:~# traceroute www.google.com
traceroute to www.google.com (172.217.175.4), 30 hops max, 60 byte packets
 1  _gateway (192.168.106.129)  0.055 ms  0.022 ms  0.017 ms
 2  192.168.1.1 (192.168.1.1)  0.381 ms  1.294 ms  1.228 ms
 3  nas827.p-kanagawa.nttpc.ne.jp (210.153.251.235)  13.117 ms  13.065 ms  13.011 ms
 4  210.139.125.173 (210.139.125.173)  12.935 ms  13.238 ms  13.287 ms
 5  210.165.249.181 (210.165.249.181)  13.730 ms  13.823 ms  13.771 ms
 6  p254--504.tky-nk-acr02.sphere.ad.jp (210.153.241.113)  14.526 ms  16.182 ms  16.072 ms
 7  * * *
 8  210.150.215.242 (210.150.215.242)  9.633 ms 72.14.213.57 (72.14.213.57)  9.404 ms 72.14.205.32 (72.14.205.32)  9.672 ms
 9  * 108.170.242.193 (108.170.242.193)  10.512 ms *
10  142.250.226.58 (142.250.226.58)  9.619 ms 142.250.226.6 (142.250.226.6)  9.567 ms 108.170.227.93 (108.170.227.93)  10.469 ms
11  72.14.233.35 (72.14.233.35)  10.501 ms nrt20s18-in-f4.1e100.net (172.217.175.4)  9.386 ms  9.994 ms

root@aine-MS-7B98:~# traceroute ukijumotahaneniarukenia.site
traceroute to ukijumotahaneniarukenia.site (133.18.59.242), 30 hops max, 60 byte packets
 1  _gateway (192.168.106.129)  0.058 ms  0.020 ms  0.017 ms
 2  192.168.1.1 (192.168.1.1)  1.294 ms  1.235 ms  1.187 ms
 3  nas827.p-kanagawa.nttpc.ne.jp (210.153.251.235)  5.296 ms  5.257 ms  5.201 ms
 4  210.139.125.173 (210.139.125.173)  5.432 ms  5.389 ms  5.211 ms
 5  210.165.249.181 (210.165.249.181)  5.605 ms  5.566 ms  5.510 ms
 6  p254--504.tky-nk-acr02.sphere.ad.jp (210.153.241.113)  7.271 ms  7.936 ms  11.762 ms
 7  * p102--2026.k-otemachi-core1.sphere.ad.jp (202.239.117.33)  10.271 ms *
 8  210.150.215.190 (210.150.215.190)  10.102 ms  10.104 ms 128.22.12.5 (128.22.12.5)  10.030 ms
 9  60.56.5.137 (60.56.5.137)  16.200 ms  16.117 ms  16.371 ms
10  203.140.81.222 (203.140.81.222)  16.446 ms 219.122.245.2 (219.122.245.2)  16.529 ms 219.122.245.6 (219.122.245.6)  16.470 ms
11  180.145.255.170 (180.145.255.170)  16.080 ms 121.83.169.50 (121.83.169.50)  16.164 ms  16.263 ms
12  218.228.247.78 (218.228.247.78)  17.347 ms  15.851 ms  19.656 ms
13  124.248.144.41 (124.248.144.41)  20.205 ms  15.736 ms 124.248.144.35 (124.248.144.35)  19.602 ms
14  124.248.144.201 (124.248.144.201)  20.031 ms 124.248.144.205 (124.248.144.205)  19.970 ms 124.248.144.201 (124.248.144.201)  20.265 ms
15  124.248.155.2 (124.248.155.2)  92.022 ms  92.280 ms  92.554 ms
16  vps-wp03.kagoya.net (133.18.58.12)  19.066 ms  19.499 ms  19.443 ms
17  vwp0484.kagoya.net (133.18.59.242)  19.267 ms  15.746 ms  15.686 ms

```

X転送

- https://nosada.hatenablog.com/entry/2018/03/24/232855

コンテナホスト側でX転送許可

```
$ xhost +local:
non-network local connections being added to access control list
```

コンテナゲスト停止
```
$ machinectl terminate vir-ubuntu-20-04
```

コンテナゲスト起動

デフォルトの実行ユーザーはrootらしい。firefox起動して気づいた。

```
ソケットファイル共有すればこれでうごく
$ systemd-nspawn --setenv=DISPLAY=:0.0 --bind=/tmp/.X11-unix -D /var/lib/machines/vir-ubuntu-20-04 xeyes
```

バッググラウンドはちょっとめんどいことなったので、やめ。


```
$ systemd-nspawn --setenv=DISPLAY=:0.0 --bind=/tmp/.X11-unix -D /var/lib/machines/vir-ubuntu-20-04 xeyes &

$ jobs
[1]+  停止                  systemd-nspawn --setenv=DISPLAY=:0.0 --bind=/tmp/.X11-unix -D /var/lib/machines/vir-ubuntu-20-04 xeyes

$ fg 1
systemd-nspawn --setenv=DISPLAY=:0.0 --bind=/tmp/.X11-unix -D /var/lib/machines/vir-ubuntu-20-04 xeyes

Container vir-ubuntu-20-04 exited successfully.

```

フォアグランド起動の場合は**Ctrl+]**を３回連打でexit

一般ユーザーで起動

```
$ systemd-nspawn --user=kuraine --setenv=DISPLAY=:0.0 --bind=/tmp/.X11-unix -D /var/lib/machines/vir-ubuntu-20-04 xeyes
```

一般ユーザーで起動

firefox起動時はディレクトリ周りの権限整備

```
$ systemd-nspawn --user=kuraine --setenv=DISPLAY=:0.0 --bind=/tmp/.X11-unix -D /var/lib/machines/vir-ubuntu-20-04 firefox
```

以下のエラーでた

```
(firefox:1): dconf-CRITICAL **: 20:04:18.414: unable to create directory '/home/kuraine/.cache/dconf': Permission denied.  dconf will not work properly.

(firefox:1): dconf-CRITICAL **: 20:04:18.414: unable to create directory '/home/kuraine/.cache/dconf': Permission denied.  dconf will not work properly.

(firefox:1): dconf-CRITICAL **: 20:04:18.416: unable to create directory '/home/kuraine/.cache/dconf': Permission denied.  dconf will not work properly.

```

デバッグ

```
$ machinectl start vir-ubuntu-20-04

$ machinectl list
MACHINE          CLASS     SERVICE        OS     VERSION ADDRESSES
vir-ubuntu-20-04 container systemd-nspawn ubuntu 20.04   -        

1 machines listed.

$ machinectl shell root@vir-ubuntu-20-04 /bin/bash


root@aine-MS-7B98:~# ls- l /home
total 12
drwxr-xr-x  3 root    root    4096 Jul 26 19:59 ./
drwxr-xr-x 17 root    root    4096 Jul 26 19:14 ../
drwxr-xr-x  2 kuraine kuraine 4096 Jul 26 19:59 kuraine/

root@aine-MS-7B98:~# ls -l /home/kuraine/
total 24
drwxr-xr-x 2 kuraine kuraine 4096 Jul 26 19:59 ./
drwxr-xr-x 3 root    root    4096 Jul 26 19:59 ../
-rw------- 1 kuraine kuraine   20 Jul 26 19:59 .bash_history
-rw-r--r-- 1 kuraine kuraine  220 Feb 25 21:03 .bash_logout
-rw-r--r-- 1 kuraine kuraine 3771 Feb 25 21:03 .bashrc
-rw-r--r-- 1 kuraine kuraine  807 Feb 25 21:03 .profile

フルコンつけてみた

root@aine-MS-7B98:~# chmod 777 /home/kuraine/
root@aine-MS-7B98:~# ls -l /home/kuraine/
total 24
drwxrwxrwx 2 kuraine kuraine 4096 Jul 26 19:59 ./
drwxr-xr-x 3 root    root    4096 Jul 26 19:59 ../
-rw------- 1 kuraine kuraine   20 Jul 26 19:59 .bash_history
-rw-r--r-- 1 kuraine kuraine  220 Feb 25 21:03 .bash_logout
-rw-r--r-- 1 kuraine kuraine 3771 Feb 25 21:03 .bashrc
-rw-r--r-- 1 kuraine kuraine  807 Feb 25 21:03 .profile




$ machinectl terminate vir-ubuntu-20-04
root ukijumotahaneniarukenia aine-MS-7B98 20:09:55 /var/lib/machines$

$ machinectl list
No machines.

GUIは起動できたが、検索はできなかった。ネットワークの問題になった。

おそらくfirefoxのプロキシ設定。（勘）

$ systemd-nspawn --user=kuraine --setenv=DISPLAY=:0.0 --bind=/tmp/.X11-unix -D /var/lib/machines/vir-ubuntu-20-04 firefox

```


- POST

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
