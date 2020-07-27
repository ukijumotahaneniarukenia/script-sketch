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


$ machinectl shell aine@vir-ubuntu-20-04 /bin/bash

#マシン名の変更がうまく行ってないんだよな。machinectlの場合
aine@aine-MS-7B98:~$ sudo echo うんこ
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

$ machinectl shell aine@vir-ubuntu-20-04 /bin/bash
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
aine@aine-MS-7B98:~$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0 169808 11740 ?        Ss   22:58   0:00 /usr/lib/systemd/systemd
root          16  0.0  0.0  51624 15540 ?        Ss   22:58   0:00 /lib/systemd/systemd-journald
systemd+      46  0.0  0.0  26740  8052 ?        Ss   22:58   0:00 /lib/systemd/systemd-networkd
systemd+      52  0.0  0.0  24112 12428 ?        Ss   22:58   0:00 /lib/systemd/systemd-resolved
root          54  0.0  0.0   5568  2824 ?        Ss   22:58   0:00 /usr/sbin/cron -f
message+      55  0.0  0.0   7376  3996 ?        Ss   22:58   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root          57  0.0  0.0  26196 17744 ?        Ss   22:58   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog        58  0.0  0.0 224476  4468 ?        Ssl  22:58   0:00 /usr/sbin/rsyslogd -n -iNONE
root          59  0.0  0.0  16956  7632 ?        Ss   22:58   0:00 /lib/systemd/systemd-logind
root          67  0.0  0.0   4384  2176 pts/0    Ss+  22:58   0:00 /sbin/agetty -o -p -- \u --noclear --keep-baud console 115200,38400,9600 vt220
aine        8071  0.0  0.0   5992  3840 pts/1    Ss   23:11   0:00 /bin/bash
aine        8073  0.0  0.0  18172  8848 ?        Ss   23:11   0:00 /lib/systemd/systemd --user
aine        8074  0.0  0.0 171004  4612 ?        S    23:11   0:00 (sd-pam)
aine        8078  0.0  0.0 171196  4684 pts/1    S    23:11   0:00 (sd-pa
aine        8085  0.0  0.0   7632  3200 pts/1    R+   23:11   0:00 ps aux
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

$ systemd-nspawn --user=aine --chdir=/home/aine --setenv=DISPLAY=:0.0 --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -D /var/lib/machines/vir-ubuntu-20-04 /bin/bash
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
aine@vir-ubuntu-20-04:~$ ps uax
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
aine           1  0.2  0.0   4240  3436 pts/0    Ss   23:33   0:00 /bin/bash
aine          10  0.0  0.0   5880  2892 pts/0    R+   23:34   0:00 ps uax



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


コンテナゲスト起動


フォアグランド起動の場合は**Ctrl+]**を３回連打でexit

一般ユーザーで起動

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

$ systemd-nspawn --user=kuraine --setenv=DISPLAY=:0.0 --bind=/tmp/.X11-unix -D /var/lib/machines/vir-ubuntu-20-04 firefox


これででた。日本語フォントいれてないが。--bind=/run/systemdをマウントしていると出た。/run/systemdはreadonlyだと怒られた。
$ systemd-nspawn --user=kuraine --setenv=DISPLAY=:0.0 --bind=/run/udev --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id -D /var/lib/machines/vir-ubuntu-20-04 firefox

ブラウザの挙動の違いかと思い、brave-browserでも試した。これはアドレス周りの問題になった。

基本dbusソケットのセッションが実行ユーザー単位の制御になっているので、コンテナホストと同じファイルをコンテナゲストにマウントして借用させて上げる場合は
コンテナホストとコンテナゲストのユーザーは同一人物にしておくといける

brave-browserはこれでいけた。--bind-ro=/dev/dri
$ systemd-nspawn --user=aine --setenv=DISPLAY=:0.0 --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -D /var/lib/machines/vir-ubuntu-20-04 brave-browser


```

権限周り

実行時ユーザーに一般ユーザーをしていしても、nobody nogroupの持ち物になり、かつ所有者のみ触れるファイルやディレクトリができるため、メンテできなくなる

コンテナホストから実行者ユーザーの権限再整備することで対応。コンテナホストとコンテナゲストのUIDとGIDはあべこべなので、面白い

コンテナホストから見ると、aineだが、コンテナゲストから見るとこれはnobody nogroupである。

これらのファイルないしディレクトリを都度、再整備してやる。

```
コンテナホスト側

$ ls -alh vir-ubuntu-20-04/home/aine
合計 52K
drwxr-xrwx 9 1547174888 1547174888 4.0K  7月 27 12:01 ./
drwxr-xr-x 4 1547173888 1547173888 4.0K  7月 27 10:53 ../
-rwxr-xrwx 1 1547174888 1547174888  439  7月 27 12:19 .bash_history*
-rwxr-xrwx 1 1547174888 1547174888  220  2月 25 21:03 .bash_logout*
-rwxr-xrwx 1 1547174888 1547174888 3.7K  2月 25 21:03 .bashrc*
drwx------ 7 aine       aine       4.0K  7月 27 11:03 .cache/
drwx------ 3 1547174888 1547174888 4.0K  7月 27 11:01 .config/
drwxr-xr-x 2 1547174888 1547174888 4.0K  7月 27 12:01 .fontconfig/
drwxrwxr-x 3 1547174888 1547174888 4.0K  7月 27 12:00 .fonts/
drwxr-xr-x 3 aine       aine       4.0K  7月 27 11:01 .local/
drwx------ 5 aine       aine       4.0K  7月 27 10:58 .mozilla/
drwx------ 3 aine       aine       4.0K  7月 27 11:01 .pki/
-rwxr-xrwx 1 1547174888 1547174888  807  2月 25 21:03 .profile*

