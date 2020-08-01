```
$ cd /var/lib/machines/
```

```
echo {02..05} | xargs -n1 | xargs -I@ echo cp -a vir-ubuntu-20-04-template vir-ubuntu-20-04-@
```

```
$ echo {02..05} | xargs -n1 | xargs -I@ echo cp -a vir-ubuntu-20-04-template vir-ubuntu-20-04-@
cp -a vir-ubuntu-20-04-template vir-ubuntu-20-04-02
cp -a vir-ubuntu-20-04-template vir-ubuntu-20-04-03
cp -a vir-ubuntu-20-04-template vir-ubuntu-20-04-04
cp -a vir-ubuntu-20-04-template vir-ubuntu-20-04-05
```

```
echo {02..05} | xargs -n1 | while read n;do printf "machinectl shell root@vir-ubuntu-20-04-%s /bin/bash -c \x27echo \x22root:root_pwd\x22|chpasswd\x27\n" $(printf "%02d" $n);done
```

```
$ echo {02..05} | xargs -n1 | while read n;do printf "machinectl shell root@vir-ubuntu-20-04-%s /bin/bash -c \x27echo \x22root:root_pwd\x22|chpasswd\x27\n" $(printf "%02d" $n);done
machinectl shell root@vir-ubuntu-20-04-02 /bin/bash -c 'echo "root:root_pwd"|chpasswd'
machinectl shell root@vir-ubuntu-20-04-03 /bin/bash -c 'echo "root:root_pwd"|chpasswd'
machinectl shell root@vir-ubuntu-20-04-04 /bin/bash -c 'echo "root:root_pwd"|chpasswd'
machinectl shell root@vir-ubuntu-20-04-05 /bin/bash -c 'echo "root:root_pwd"|chpasswd'
```


```
echo {02..05} | xargs -n1 | xargs -I{} echo machinectl shell root@vir-ubuntu-20-04-{} /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
```

```
$ echo {02..05} | xargs -n1 | xargs -I{} echo machinectl shell root@vir-ubuntu-20-04-{} /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/ln -sf /dev/null /etc/systemd/network/80-container-host0.network
```


```
echo {02..05} | xargs -n1 | while read n;do printf "machinectl shell root@vir-ubuntu-20-04-%s /usr/bin/sed -i \x27s/#DNS/DNS=192.168.1.1/\x27 /etc/systemd/resolved.conf\n" $(printf "%02d" $n);done
```

```
$ echo {02..05} | xargs -n1 | while read n;do printf "machinectl shell root@vir-ubuntu-20-04-%s /usr/bin/sed -i \x27s/#DNS/DNS=192.168.1.1/\x27 /etc/systemd/resolved.conf\n" $(printf "%02d" $n);done
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/sed -i 's/#DNS/DNS=192.168.1.1/' /etc/systemd/resolved.conf
```

```
seq 1 4 | xargs -I@ echo echo 8.8.8.8 192.168.1.$\[209+@\] 192.168.1.1 |bash|while read GOOGLE_DNS_IP SERVER_IP MY_ROUTER_IP;do sed "s/GOOGLE_DNS_IP/$GOOGLE_DNS_IP/;s/SERVER_IP/$SERVER_IP/;s/MY_ROUTER_IP/$MY_ROUTER_IP/;" 80-container-host0.network >80-container-host0.network-$SERVER_IP;done
```

```
$ ls -l
合計 44K
drwx------  4 root       root       4.0K  8月  2 02:50 .
-rw-------  1 root       root          0  8月  2 01:54 .#vir-ubuntu-20-04.lck
drwxr-xr-x 75 root       root       4.0K  8月  1 00:28 ..
-rw-r--r--  1 root       root        112  8月  2 02:33 80-container-host0.network
-rw-r--r--  1 root       root        109  8月  2 02:50 80-container-host0.network-192.168.1.210
-rw-r--r--  1 root       root        109  8月  2 02:50 80-container-host0.network-192.168.1.211
-rw-r--r--  1 root       root        109  8月  2 02:50 80-container-host0.network-192.168.1.212
-rw-r--r--  1 root       root        109  8月  2 02:50 80-container-host0.network-192.168.1.213
-rw-r--r--  1 root       root        110  8月  2 02:32 host0.network
-rwxr-xr-x  1 root       root       2.0K  8月  1 00:47 systemd-container-entrypoint.sh
drwxr-xr-x 17 1547173888 1547173888 4.0K  7月 27 22:28 vir-ubuntu-20-04
drwxr-xr-x 17 root       root       4.0K  7月 27 22:28 vir-ubuntu-20-04-template
```


