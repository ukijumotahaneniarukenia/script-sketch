#!/usr/bin/env bash

WORKDIR=/var/lib/machines

START_HOST_NO=02
END_HOST_NO=05

PREFIX=vir-

TEMPLATE_OS=ubuntu-20-04

SUFFIX=-template

SEED_NAME=$PREFIX$TEMPLATE_OS$SUFFIX

REPLICA_NAME=$PREFIX$TEMPLATE_OS

DEPLOY_DIR=/etc/systemd/network

CONTAINER_HOST0_NETWORK_NAME=80-container-host0.network

HOST0_NETWORK_NAME=host0.network

KEYWORDS=($CONTAINER_HOST0_NETWORK_NAME $HOST0_NETWORK_NAME)

ACTION_LIST=(enable start)

MY_ROUTER_IP=192.168.1.1

GOOGLE_DNS_IP=8.8.8.8

RESOLVE_CONF_FILE_PATH=/etc/systemd/resolved.conf

SEGMENT_THIRD_OCTET_IP=192.168.1
SEGMENT_FORTH_OCTET_START_IP=209

{
  eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I@ echo rm -rf $WORKDIR/$REPLICA_NAME-@

  eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I@ echo cp -a $WORKDIR/$SEED_NAME $WORKDIR/$REPLICA_NAME-@

  eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | while read n;do printf "machinectl start $REPLICA_NAME-%s\n" $(printf "%02d" $n);done

  #一旦ログインパスワードは一行ずつやさしく
  #TODOなんとかしたい
  eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | while read n;do printf "machinectl shell root@$REPLICA_NAME-%s /bin/bash -c \x27echo \x22root:root_pwd\x22|chpasswd\x27;\n" $(printf "%02d" $n);done

  eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | xargs -I{} echo machinectl shell root@$REPLICA_NAME-{} /usr/bin/ln -sf /dev/null $DEPLOY_DIR/$CONTAINER_HOST0_NETWORK_NAME

  eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | while read n;do printf "machinectl shell root@$REPLICA_NAME-%s /usr/bin/sed -i \x27s/#DNS/DNS=$MY_ROUTER_IP/\x27 $RESOLVE_CONF_FILE_PATH\n" $(printf "%02d" $n);done


  CNT=$(eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1 | wc -l)

  seq $CNT | xargs -I@ echo echo $GOOGLE_DNS_IP $SEGMENT_THIRD_OCTET_IP.$\[$SEGMENT_FORTH_OCTET_START_IP+@\] $MY_ROUTER_IP|bash | \
    while read google_dns_ip server_ip my_router_ip;do
      sed "s/GOOGLE_DNS_IP/$google_dns_ip/;s/SERVER_IP/$server_ip/;s/MY_ROUTER_IP/$my_router_ip/;" $CONTAINER_HOST0_NETWORK_NAME >$WORKDIR/$CONTAINER_HOST0_NETWORK_NAME-$server_ip;
    done

  seq $CNT | xargs -I@ echo echo $SEGMENT_THIRD_OCTET_IP.$\[$SEGMENT_FORTH_OCTET_START_IP+@\] $MY_ROUTER_IP |bash|\
    while read server_ip my_router_ip;do
      sed "s/SERVER_IP/$server_ip/;s/MY_ROUTER_IP/$my_router_ip/;" $HOST0_NETWORK_NAME >$HOST0_NETWORK_NAME-$server_ip;
    done


  for keyword in ${KEYWORDS[@]} ;do

    eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1|nl|\
      while read n h;do
        echo cp $(ls $keyword* | grep $SEGMENT_THIRD_OCTET_IP.$[$SEGMENT_FORTH_OCTET_START_IP+$n]) $REPLICA_NAME-$(printf "%02d" $[n+1])$DEPLOY_DIR/$keyword;
      done

  done

  for action in ${ACTION_LIST[@]} ;do

    eval echo {$START_HOST_NO..$END_HOST_NO} | xargs -n1|nl|\
      while read n h;do
        echo machinectl shell root@$REPLICA_NAME-$(printf "%02d" $[n+1]) /bin/systemctl $action systemd-networkd
        echo machinectl shell root@$REPLICA_NAME-$(printf "%02d" $[n+1]) /bin/systemctl $action systemd-resolved
      done

  done
} #| bash
