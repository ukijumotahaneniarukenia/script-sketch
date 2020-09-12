chpasswdのところがオペミスでリスキーなので、一般ユーザーでsudoが使えるのであれば、りかばれる
```
$ sudo passwd root
新しいパスワード: 
新しいパスワードを再入力してください: 
passwd: パスワードは正しく更新されました
```

コンテナホストないしコンテナゲストともにrootユーザーで実施

権限周りはデフォで644になるから省略、不具合出たら見直す

- コンテナホスト側

ブリッチ構成から元の構成に戻す

```
rm /etc/systemd/network/br0.netdev
rm /etc/systemd/network/eno1.network
unlink /etc/systemd/network/80-container-host0.network
sed -i 's/--network-bridge=br0/--network-veth/' /lib/systemd/system/systemd-nspawn@.service
```


コンテナ作成

rootユーザーのパスワード設定まで行っておく

```
$ cd /var/lib/machines

$ machinectl terminate vir-ubuntu-18-04-001

$ rm -rf vir-ubuntu-18-04-001

$ cp -a vir-ubuntu-18-04-template vir-ubuntu-18-04-001

$ machinectl start vir-ubuntu-18-04-001

$ machinectl list -a
MACHINE              CLASS     SERVICE        OS     VERSION ADDRESSES     
.host                host      -              ubuntu 20.04   192.168.1.109…
vir-ubuntu-18-04-001 container systemd-nspawn ubuntu 18.04   -             

2 machines listed.

$ machinectl shell root@vir-ubuntu-18-04-001 /bin/bash -c 'echo "root:root_pwd" | chpasswd'
Connected to machine vir-ubuntu-18-04-001. Press ^] three times within 1s to exit session.

Connection to machine vir-ubuntu-18-04-001 terminated.

```

ブリッチ構成に変更していく

一覧
```
$ ls -l /etc/systemd/network/*
lrwxrwxrwx 1 root root   9  8月  2 01:15 /etc/systemd/network/80-container-host0.network -> /dev/null
-rw-r--r-- 1 root root  30  8月  1 22:12 /etc/systemd/network/br0.netdev
-rw-r--r-- 1 root root 164  8月  1 23:14 /etc/systemd/network/br0.network
-rw-r--r-- 1 root root  40  8月  1 22:06 /etc/systemd/network/eno1.network
-rw-r--r-- 1 root root  52  8月  1 22:58 /etc/systemd/network/vb.network
```


詳細
```
ln -sf /dev/null /etc/systemd/network/80-container-host0.network

cat <<EOS > /etc/systemd/network/br0.netdev
[NetDev]
Name=br0
Kind=bridge
EOS

chmod 644 /etc/systemd/network/br0.netdev
chown root:root /etc/systemd/network/br0.netdev

#https://gist.github.com/artizirk/0d800be97bcdb35fb7bfd9755208e0e8#setup
cat <<EOS >/etc/systemd/network/br0.network
[Match]
Name=br0

[Network]
DNS=192.168.1.1
Address=192.168.1.109/24
Gateway=192.168.1.1
LinkLocalAddressing=yes
IPMasquerade=yes
LLDP=yes
EmitLLDP=customer-bridge
EOS

chmod 644 /etc/systemd/network/br0.network
chown root:root /etc/systemd/network/br0.network

cat <<EOS >/etc/systemd/network/eno1.network
[Match]
Name=eno1

[Network]
Bridge=br0
EOS

chmod 644 /etc/systemd/network/eno1.network
chown root:root /etc/systemd/network/eno1.network

#https://github.com/systemd/systemd/issues/575#issuecomment-163810166
#https://hachune.net/hachunet/2019/09/19/nspawn.html

cat <<EOS >/etc/systemd/network/vb.network
[Match]
Name=vb-*

[Network]
LinkLocalAddressing=no
EOS

chmod 644 /etc/systemd/network/vb.network
chown root:root /etc/systemd/network/vb.network

sed -i 's/--network-veth/--network-bridge=br0/' /lib/systemd/system/systemd-nspawn@.service
```

ネットワークサービスの自動起動設定と開始、状態確認
```
systemctl enable systemd-networkd
systemctl start systemd-networkd
systemctl status systemd-networkd
```


- コンテナゲスト側

