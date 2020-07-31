#!/usr/bin/env bash

DEFAULT_USER_ID=1000
DEFAULT_USER_NAME=developer
DEFAULT_GROUP_ID=1000
DEFAULT_GROUP_NAME=developer
DEFAULT_PASSWORD=develoer_pwd

USER_ID=${USER_ID:-${DEFAULT_USER_ID}}
USER_NAME=${USER_NAME:-${DEFAULT_USER_NAME}}
GROUP_ID=${GROUP_ID:-${DEFAULT_GROUP_ID}}
GROUP_NAME=${GROUP_NAME:-${DEFAULT_GROUP_NAME}}
PASSWORD=${PASSWORD:-${DEFAULT_PASSWORD}}

echo $USER_ID
echo $USER_NAME
echo $GROUP_ID
echo $GROUP_NAME
echo $PASSWORD

whoami

groupadd -g $GROUP_ID $GROUP_NAME

export HOME=/home/$USER_NAME

useradd -d ${HOME} -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USER_NAME

echo $HOME

whoami

xrdp-keygen xrdp /etc/xrdp/rsakeys.ini > /dev/null 2>&1

ls -l /etc/xrdp/rsakeys.ini

chown -R xrdp:xrdp /etc/xrdp/rsakeys.ini

ls -l /etc/xrdp/rsakeys.ini

#一般ユーザーで実行

ls -l /etc/skel/.xsession

#ホームディレクトリ配下は一般ユーザの持ち物になってくれている
cp /etc/skel/.xsession ${HOME}/.xsession

ls -l ${HOME}/.xsession

#一般ユーザーでroot権限で実行できるように修正
install -g $GROUP_ID -m 4750 $(which gosu) /usr/local/bin/_gosu

#引数に指定した設定ファイルをもとに常駐デーモンプロセス作成
ENTRY_CMD="/usr/local/bin/_gosu root /usr/bin/supervisord -c /etc/supervisor/xrdp.conf"

su - $USER_NAME <<EOS

#変数設定

echo ユーザ切り替え

echo "$ENTRY_CMD"

whoami

which _gosu

ls -l /usr/bin/supervisord

ls -l /etc/supervisor/xrdp.conf

eval "$ENTRY_CMD"

EOS