$ chown -R 1547174888:1547174888 vir-ubuntu-20-04/home/aine/{.cache,.local,.mozilla,.pki}


$ ls -alh vir-ubuntu-20-04/home/aine
合計 52K
drwxr-xrwx 9 1547174888 1547174888 4.0K  7月 27 12:01 ./
drwxr-xr-x 4 1547173888 1547173888 4.0K  7月 27 10:53 ../
-rwxr-xrwx 1 1547174888 1547174888  439  7月 27 12:19 .bash_history*
-rwxr-xrwx 1 1547174888 1547174888  220  2月 25 21:03 .bash_logout*
-rwxr-xrwx 1 1547174888 1547174888 3.7K  2月 25 21:03 .bashrc*
drwx------ 7 1547174888 1547174888 4.0K  7月 27 11:03 .cache/
drwx------ 3 1547174888 1547174888 4.0K  7月 27 11:01 .config/
drwxr-xr-x 2 1547174888 1547174888 4.0K  7月 27 12:01 .fontconfig/
drwxrwxr-x 3 1547174888 1547174888 4.0K  7月 27 12:00 .fonts/
drwxr-xr-x 3 1547174888 1547174888 4.0K  7月 27 11:01 .local/
drwx------ 5 1547174888 1547174888 4.0K  7月 27 10:58 .mozilla/
drwx------ 3 1547174888 1547174888 4.0K  7月 27 11:01 .pki/
-rwxr-xrwx 1 1547174888 1547174888  807  2月 25 21:03 .profile*

コンテナゲスト側
$ machinectl shell aine@vir-ubuntu-20-04 /bin/bash
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.


aine@aine-MS-7B98:~$ ls -alh
total 52K
drwxr-xrwx 9 aine aine 4.0K Jul 27 12:01 .
drwxr-xr-x 4 root root 4.0K Jul 27 10:53 ..
-rwxr-xrwx 1 aine aine  439 Jul 27 12:19 .bash_history
-rwxr-xrwx 1 aine aine  220 Feb 25 21:03 .bash_logout
-rwxr-xrwx 1 aine aine 3.7K Feb 25 21:03 .bashrc
drwx------ 7 aine aine 4.0K Jul 27 11:03 .cache
drwx------ 3 aine aine 4.0K Jul 27 11:01 .config
drwxr-xr-x 2 aine aine 4.0K Jul 27 12:01 .fontconfig
drwxrwxr-x 3 aine aine 4.0K Jul 27 12:00 .fonts
drwxr-xr-x 3 aine aine 4.0K Jul 27 11:01 .local
drwx------ 5 aine aine 4.0K Jul 27 10:58 .mozilla
drwx------ 3 aine aine 4.0K Jul 27 11:01 .pki
-rwxr-xrwx 1 aine aine  807 Feb 25 21:03 .profile


コンテナホスト側
$ ls -lah vir-ubuntu-20-04/home
合計 16K
drwxr-xr-x  4 1547173888 1547173888 4.0K  7月 27 10:53 ./
drwxr-xr-x 17 1547173888 1547173888 4.0K  7月 26 19:14 ../
drwxr-xrwx 10 1547174888 1547174888 4.0K  7月 27 12:46 aine/
drwxrwxrwx  8 1547173888 1547173888 4.0K  7月 27 10:49 kuraine/


$ rm -rf  vir-ubuntu-20-04/home/kuraine


$ ls -lah vir-ubuntu-20-04/home
合計 12K
drwxr-xr-x  3 1547173888 1547173888 4.0K  7月 27 12:48 ./
drwxr-xr-x 17 1547173888 1547173888 4.0K  7月 26 19:14 ../
drwxr-xrwx 10 1547174888 1547174888 4.0K  7月 27 12:46 aine/


ただし、ブラウザなど、実行時ユーザーに依存するようなGUIを起動する際は権限をコンテナホスト側でもどしておく。少々めんどいが、これだけなので、いい。
$ chown -R aine:aine /var/lib/machines/vir-ubuntu-20-04/home/aine

日本語化してはいる
$ systemd-nspawn --quiet --user=root --chdir=/root --setenv=LANG=ja_JP.UTF-8 --setenv=DISPLAY=:0.0 --bind-ro=/etc/localtime --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -D /var/lib/machines/vir-ubuntu-20-04 /bin/bash

$ systemd-nspawn --quiet --user=aine --chdir=/home/aine --setenv=LANG=ja_JP.UTF-8 --setenv=DISPLAY=:0.0 --bind-ro=/etc/localtime --bind-ro=/sys/fs/cgroup --bind=/run/systemd --bind-ro=/tmp/.X11-unix --bind-ro=/var/run/dbus --bind-ro=/var/lib/dbus --bind-ro=/etc/machine-id --bind-ro=/dev/dri -D /var/lib/machines/vir-ubuntu-20-04 /bin/bash


machinectlではいるとsystemdが

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
