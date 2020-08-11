#!/usr/bin/env bash

START_HOST_NO=1

END_HOST_NO=5


cd /var/lib/machines

mkdir -p vir-ubuntu-20-04

#ここはいれたいイメージダウンロードしてくる
time debootstrap --arch=amd64 focal /var/lib/machines/vir-ubuntu-20-04 http://archive.ubuntu.com/ubuntu


#接尾時にテンプレー卜の文字列をつける
mv vir-ubuntu-20-04/ vir-ubuntu-20-04-template

#コンテナホスト起動時にコンテナゲストも自動起動するように設定

systemctl stop systemd-nspawn@vir-ubuntu-20-04-001.service #ラグが少しある。２分ぐらい。
systemctl start systemd-nspawn@vir-ubuntu-20-04-001.service
systemctl enable systemd-nspawn@vir-ubuntu-20-04-001.service
systemctl status systemd-nspawn@vir-ubuntu-20-04-001.service


#再起動
reboot

#状態確認

cd /var/lib/machines

machinectl list -all


#X転送許可
xhost +local:


