- httpサーバインストール


```
$ apt install -y apache2
```

- プロセス起動

```
$ apache2ctl start
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.3. Set the 'ServerName' directive globally to suppress this message
```

- プロセス確認

```
$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine        1  0.0  0.0  19528  3500 pts/0    Ss   21:00   0:00 bash /etc/init/run.sh ubuntu
kuraine        9  0.0  0.0  19924  4232 pts/0    S+   21:00   0:00 bash
kuraine      192  0.0  0.0  19924  4248 pts/1    Ss   21:56   0:00 /bin/bash
root         227  0.0  0.0  54556  3504 pts/1    S    21:56   0:00 su root
root         228  0.0  0.0  20060  4260 pts/1    S    21:56   0:00 bash
root         742  0.0  0.0  73956  4684 ?        Ss   21:59   0:00 /usr/sbin/apache2 -k start
www-data     745  0.0  0.0 2001520 4432 ?        Sl   21:59   0:00 /usr/sbin/apache2 -k start
www-data     746  0.0  0.0 2001520 4432 ?        Sl   21:59   0:00 /usr/sbin/apache2 -k start
root         814  0.0  0.0  35556  3404 pts/1    R+   21:59   0:00 ps aux

$ lsof -i:80
COMMAND PID     USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
apache2 742     root    3u  IPv4 1808350      0t0  TCP *:http (LISTEN)
apache2 745 www-data    3u  IPv4 1808350      0t0  TCP *:http (LISTEN)
apache2 746 www-data    3u  IPv4 1808350      0t0  TCP *:http (LISTEN)
```

- 動作確認
  -以下のURLをクリックし、ページが表示されるか
    - http://localhost


以下の手順に従いOAuth認証

- https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow


ブラウザをインストール

```
apt install -y firefox
```

ブラウザ起動

```
firefox
```

dockerコンテナ内で起動したブラウザのURL欄に以下を入力
https://github.com/settings/applications/new


以下を入力後、Register Applicationボタンを押下

|key|value|
|:-:|:-:|
|Application name|app|
|Homepage URL|http://localhost|
|Application description|test|
|Authorization callback URL|http://localhost|


クライアントIDとクライアント秘密鍵が記載されたページへ遷移するので、それらをメモ

dockerコンテナ内で起動したブラウザのURL欄に以下を入力

```
CLIENT_ID=5f724fb2d85a10d8e8dc
REDIRECT_URI=http://localhost:80

https://github.com/login/oauth/authorize?client_id=CLIENT_ID&redirect_uri=REDIRECT_URI
```

githubのログイン画面が表示されるので、ユーザー名とパスワードを入力する

ログイン後、リダイレクト先ページのアドレスバーにアクセストークンがついたURLが返却されるので、それをメモ

```
http://localhost/?code=79c7c1260c05e3911734
```

dockerコンテナ内で起動したブラウザのURL欄に以下を入力

```
CLIENT_ID=5f724fb2d85a10d8e8dc
REDIRECT_URI=http://localhost:80
CLIENT_SECRET=ad2d9f8cb649a8026c4adc49dc8557cb6487a9bf
CODE=79c7c1260c05e3911734

ブラウザから実行
https://github.com/login/oauth/access_token?client_id=CLIENT_ID&client_secret=CLIENT_SECRET&code=CODE&redirect_uri=REDIRECT_URI

コマンドラインから実行
curl -X POST -d "client_id=CLIENT_ID&client_secret=CLIENT_SECRET&code=CODE&redirect_uri=REDIRECT_URI" https://github.com/login/oauth/access_token
```

ダイアログが出るので、保存。ブラウザのURL欄に入力した場合は以下のファイルに保存される。

```
$ cat /tmp/mozilla_root0/access_token
access_token=e79956c865f55da8380529d2165bdff2cca72811&scope=&token_type=bearer
```

- あとは規約に従いいろいろ取得
  - https://developer.github.com/v3/gists/#list-gists-for-a-user

```
ACCESS_TOKEN=e79956c865f55da8380529d2165bdff2cca72811

curl -H "Authorization: token ACCESS_TOKEN" https://api.github.com/users/ukijumotahaneniarukenia/gists
```



raw_url一覧取得

なお、apiはpublicしかとれなかった

```
curl -s -H "Authorization: token e79956c865f55da8380529d2165bdff2cca72811" https://api.github.com/users/ukijumotahaneniarukenia/gists | jq '' >a.json

cat a.json | jq --stream -c '' | grep raw_url | jq -r '{key:(.[0]|map(if type=="number" then tostring else . end))|join("-"),value:.[1]}|.value'
https://gist.githubusercontent.com/ukijumotahaneniarukenia/605925faaa0e7e7af57a1b9e6aebef22/raw/4663b4c9e43c95f2ce9f7c14eebfcd8d98bc518f/test
```

raw_url一覧取得できたら、

dockerコンテナ内で起動したブラウザのURL欄に以下を入力

  - https://github.com/settings/developers


appを削除し、作業終了
