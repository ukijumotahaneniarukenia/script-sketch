# サービス起動確認
```
systemctl status sshd
systemctl start sshd
```

## dockerホスト側からdockerコンテナ側にssh接続する検証コンテナ作成の手順

### 前回接続先情報を削除
コンテナは其の場限りでの使用がほとんど。
```
[rstudio@centos ~/unko/script_scratch/ssh]$cd /home/rstudio/.ssh/
[rstudio@centos ~/.ssh]$ll -la
合計 20
drwx------.  2 rstudio rstudio 4096  8月 27 05:41 .
drwx------. 28 rstudio rstudio 4096  8月 31 14:04 ..
-rw-------.  1 rstudio rstudio 1679  8月 31 14:05 id_rsa
-rw-r--r--.  1 rstudio rstudio  396  8月 31 14:05 id_rsa.pub
-rw-r--r--.  1 rstudio rstudio  172  8月 27 05:41 known_hosts
[rstudio@centos ~/.ssh]$>known_hosts
[rstudio@centos ~/.ssh]$ll -la
合計 16
drwx------.  2 rstudio rstudio 4096  8月 27 05:41 .
drwx------. 28 rstudio rstudio 4096  8月 31 14:04 ..
-rw-------.  1 rstudio rstudio 1679  8月 31 14:05 id_rsa
-rw-r--r--.  1 rstudio rstudio  396  8月 31 14:05 id_rsa.pub
-rw-r--r--.  1 rstudio rstudio    0  8月 31 14:06 known_hosts
```

### dockerホストで公開鍵と秘密鍵作成
```
[rstudio@centos ~]$ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/rstudio/.ssh/id_rsa): 
Created directory '/home/rstudio/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/rstudio/.ssh/id_rsa.
Your public key has been saved in /home/rstudio/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:/emrm293mqJy/n6xGwPYFkrBSuVa4AorGH18fSDyVmc rstudio@centos
The key's randomart image is:
+---[RSA 2048]----+
|    . . +oE      |
| . . o =.*..     |
|. . + +.o.= .    |
| o . = ..* + .   |
|. . . . S + +    |
|   .       o o.  |
|            o oo |
|        . .oo ++.|
|         +*O*=++ |
+----[SHA256]-----+
```

### dockerホスト側で作成した公開鍵をsshサーバーの~/.sshに配備
配備先はdocker起動時に指定したホスト側のマウントディれくトリに配備
```
[rstudio@centos ~/unko/script_scratch/ssh]$cp ~/.ssh/id_rsa.pub  $(pwd)/id_rsa.pub
[rstudio@centos ~/unko/script_scratch/ssh]$ll -la
合計 1808
drwxrwxr-x.  2 rstudio rstudio    4096  8月 31 14:09 .
drwxrwxr-x. 10 rstudio rstudio    4096  8月 31 13:47 ..
-rw-rw-r--.  1 rstudio rstudio    5031  8月 31 13:37 Dockerfile
-rw-r--r--.  1 rstudio rstudio     396  8月 31 14:09 id_rsa.pub
-rw-rw-r--.  1 rstudio rstudio 1817778  8月 31 13:48 log
-rw-rw-r--.  1 rstudio rstudio    6327  8月 31 14:08 manual.md
```

### dockerコンテナ側でdockerホストで作成した公開鍵がマウントされてきているか確認
```
[rstudio@centos ~/unko/script_scratch/ssh]$docker exec --user root -it ssh bash
bash-5.0# whoami
root
bash-5.0# ls -a
.  ..  .dockerenv  .readahead  anaconda-post.log  bin  dev  etc  home  lib  lib64  media  mnt  opt  proc  root	run  sbin  srv	sys  tmp  usr  var
bash-5.0# cd ~
bash-5.0# ls -a
.  ..  Dockerfile  id_rsa.pub  log  manual.md
```

### dockerコンテナ側でsshdサービスが起動しているか確認
```
bash-5.0# systemctl status sshd
● sshd.service - OpenSSH server daemon
   Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
   Active: active (running) since 土 2019-08-31 14:08:39 JST; 6min ago
     Docs: man:sshd(8)
           man:sshd_config(5)
 Main PID: 1434 (sshd)
   CGroup: /docker/c02fa5171284846ca8ac71eae0da2f2a042716c7ddaf92339fbf9eb4f40c5ec5/system.slice/sshd.service
           └─1434 /usr/sbin/sshd -D
           ‣ 1434 /usr/sbin/sshd -D

 8月 31 14:08:39 c02fa5171284 systemd[1]: Starting OpenSSH server daemon...
 8月 31 14:08:39 c02fa5171284 sshd[1434]: Server listening on 0.0.0.0 port 22.
 8月 31 14:08:39 c02fa5171284 sshd[1434]: Server listening on :: port 22.
 8月 31 14:08:39 c02fa5171284 systemd[1]: Started OpenSSH server daemon.
```

### dockerコンテナのip確認
```
bash-5.0# ip a show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
1266: eth0@if1267: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.3/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
```

### dockerホスト側からdockerコンテナ側にssh接続
```
[rstudio@centos ~/unko/script_scratch/ssh]$ssh root@172.17.0.3
The authenticity of host '172.17.0.3 (172.17.0.3)' can't be established.
ECDSA key fingerprint is SHA256:v7ekRny7c57N5k3gnLr1fSiIIwVPFTtavYnDj7op4+M.
ECDSA key fingerprint is MD5:ce:2c:f6:09:12:30:ca:b9:f6:c9:1c:b0:66:9e:46:d3.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.17.0.3' (ECDSA) to the list of known hosts.
root@172.17.0.3's password: 
-bash-4.2# ip a show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
1266: eth0@if1267: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.3/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
-bash-4.2# bash --version
GNU bash, バージョン 5.0.0(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2019 Free Software Foundation, Inc.
ライセンス GPLv3+: GNU GPL バージョン 3 またはそれ以降 <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
-bash-4.2# logout
Connection to 172.17.0.3 closed.
```

