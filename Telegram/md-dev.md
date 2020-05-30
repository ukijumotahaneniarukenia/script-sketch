apiなど動き調査したい

- https://core.telegram.org/api

- https://desktop.telegram.org/

```

```


```

mv /home/aine/media/tsetup.2.1.7.tar.xz /usr/local/src

cd /usr/local/src

chown -R root:root tsetup.2.1.7.tar.xz


tar xvf tsetup.2.1.7.tar.xz


chown -R root:root Telegram/



```


アプリ起動

初期登録はスマホからがいい

デスクトップ版アプリの起動

一般ユーザーで起動

```

/usr/local/src/Telegram/Telegram 1>$HOME/launch-Telegram.log 2>&1 &

```


プロセス停止

```


ps aux | grep Telegram | grep -v grep | awk '{print $2}' | xargs kill -9


```
