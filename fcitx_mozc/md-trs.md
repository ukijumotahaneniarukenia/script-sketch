# トラシュー

- 事象

IMメソッドインストールしている際のエラー
```
$apt install -y fcitx-mozc

Fetched 85.8 MB in 3min 43s (385 kB/s)
E: Failed to fetch http://security.ubuntu.com/ubuntu/pool/main/m/mysql-5.7/libmysqlclient20_5.7.29-0ubuntu0.18.04.1_amd64.deb  404  Not Found [IP: 150.65.7.130 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
```

- 原因

  -参照先のレポジジURLがよくない

- 対応

```
$cp -p /etc/apt/sources.list /etc/apt/sources.list.bak
$sed -i -e 's/archive.ubuntu.com\|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
$diff -y /etc/apt/sources.list{,.bak}
$apt update
$apt install -y fcitx-mozc
```

- 予防

  - スクリプトに取り込む
