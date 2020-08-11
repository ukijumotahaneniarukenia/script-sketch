#!/usr/bin/env bash

#ユーザー登録
DEFAULT_USER_ID=1000
DEFAULT_USER_NAME=aine
DEFAULT_GROUP_ID=1000
DEFAULT_GROUP_NAME=aine
DEFAULT_PASSWORD=aine_pwd

USER_ID=$1;shift;
USER_NAME=$1;shift;
GROUP_ID=$1;shift;
GROUP_NAME=$1;shift;
PASSWORD=$1;shift;

CHECK_EXISTS_USER_ID=$(cat /etc/passwd | grep ${USER_ID:-$DEFAULT_USER_ID} | cut -d ':' -f3)
CHECK_EXISTS_USER_NAME=$(cat /etc/passwd | grep ${USER_NAME:-$DEFAULT_USER_NAME} | cut -d ':' -f1)
CHECK_EXISTS_GROUP_ID=$(cat /etc/passwd | grep ${GROUP_ID:-$DEFAULT_GROUP_ID} | cut -d ':' -f4)
CHECK_EXISTS_GROUP_NAME=$(cat /etc/passwd | grep ${GROUP_NAME:-$DEFAULT_GROUP_NAME} | cut -d ':' -f5| cut -d ',' -f1)

IS_EXISTS=$CHECK_EXISTS_USER_ID$CHECK_EXISTS_USER_NAME$CHECK_EXISTS_GROUP_ID$CHECK_EXISTS_GROUP_NAME

if [ -z $IS_EXISTS ];then
  groupadd -g ${GROUP_ID:-$DEFAULT_GROUP_ID} ${GROUP_NAME:-$DEFAULT_GROUP_NAME} && \
  useradd -m -g ${GROUP_NAME:-$DEFAULT_GROUP_NAME} -u ${USER_ID:-$DEFAULT_USER_ID} ${USER_NAME:-$DEFAULT_USER_NAME} && \
  chsh -s /bin/bash ${USER_NAME:-$DEFAULT_USER_NAME} && \
  echo ${USER_NAME:-$DEFAULT_USER_NAME}':'${PASSWORD:-$DEFAULT_PASSWORD} | chpasswd && \
  echo "${USER_NAME:-$DEFAULT_USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi

if [[ 0 -eq $(id -u) ]];then
  echo 'root:root_pwd' | chpasswd
fi

#一般ユーザーでもsudoが実行できるように
#sudo: setrlimit(RLIMIT_CORE): 許可されていない操作です の対策
echo "Set disable_coredump false" >> /etc/sudo.conf


#レポジトリの設定
sed -i.bak 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list


#DNSの設定
sed -i.bak 's/#DNS=/DNS=8.8.8.8/' /etc/systemd/resolved.conf

apt update

#IME
apt install -y ibus \
               ibus-mozc

#日本語環境
apt install -y language-pack-ja-base \
               language-pack-ja


#フォント
apt install -y fonts-noto-cjk \
              fonts-noto-color-emoji



#タイムゾーン
cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
echo 'Asia/Tokyo' > /etc/timezone


#ロケール
locale-gen ja_JP.UTF-8
echo 'LC_ALL=ja_JP.UTF-8' > /etc/default/locale
echo 'LANG=ja_JP.UTF-8' >> /etc/default/locale




#開発環境再現

apt install -y git

cd /usr/local/src

git clone https://github.com/ukijumotahaneniarukenia/script-repo.git

cd script-repo


#ここは融通きかす
bash ubuntu-20-04-install-dev-pkg.sh

bash ubuntu-20-04-install-tool-pkg.sh

bash ubuntu-20-04-install-network-pkg.sh

bash ubuntu-20-04-install-vim-system.sh

bash ubuntu-20-04-install-vim-user.sh

bash ubuntu-20-04-install-vim_plug.sh

bash ubuntu-20-04-config-dotfile.sh

bash ubuntu-20-04-config-env.sh

bash ubuntu-20-04-config-ld.sh
