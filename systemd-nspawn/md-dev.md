- PRE

```
$ sudo apt install -y debootstrap
$ sudo apt install -y systemd-container
$ which systemd-nspawn
```

ポイントは自動起動設定後の再起動

コンテナホストOSとコンテナゲストOSのバージョン同じなら、事前にコピーしておけばおｋ

こんな感じ
```
$ cp /etc/apt/sources.list /var/lib/machines/vir-ubuntu-20-04/etc/apt/sources.list
```

コンテナの作成

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

疎通確認

確認する前に一度、コンテナホストを再起動しておく

コンテナ内から外部へ出ていけるか

```

$ machinectl start vir-ubuntu-20-04

$ machinectl list
MACHINE          CLASS     SERVICE        OS     VERSION ADDRESSES
vir-ubuntu-20-04 container systemd-nspawn ubuntu 20.04   -        

1 machines listed.


root@aine-MS-7B98:~# apt update


root@aine-MS-7B98:~# apt install -y iputils-tracepath  dnsutils x11-apps


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
```
ソケットファイル共有すればこれでうごく
$ systemd-nspawn --setenv=DISPLAY=:0.0 --bind=/tmp/.X11-unix -D /var/lib/machines/vir-ubuntu-20-04 xeyes
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