```
$ machinectl shell root@vir-ubuntu-18-04-001 /bin/bash


$ ls -lh /etc/systemd/network/80-container-host0.network
ls: cannot access '/etc/systemd/network/80-container-host0.network': No such file or directory

$ ln -sf /dev/null /etc/systemd/network/80-container-host0.network

$ ls -lh /etc/systemd/network/80-container-host0.network
lrwxrwxrwx 1 root root 9 Sep 12 17:27 /etc/systemd/network/80-container-host0.network -> /dev/null

$ cat <<EOS >/etc/systemd/network/host0.network
[Match]
Name=host0

[Network]
DHCP=no
DNS=192.168.1.1
Address=192.168.1.209/24

[Route]
Gateway=192.168.1.1
EOS

$ chmod 644 /etc/systemd/network/host0.network
$ chown root:root /etc/systemd/network/host0.network

$ ls -lh /etc/systemd/network/host0.network
-rw-r--r-- 1 root root 108 Sep 12 17:28 /etc/systemd/network/host0.network

$ cat <<EOS >/etc/systemd/network/80-container-host0.network
[Match]
Virtualization=container
Name=host0

[Network]
DNS=8.8.8.8
Address=192.168.1.209
Gateway=192.168.1.1
EOS

$ chmod 644 /etc/systemd/network/80-container-host0.network
$ chown root:root /etc/systemd/network/80-container-host0.network

$ ls -hl /etc/systemd/network/80-container-host0.network
lrwxrwxrwx 1 root root 9 Sep 12 17:27 /etc/systemd/network/80-container-host0.network -> /dev/null

$ sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf

$ chmod 644 /etc/systemd/resolved.conf
$ chown root:root /etc/systemd/resolved.conf

$ ls -lh /etc/systemd/resolved.conf
-rw-r--r-- 1 root root 634 Sep 12 17:30 /etc/systemd/resolved.conf

```

コンテナゲスト上でネットワークサービスの自動起動設定と開始、状態確認

```
machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl enable systemd-networkd
machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl start systemd-networkd
machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl --no-pager status systemd-networkd
machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl enable systemd-resolved
machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl start systemd-resolved
machinectl shell root@vir-ubuntu-18-04-001 /bin/systemctl --no-pager status systemd-resolved
```


コンテナホストマシンを再起動



再起動後の確認


ipの確認

- コンテナホスト側

```
$ ip a show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel master br0 state UP group default qlen 1000
    link/ether 00:d8:61:2c:f1:5b brd ff:ff:ff:ff:ff:ff
3: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:d8:61:2c:f1:5b brd ff:ff:ff:ff:ff:ff
    inet 169.254.242.201/16 brd 169.254.255.255 scope link br0
       valid_lft forever preferred_lft forever
    inet 192.168.1.109/24 brd 192.168.1.255 scope global br0
       valid_lft forever preferred_lft forever
    inet6 fe80::2d8:61ff:fe2c:f15b/64 scope link 
       valid_lft forever preferred_lft forever
4: vb-vir-ubunGoIO@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br0 state UP group default qlen 1000
    link/ether 32:fd:ac:9c:2a:3a brd ff:ff:ff:ff:ff:ff link-netnsid 0
5: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:98:65:bc:14 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
```

コンテナゲスト

```
$ machinectl shell root@vir-ubuntu-18-04-001 /bin/ip a show
Connected to machine vir-ubuntu-18-04-001. Press ^] three times within 1s to exit session.
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: host0@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 42:b7:1b:41:63:6a brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.1.209/24 brd 192.168.1.255 scope global host0
       valid_lft forever preferred_lft forever
    inet6 fe80::40b7:1bff:fe41:636a/64 scope link 
       valid_lft forever preferred_lft forever
Connection to machine vir-ubuntu-20-04 terminated.
```

コンテナホストからコンテナゲストへの疎通

```
ping -c 4 192.168.1.209
```

```
$ ping -c 4 192.168.1.209
PING 192.168.1.209 (192.168.1.209) 56(84) バイトのデータ
64 バイト応答 送信元 192.168.1.209: icmp_seq=1 ttl=64 時間=0.193ミリ秒
64 バイト応答 送信元 192.168.1.209: icmp_seq=2 ttl=64 時間=0.059ミリ秒
64 バイト応答 送信元 192.168.1.209: icmp_seq=3 ttl=64 時間=0.069ミリ秒
64 バイト応答 送信元 192.168.1.209: icmp_seq=4 ttl=64 時間=0.067ミリ秒

--- 192.168.1.209 ping 統計 ---
送信パケット数 4, 受信パケット数 4, パケット損失 0%, 時間 3052ミリ秒
rtt 最小/平均/最大/mdev = 0.059/0.097/0.193/0.055ミリ秒
```

