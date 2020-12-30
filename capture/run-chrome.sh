#!/usr/bin/env bash

#prerequisite
cat <<EOS > /etc/yum.repos.d/google.chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOS

yum update

yum install -y google-chrome-stable

bash /usr/local/src/script-repo/centos-7-6-18-10-install-nodejs-12-X-X.sh

npm install -g testem

testem launchers

#preprocess

/usr/sbin/httpd 1>$HOME/launch-apache-httpd.log 2>&1

chown -R apache:apache /var/www/*

ps uax | grep Xvfb | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

ps aux | grep google-chrome | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &

export DISPLAY=:99

rm -f /home/aine/media/*png

ps aux

#mainprocess
#クロムの場合ダミーで１回かますことが大事０回目で対応
seq 0 10 | while read n;do
  (
    echo unko-$n >/var/www/html/index-$n.html;

    ps aux | grep google-chrome | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

    google-chrome --no-sandbox --noerrdialogs --new-window http://localhost:80/index-$n.html 1>$HOME/launch-index-$n.log 2>&1 &

    sleep 2 #レンダラ時間を待つつもり

    xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/$(printf "%05d" $n ).png
  )
done

#postprocess

chown -R aine:aine /home/aine/media/

ls -l /home/aine/media

ps uax | grep /usr/sbin/httpd | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @
