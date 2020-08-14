#!/usr/bin/env bash

START_HOST_NO=1

END_HOST_NO=5


reset(){

  cd /var/lib/machines


  machinectl terminate vir-ubuntu-20-04

  rm -rf /var/lib/machines/vir-ubuntu-20-04

}

prepare(){

  apt install -y debootstrap
  apt install -y systemd-container #このパッケージをインストール後、cd /var/lib/machines/できるようになる


  mkdir -p /var/lib/machines/vir-ubuntu-20-04-template

  #ここはいれたいイメージダウンロードしてくる
  #接尾時にテンプレー卜の文字列をつける
  time debootstrap --arch=amd64 focal /var/lib/machines/vir-ubuntu-20-04-template http://archive.ubuntu.com/ubuntu


}


check_env(){

  dpkg --print-architecture #amd64

  lsb_release -cs #focal

  lsb_release -r|awk -F'\t' '{print $2}'|tr '.' '-' #20-04

  machinectl --version
#  systemd 245 (245.4-4ubuntu3.2)
#+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid

  debootstrap --version #debootstrap 1.0.118ubuntu1.1

  systemd-nspawn --version
#systemd 245 (245.4-4ubuntu3.2)
#+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid






}



check_cmd_preset(){
   machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt update


   machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt install -y iputils-tracepath  dnsutils x11-apps

   machinectl shell aine@vir-ubuntu-20-04 /bin/which echo
   machinectl shell aine@vir-ubuntu-20-04 /bin/which sudo
   machinectl shell aine@vir-ubuntu-20-04 /bin/which apt
   machinectl shell root@vir-ubuntu-20-04 /bin/which nslookup




   machinectl shell root@vir-ubuntu-20-04 /bin/which tracepath




}


configure(){


  #コンテナホスト起動時にコンテナゲストも自動起動するように設定
  systemctl stop systemd-nspawn@vir-ubuntu-20-04-001.service #ラグが少しある。２分ぐらい。
  systemctl start systemd-nspawn@vir-ubuntu-20-04-001.service
  systemctl enable systemd-nspawn@vir-ubuntu-20-04-001.service
  systemctl status systemd-nspawn@vir-ubuntu-20-04-001.service

}


reboot(){

  #再起動
  reboot


}

startup(){
  #自動起動設定しているから必要ないか

   machinectl start vir-ubuntu-20-04



}


healthcheck(){


  cd /var/lib/machines

  machinectl list -all

  machinectl shell root@vir-ubuntu-20-04 /bin/systemd --version

#systemd 245 (245.4-4ubuntu3)
#+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid


}


healthcheck_network(){


  machinectl shell root@vir-ubuntu-20-04 /usr/bin/nslookup www.google.com

  machinectl shell root@vir-ubuntu-20-04 /usr/bin/tracepath 172.217.26.36



}


healthcheck_launch_gui(){

  #X転送許可
  xhost +local:


  machinectl shell root@vir-ubuntu-20-04 /bin/which firefox

  machinectl shell root@vir-ubuntu-20-04 /bin/which apt

  machinectl shell root@vir-ubuntu-20-04 /usr/bin/apt install -y firefox

  machinectl shell root@vir-ubuntu-20-04 /bin/which firefox



}

cleanup(){

  #物理削除したら、この作業いらんことに気づいた。
  machinectl shell root@vir-ubuntu-20-04 /bin/systemctl disable systemd-networkd

  #コンテナゲストのネットワークサービス停止（ソケット）
  machinectl shell root@vir-ubuntu-20-04 /bin/systemctl stop systemd-networkd.socket

  #コンテナゲストのネットワークサービス停止（ソケット以外）
  machinectl shell root@vir-ubuntu-20-04 /bin/systemctl stop systemd-networkd

  #コンテナゲストのネットワークサービス強制停止
  machinectl shell root@vir-ubuntu-20-04 /bin/systemctl kill systemd-networkd


  #コンテナホスト側でのコンテナゲストの自動起動解除
  systemctl disable systemd-nspawn@vir-ubuntu-20-04.service


  #コンテナホスト側でのコンテナゲストの停止
  systemctl stop systemd-nspawn@vir-ubuntu-20-04.service

  #コンテナホスト側でのコンテナゲストの強制停止
  systemctl kill systemd-nspawn@vir-ubuntu-20-04.service


  #コンテナゲストファイルの物理削除
  rm -rf /var/lib/machines/vir-ubuntu-20-04




}