コンテナゲストからコンテナホストへの疎通

```
machinectl shell root@vir-ubuntu-18-04-001 /bin/ping -c 4 192.168.1.109
```

```
$ machinectl shell root@vir-ubuntu-18-04-001 /bin/ping -c 4 192.168.1.109
Connected to machine vir-ubuntu-20-04. Press ^] three times within 1s to exit session.
PING 192.168.1.109 (192.168.1.109) 56(84) bytes of data.
64 bytes from 192.168.1.109: icmp_seq=1 ttl=64 time=0.038 ms
64 bytes from 192.168.1.109: icmp_seq=2 ttl=64 time=0.081 ms
64 bytes from 192.168.1.109: icmp_seq=3 ttl=64 time=0.078 ms
64 bytes from 192.168.1.109: icmp_seq=4 ttl=64 time=0.088 ms

--- 192.168.1.109 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3059ms
rtt min/avg/max/mdev = 0.038/0.071/0.088/0.019 ms
Connection to machine vir-ubuntu-20-04 terminated.
```

コンテナホストから外部への疎通

```
$ nslookup archive.ubuntu.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	archive.ubuntu.com
Address: 91.189.88.152
Name:	archive.ubuntu.com
Address: 91.189.88.142

$ traceroute 91.189.88.152
traceroute to 91.189.88.152 (91.189.88.152), 30 hops max, 60 byte packets
 1  _gateway (192.168.1.1)  1.187 ms  1.133 ms  1.072 ms
 2  nas827.p-kanagawa.nttpc.ne.jp (210.153.251.235)  5.493 ms  5.814 ms  5.796 ms
 3  210.139.125.173 (210.139.125.173)  5.882 ms  5.864 ms  5.913 ms
 4  210.165.249.181 (210.165.249.181)  6.849 ms  6.154 ms  6.790 ms
 5  p254--504.tky-nk-acr02.sphere.ad.jp (210.153.241.113)  8.371 ms  12.423 ms  12.404 ms
 6  p101--2025.n-otemachi-core1.sphere.ad.jp (202.239.117.1)  12.982 ms  9.643 ms p102--2026.k-otemachi-core1.sphere.ad.jp (202.239.117.33)  9.924 ms
 7  ix-ge-1-0-9.hcore2.ovc-tokyo.as6453.net (180.87.180.29)  9.971 ms ix-ge-1-0-5.hcore1.ovc-tokyo.as6453.net (180.87.181.65)  7.812 ms *
 8  * * if-et-1-2.hcore2.ovc-tokyo.as6453.net (116.0.90.21)  7.916 ms
 9  if-et-24-2.hcore2.kv8-chiba.as6453.net (180.87.181.73)  10.058 ms if-et-21-2.hcore1.kv8-chiba.as6453.net (120.29.217.67)  9.640 ms if-et-1-2.hcore1.kv8-chiba.as6453.net (120.29.211.2)  10.084 ms
10  if-ae-5-2.tcore2.sv1-santaclara.as6453.net (209.58.86.142)  252.377 ms  252.413 ms  251.597 ms
11  if-ae-18-2.tcore1.sqn-sanjose.as6453.net (63.243.205.72)  263.834 ms  262.317 ms if-ae-5-2.tcore2.sv1-santaclara.as6453.net (209.58.86.142)  251.371 ms
12  if-ae-0-2.tcore1.nto-newyork.as6453.net (63.243.128.30)  260.877 ms if-ae-18-2.tcore1.sqn-sanjose.as6453.net (63.243.205.72)  260.386 ms if-ae-36-2.tcore1.nto-newyork.as6453.net (63.243.128.166)  251.396 ms
13  if-ae-8-3.tcore2.nto-newyork.as6453.net (63.243.128.135)  246.076 ms if-ae-12-33.tcore2.nto-newyork.as6453.net (63.243.128.59)  247.532 ms  242.215 ms
14  if-ae-8-3.tcore2.nto-newyork.as6453.net (63.243.128.135)  244.111 ms if-ae-8-2.tcore2.nto-newyork.as6453.net (63.243.128.70)  251.481 ms if-ae-32-2.tcore2.ldn-london.as6453.net (63.243.216.23)  268.095 ms
15  if-ae-26-2.tcore1.ldn-london.as6453.net (80.231.62.58)  252.977 ms if-ae-32-2.tcore2.ldn-london.as6453.net (63.243.216.23)  272.157 ms if-ae-26-2.tcore1.ldn-london.as6453.net (80.231.62.58)  252.811 ms
16  195.219.83.102 (195.219.83.102)  251.582 ms  245.760 ms if-ae-26-2.tcore1.ldn-london.as6453.net (80.231.62.58)  244.985 ms
17  195.219.83.102 (195.219.83.102)  243.447 ms * *
18  SOURCE-MANA.ear2.London1.Level3.net (212.113.8.154)  244.704 ms  245.804 ms  253.285 ms
19  actiontoad.canonical.com (91.189.88.152)  225.993 ms  233.106 ms SOURCE-MANA.ear2.London1.Level3.net (212.113.8.154)  252.483 ms
```

