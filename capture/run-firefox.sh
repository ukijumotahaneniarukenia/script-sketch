#!/usr/bin/env bash

#preprocess

/usr/sbin/httpd 1>$HOME/launch-apache-httpd.log 2>&1

chown -R apache:apache /var/www/*

#なぜかアウトしないと動かんくなた
#ps uax | grep Xvfb | grep -v grep | awk '{print $2}' | \
#  while read p;do
#    if [ -z $p ];then
#      :
#    else
#      kill -9 $p
#    fi
#  done
#
#ps aux | grep firefox | grep -v grep | awk '{print $2}' | \
#  while read p;do
#    if [ -z $p ];then
#      :
#    else
#      kill -9 $p
#    fi
#  done

Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &

export DISPLAY=:99

rm -f /home/aine/media/*png

ps aux

#mainprocess
#firefoxもダミーでいれとく
seq 0 10 | while read n;do
  (
    echo unko-$n >/var/www/html/index-$n.html;

#なぜかアウトしないと動かんくなた
#    ps aux | grep firefox | grep -v grep | awk '{print $2}' | \
#      while read p;do
#        if [ -z $p ];then
#          :
#        else
#          kill -9 $p
#        fi
#      done

    firefox --new-window http://localhost:80/index-$n.html 1>$HOME/launch-index-$n.log 2>&1 &

    sleep 2 #レンダラ時間を待つつもり

    xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/$(printf "%05d" $n ).png
  )
done

#postprocess

chown -R aine:aine /home/aine/media/

ls -l /home/aine/media

ps uax | grep /usr/sbin/httpd | grep -v grep | awk '{print $2}' | \
  while read p;do
    if [ -z $p ];then
      :
    else
      kill -9 $p
    fi
  done
