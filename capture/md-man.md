キャプチャとるとき

```
１回目

Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &

export DISPLAY=:99

firefox --new-window https://www.centos.org/ 1 >$HOME/launch-firefox.log 2>&1 &

xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/１回目.png

２回目

Xvfb :100 -screen 0 1024x768x24 > /dev/null 2>&1 &

export DISPLAY=:100

firefox --new-window https://wiki.centos.org/ 1 >$HOME/launch-firefox.log 2>&1 &

xwd -display :100 -root | xwdtopnm | pnmtopng > /home/aine/media/２回目.png

```

前回のfirefoxプロセスを消してキャプチャ取りに行くようにせぬといけん


なので、DISPLAY番号は一つだけでいいのでは-->よかった


レンダラ時間を考慮してキャプチャとりいくまでの待ち時間を3秒くらいにしておく


ローカルホスト以外

```

前処理

ps uax | grep Xvfb | awk '{print $2}' | xargs -I@ kill -9 @

ps aux | grep firefox | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &

export DISPLAY=:99

メイン処理

１回目

firefox --new-window https://www.centos.org/ 1 >$HOME/launch-firefox.log 2>&1 &

xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/04.png

２回目

ps aux | grep firefox | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

firefox --new-window https://wiki.centos.org/ 1 >$HOME/launch-firefox.log 2>&1 &

xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/05.png

後処理

chown -R aine:aine /home/aine/media/

ls -l /home/aine/media/

```



ローカルホスト:8080はだめ（外部公開用ポートなので）

```

前処理

ps uax | grep Xvfb | awk '{print $2}' | xargs -I@ kill -9 @

ps aux | grep firefox | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &

export DISPLAY=:99

メイン処理

１回目

firefox --new-window http://localhost:8080/index-1.html 1 >$HOME/launch-firefox.log 2>&1 &

xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/08.png

２回目

ps aux | grep firefox | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

firefox --new-window http://localhost:8080/index-2.html 1 >$HOME/launch-firefox.log 2>&1 &

xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/09.png

後処理

chown -R aine:aine /home/aine/media/

ls -l /home/aine/media/

```

ローカルホスト:80（いけた）

```
前処理

ps uax | grep Xvfb | awk '{print $2}' | xargs -I@ kill -9 @

ps aux | grep firefox | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &

export DISPLAY=:99

メイン処理

１回目

firefox --new-window http://localhost:80/index-1.html 1 >$HOME/launch-firefox.log 2>&1 &

xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/08.png

２回目

ps aux | grep firefox | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

firefox --new-window http://localhost:80/index-2.html 1 >$HOME/launch-firefox.log 2>&1 &

xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/09.png

後処理

chown -R aine:aine /home/aine/media/

ls -l /home/aine/media/
```


これはだめ（なんどもやりすぎるとfirefoxぶっこわれそう）

```
$cat a.sh



#!/usr/bin/env bash

#preprocess

/usr/sbin/httpd 1>$HOME/launch-apache-httpd.log 2>&1

chown -R apache:apache /var/www/*

ps uax | grep Xvfb | awk '{print $2}' | xargs -I@ kill -9 @

ps aux | grep firefox | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &

export DISPLAY=:99

rm -f /home/aine/media/*png

sleep 3 #wait for http process safe launch

ps aux

#mainprocess

seq 1 | while read n;do
  (
    echo unko-$n >/var/www/html/index-$n.html;

    ps aux | grep firefox | grep -v grep | awk '{print $2}' | xargs -I@ kill -9 @

    sleep 3

    firefox --safe-mode --new-window http://localhost:80/index-$n.html 1>$HOME/launch-index-$n.log 2>&1 &

    sleep 3

    xwd -display :99 -root | xwdtopnm | pnmtopng > /home/aine/media/$(printf "%02d" $n ).png
  )
done

#postprocess

chown -R aine:aine /home/aine/media/

ls -l /home/aine/media

ps uax | grep /usr/sbin/httpd | awk '{print $2}' | xargs -I@ kill -9 @
```