コンテナゲストから外部への疎通

```
machinectl shell root@vir-ubuntu-18-04-001 $($(which which) tracepath) 91.189.88.152
```

```
$ machinectl shell root@vir-ubuntu-18-04-001 /bin/tracepath 91.189.88.152
Connected to machine vir-ubuntu-18-04-001. Press ^] three times within 1s to exit session.
 1?: [LOCALHOST]                      pmtu 1454
 1:  _gateway                                              0.523ms 
 1:  _gateway                                              0.596ms 
 2:  nas827.p-kanagawa.nttpc.ne.jp                         5.050ms 
 3:  210.139.125.173                                       5.093ms 
 4:  210.165.249.181                                       6.462ms 
 5:  p254--504.tky-nk-acr02.sphere.ad.jp                   9.508ms 
 6:  p102--2026.k-otemachi-core1.sphere.ad.jp             20.834ms 
 7:  no reply
 8:  if-ae-2-2.tcore1.tv2-tokyo.as6453.net               250.441ms asymm 25 
 9:  if-et-21-2.hcore1.kv8-chiba.as6453.net               18.912ms 
10:  if-ae-5-2.tcore2.sv1-santaclara.as6453.net          260.021ms asymm 20 
11:  if-ae-18-4.tcore1.sqn-sanjose.as6453.net            264.871ms asymm 22 
12:  if-ae-36-2.tcore1.nto-newyork.as6453.net            252.086ms asymm 21 
13:  if-ae-12-33.tcore2.nto-newyork.as6453.net           242.019ms asymm 20 
14:  if-ae-32-2.tcore2.ldn-london.as6453.net             271.147ms asymm 16 
15:  if-ae-26-2.tcore1.ldn-london.as6453.net             245.352ms asymm 17 
16:  if-ae-26-2.tcore1.ldn-london.as6453.net             252.345ms asymm 17 
17:  no reply
18:  SOURCE-MANA.ear2.London1.Level3.net                 257.774ms asymm 20 
19:  actiontoad.canonical.com                            239.962ms reached
     Resume: pmtu 1454 hops 19 back 15 
Connection to machine vir-ubuntu-18-04-001 terminated.
```


ネットワークのセットアップ状態確認

- コンテナホスト側

```
networkctl
```

```
$ networkctl
IDX LINK            TYPE     OPERATIONAL SETUP     
  1 lo              loopback carrier     unmanaged 
  2 eno1            ether    enslaved    configured
  3 br0             bridge   routable    configured
  4 vb-vir-ubunGoIO ether    carrier     configured
  5 docker0         bridge   no-carrier  unmanaged 

5 links listed.
```

- コンテナゲスト側

```
machinectl shell root@vir-ubuntu-18-04-001 /usr/bin/networkctl
```

```
$ machinectl shell root@vir-ubuntu-18-04-001 /usr/bin/networkctl
Connected to machine vir-ubuntu-18-04-001. Press ^] three times within 1s to exit session.
IDX LINK  TYPE     OPERATIONAL SETUP     
  1 lo    loopback carrier     unmanaged 
  2 host0 ether    routable    configured

2 links listed.

Connection to machine vir-ubuntu-18-04-001 terminated.
```


ブリッチの割付確認

- コンテナホスト側

```
$ brctl show
bridge name	bridge id		STP enabled	interfaces
br0		8000.00d8612cf15b	no		eno1
							vb-vir-ubunGoIO
docker0		8000.02429865bc14	no		
```


DNSの確認
- コンテナホスト側

ブリッチインターフェース(br0)がルータのipになっていること

