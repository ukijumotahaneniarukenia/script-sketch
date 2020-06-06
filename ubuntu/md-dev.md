ubuntuのアップグレード手順

- https://kaworu.jpn.org/ubuntu/Ubuntu%E3%81%AE%E3%82%A2%E3%83%83%E3%83%97%E3%82%B0%E3%83%AC%E3%83%BC%E3%83%89%E3%81%AE%E3%82%84%E3%82%8A%E6%96%B9

rootで作業

17.10 <-usb

18.04 <-1回目

20.04 <-2回目

```


apt update


#1回目
do-release-upgrade


ここで再起動求められる



#2回目
do-release-upgrade -d


cat /etc/os-release

```
