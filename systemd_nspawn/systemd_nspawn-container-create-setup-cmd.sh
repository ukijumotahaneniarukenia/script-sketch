#!/usr/bin/env bash

WORKDIR=/var/lib/machines

PREFIX=vir-

TEMPLATE_OS=ubuntu-20-04

SUFFIX=-template

SEED_NAME=$PREFIX$TEMPLATE_OS$SUFFIX

REPLICA_NAME=$PREFIX$TEMPLATE_OS

DEPLOY_DIR=/etc/systemd/network

CONTAINER_HOST0_NETWORK_NAME=80-container-host0.network

HOST0_NETWORK_NAME=host0.network

OUTPUT_FILE_NAME=systemd-container-execute-setup-cmd.sh

KEYWORDS=($CONTAINER_HOST0_NETWORK_NAME $HOST0_NETWORK_NAME)

ACTION_LIST=(stop enable start status)

MY_ROUTER_IP=192.168.1.1

GOOGLE_DNS_IP=8.8.8.8

RESOLVE_CONF_FILE_PATH=/etc/systemd/resolved.conf

SEGMENT_THIRD_OCTET_IP=192.168.1
SEGMENT_FORTH_OCTET_START_IP=209

SUBGRP_DIGIT="%03d"

usage(){
cat <<EOS
Usage:

  PRE: su root

   IN: $0 1 5 > $WORKDIR/$OUTPUT_FILE_NAME

  OUT:


EOS

exit 0

}

if [[ $UID  -ne 0 ]];then

  usage

fi

s=$1;shift;
e=$1;shift;

if [[ -z $s ]];then

  usage

fi

if [[ -z $e ]];then

  usage

fi

if [[ $s -le 0 ]];then

  usage

fi

if [[ $e -le 0 ]];then

  usage

fi

START_HOST_NO=$(printf $SUBGRP_DIGIT $s)
END_HOST_NO=$(printf $SUBGRP_DIGIT $e)

#ロックファイルの削除
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I@ echo "ls $WORKDIR/.#$REPLICA_NAME-@ | xargs rm -rf"

#仮想コンテナプロセスの停止
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I@ echo "cd $WORKDIR && machinectl terminate $REPLICA_NAME-@"

#仮想コンテナファイル群の削除
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I@ echo rm -rf $WORKDIR/$REPLICA_NAME-@

#仮想コンテナファイルの配備
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I@ echo cp -a $WORKDIR/$SEED_NAME $WORKDIR/$REPLICA_NAME-@

#仮想コンテナプロセスの開始
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | while read n;do printf "cd $WORKDIR && machinectl start $REPLICA_NAME-%s\n" $(printf $SUBGRP_DIGIT $n);done

#仮想コンテナのrootユーザーのパスワード設定
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | while read n;do printf "cd $WORKDIR && machinectl shell root@$REPLICA_NAME-%s /bin/bash -c \x27echo \x22root:root_pwd\x22|chpasswd\x27;\n" $(printf "%02d" $n);done

#おまじない
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I{} echo "cd $WORKDIR && machinectl shell root@$REPLICA_NAME-{} /usr/bin/ln -sf /dev/null $DEPLOY_DIR/$CONTAINER_HOST0_NETWORK_NAME"

#DNSの設定
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | while read n;do printf "cd $WORKDIR && machinectl shell root@$REPLICA_NAME-%s /usr/bin/sed -i \x27s/#DNS/DNS=$MY_ROUTER_IP/\x27 $RESOLVE_CONF_FILE_PATH\n" $(printf "%02d" $n);done


CNT=$(eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | wc -l)

#仮想ホスト用のネットワーク設定ファイルと仮想ゲスト用のネットワーク設定ファイルを作成
#テンプレートファイルからの生成
seq $CNT | xargs -I@ echo echo $GOOGLE_DNS_IP $SEGMENT_THIRD_OCTET_IP.$\[$SEGMENT_FORTH_OCTET_START_IP+@\] $MY_ROUTER_IP|bash | \
  while read google_dns_ip server_ip my_router_ip;do
    sed "s/GOOGLE_DNS_IP/$google_dns_ip/;s/SERVER_IP/$server_ip/;s/MY_ROUTER_IP/$my_router_ip/;" $CONTAINER_HOST0_NETWORK_NAME >$WORKDIR/$CONTAINER_HOST0_NETWORK_NAME-$server_ip;
  done

seq $CNT | xargs -I@ echo echo $SEGMENT_THIRD_OCTET_IP.$\[$SEGMENT_FORTH_OCTET_START_IP+@\] $MY_ROUTER_IP |bash|\
  while read server_ip my_router_ip;do
    sed "s/SERVER_IP/$server_ip/;s/MY_ROUTER_IP/$my_router_ip/;" $HOST0_NETWORK_NAME >$WORKDIR/$HOST0_NETWORK_NAME-$server_ip;
  done

#仮想ホスト用のネットワーク設定ファイルと仮想ゲスト用のネットワーク設定ファイルを配備
for keyword in ${KEYWORDS[@]} ;do

  eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1|nl|\

    while read n h;do

      echo cp $(ls $WORKDIR/$keyword* | grep  $SEGMENT_THIRD_OCTET_IP.$[$SEGMENT_FORTH_OCTET_START_IP+$n]) $WORKDIR/$REPLICA_NAME-$(printf  $SUBGRP_DIGIT $[n])$DEPLOY_DIR/$keyword;

    done

done

#仮想コンテナ側のネットワークプロセスないしリゾルバプロセスの停止、有効化、開始、状態確認
for action in ${ACTION_LIST[@]} ;do

  eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1|nl|\
    while read n h;do
      echo "cd $WORKDIR && machinectl shell root@$REPLICA_NAME-$(printf $SUBGRP_DIGIT $[n]) /bin/systemctl $action systemd-networkd"
      echo "cd $WORKDIR && machinectl shell root@$REPLICA_NAME-$(printf $SUBGRP_DIGIT $[n]) /bin/systemctl $action systemd-resolved"
    done

done

#仮想ホスト側のデーモンプロセスの停止、有効化、開始、状態確認
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I{} echo systemctl stop systemd-nspawn@$REPLICA_NAME-{}.service
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I{} echo systemctl enable systemd-nspawn@$REPLICA_NAME-{}.service
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I{} echo systemctl start systemd-nspawn@$REPLICA_NAME-{}.service
eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I{} echo systemctl status systemd-nspawn@$REPLICA_NAME-{}.service

#実行ファイルのバージョン管理
cp $WORKDIR/$OUTPUT_FILE_NAME /home/aine/script-sketch/systemd_nspawn/$OUTPUT_FILE_NAME
chown -R aine:aine /home/aine/script-sketch/systemd_nspawn/$OUTPUT_FILE_NAME

#設定ファイルのバージョン管理
cp $WORKDIR/*host0.network* /home/aine/script-sketch/systemd_nspawn/
chown -R aine:aine /home/aine/script-sketch/systemd_nspawn/*host0.network*