```
$ resolvectl 
Global
       LLMNR setting: no                  
MulticastDNS setting: no                  
  DNSOverTLS setting: no                  
      DNSSEC setting: no                  
    DNSSEC supported: no                  
          DNSSEC NTA: 10.in-addr.arpa     
                      16.172.in-addr.arpa 
                      168.192.in-addr.arpa
                      17.172.in-addr.arpa 
                      18.172.in-addr.arpa 
                      19.172.in-addr.arpa 
                      20.172.in-addr.arpa 
                      21.172.in-addr.arpa 
                      22.172.in-addr.arpa 
                      23.172.in-addr.arpa 
                      24.172.in-addr.arpa 
                      25.172.in-addr.arpa 
                      26.172.in-addr.arpa 
                      27.172.in-addr.arpa 
                      28.172.in-addr.arpa 
                      29.172.in-addr.arpa 
                      30.172.in-addr.arpa 
                      31.172.in-addr.arpa 
                      corp                
                      d.f.ip6.arpa        
                      home                
                      internal            
                      intranet            
                      lan                 
                      local               
                      private             
                      test                

Link 5 (docker0)
      Current Scopes: none
DefaultRoute setting: no  
       LLMNR setting: yes 
MulticastDNS setting: no  
  DNSOverTLS setting: no  
      DNSSEC setting: no  
    DNSSEC supported: no  

Link 4 (vb-vir-ubunGoIO)
      Current Scopes: none
DefaultRoute setting: no  
       LLMNR setting: yes 
MulticastDNS setting: no  
  DNSOverTLS setting: no  
      DNSSEC setting: no  
    DNSSEC supported: no  

Link 3 (br0)
      Current Scopes: DNS        
DefaultRoute setting: yes        
       LLMNR setting: yes        
MulticastDNS setting: no         
  DNSOverTLS setting: no         
      DNSSEC setting: no         
    DNSSEC supported: no         
  Current DNS Server: 192.168.1.1
         DNS Servers: 192.168.1.1

Link 2 (eno1)
      Current Scopes: none
DefaultRoute setting: no  
       LLMNR setting: yes 
MulticastDNS setting: no  
  DNSOverTLS setting: no  
      DNSSEC setting: no  
    DNSSEC supported: no  
```

- コンテナゲスト側

グローバルはルータのipになっていること

インターフェースはgoogleのDNSになっていること

```
$ machinectl shell root@vir-ubuntu-18-04-001 /usr/bin/resolvectl
Connected to machine vir-ubuntu-18-04-001. Press ^] three times within 1s to exit session.
Global
       LLMNR setting: no                  
MulticastDNS setting: no                  
  DNSOverTLS setting: no                  
      DNSSEC setting: no                  
    DNSSEC supported: no                  
  Current DNS Server: 192.168.1.1         
         DNS Servers: 192.168.1.1         
          DNSSEC NTA: 10.in-addr.arpa     
                      16.172.in-addr.arpa 
                      168.192.in-addr.arpa
                      17.172.in-addr.arpa 
                      18.172.in-addr.arpa 
                      19.172.in-addr.arpa 
                      20.172.in-addr.arpa 
                      21.172.in-addr.arpa 
                      22.172.in-addr.arpa 
                      23.172.in-addr.arpa 
                      24.172.in-addr.arpa 
                      25.172.in-addr.arpa 
                      26.172.in-addr.arpa 
                      27.172.in-addr.arpa 
                      28.172.in-addr.arpa 
                      29.172.in-addr.arpa 
                      30.172.in-addr.arpa 
                      31.172.in-addr.arpa 
                      corp                
                      d.f.ip6.arpa        
                      home                
                      internal            
                      intranet            
                      lan                 
                      local               
                      private             
                      test                

Link 2 (host0)
      Current Scopes: DNS    
DefaultRoute setting: yes    
       LLMNR setting: yes    
MulticastDNS setting: no     
  DNSOverTLS setting: no     
      DNSSEC setting: no     
    DNSSEC supported: no     
  Current DNS Server: 8.8.8.8
         DNS Servers: 8.8.8.8

Connection to machine vir-ubuntu-18-04-001 terminated.
```

実行時の/run/systemd/resolve管理のresolve.confにルーターのipとgoogleのipがあること
```
$ machinectl shell root@vir-ubuntu-18-04-001 /bin/bash -c 'cat /run/systemd/resolve/resolv.conf | grep nameserver'
Connected to machine vir-ubuntu-18-04-001. Press ^] three times within 1s to exit session.
nameserver 192.168.1.1
nameserver 8.8.8.8
Connection to machine vir-ubuntu-18-04-001 terminated.
```