```
$ seq 1 4 | xargs -I@ echo echo 192.168.1.$\[209+@\] 192.168.1.1 |bash|while read SERVER_IP MY_ROUTER_IP;do sed "s/SERVER_IP/$SERVER_IP/;s/MY_ROUTER_IP/$MY_ROUTER_IP/;" host0.network >host0.network-$SERVER_IP;done
```

```
$ ls -l
合計 60K
drwx------  4 root       root       4.0K  8月  2 02:52 .
-rw-------  1 root       root          0  8月  2 01:54 .#vir-ubuntu-20-04.lck
drwxr-xr-x 75 root       root       4.0K  8月  1 00:28 ..
-rw-r--r--  1 root       root        112  8月  2 02:33 80-container-host0.network
-rw-r--r--  1 root       root        109  8月  2 02:50 80-container-host0.network-192.168.1.210
-rw-r--r--  1 root       root        109  8月  2 02:50 80-container-host0.network-192.168.1.211
-rw-r--r--  1 root       root        109  8月  2 02:50 80-container-host0.network-192.168.1.212
-rw-r--r--  1 root       root        109  8月  2 02:50 80-container-host0.network-192.168.1.213
-rw-r--r--  1 root       root        110  8月  2 02:32 host0.network
-rw-r--r--  1 root       root        112  8月  2 02:52 host0.network-192.168.1.210
-rw-r--r--  1 root       root        112  8月  2 02:52 host0.network-192.168.1.211
-rw-r--r--  1 root       root        112  8月  2 02:52 host0.network-192.168.1.212
-rw-r--r--  1 root       root        112  8月  2 02:52 host0.network-192.168.1.213
-rwxr-xr-x  1 root       root       2.0K  8月  1 00:47 systemd-container-entrypoint.sh
drwxr-xr-x 17 1547173888 1547173888 4.0K  7月 27 22:28 vir-ubuntu-20-04
drwxr-xr-x 17 root       root       4.0K  7月 27 22:28 vir-ubuntu-20-04-template
```


```
echo {02..05} | xargs -n1|nl|while read n h;do echo machinectl shell root@vir-ubuntu-20-04-$(printf "%02d" $[n+1]) /usr/bin/cp $(ls $keyword* | grep 192.168.1.$[209+$n]) $dir/$keyword;done
```

```
dir=/etc/systemd/network
$ echo $dir
/etc/systemd/network


keyword=80-container-host0.network
$ echo $keyword 
80-container-host0.network

$ echo {02..05} | xargs -n1|nl|while read n h;do echo machinectl shell root@vir-ubuntu-20-04-$(printf "%02d" $[n+1]) /usr/bin/cp $(ls $keyword* | grep 192.168.1.$[209+$n]) $dir/$keyword;done
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/cp 80-container-host0.network-192.168.1.210 /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/cp 80-container-host0.network-192.168.1.211 /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/cp 80-container-host0.network-192.168.1.212 /etc/systemd/network/80-container-host0.network
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/cp 80-container-host0.network-192.168.1.213 /etc/systemd/network/80-container-host0.network
```


```
$ echo {02..05} | xargs -n1|nl|while read n h;do echo machinectl shell root@vir-ubuntu-20-04-$(printf "%02d" $[n+1]) /usr/bin/cp $(ls $keyword* | grep 192.168.1.$[209+$n]) $dir/$keyword;done
```

```
dir=/etc/systemd/network
$ echo $dir
/etc/systemd/network


keyword=host0.network
$ echo $keyword
host0.network


$ echo {02..05} | xargs -n1|nl|while read n h;do echo machinectl shell root@vir-ubuntu-20-04-$(printf "%02d" $[n+1]) /usr/bin/cp $(ls $keyword* | grep 192.168.1.$[209+$n]) $dir/$keyword;done
machinectl shell root@vir-ubuntu-20-04-02 /usr/bin/cp host0.network-192.168.1.210 /etc/systemd/network/host0.network
machinectl shell root@vir-ubuntu-20-04-03 /usr/bin/cp host0.network-192.168.1.211 /etc/systemd/network/host0.network
machinectl shell root@vir-ubuntu-20-04-04 /usr/bin/cp host0.network-192.168.1.212 /etc/systemd/network/host0.network
machinectl shell root@vir-ubuntu-20-04-05 /usr/bin/cp host0.network-192.168.1.213 /etc/systemd/network/host0.network

```
