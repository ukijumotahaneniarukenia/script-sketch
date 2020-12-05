事前準備

nginxなど事前にインストールしておく。
nginx設定ファイルjsonで吐けないか？？？

```
$ apt install php-fpm php-cgi php

$ ls -lh /etc/php/7.4/fpm/pool.d/www.conf
-rw-r--r-- 1 root root 20K 10月  7 00:47 /etc/php/7.4/fpm/pool.d/www.conf

$ sed -r -i.bak 's/user = nginx/user = www-data/;s/group = nginx/group = www-data/;' /etc/php/7.4/fpm/pool.d/www.conf

$ php-fpm7.4 
[05-Dec-2020 17:42:52] ERROR: Another FPM instance seems to already listen on /run/php/php7.4-fpm.sock
[05-Dec-2020 17:42:52] ERROR: FPM initialization failed

エントリサブファイルのみ追加
$ cat /etc/nginx/conf.d/php-cgi.conf 
server {
    listen       9999;
    server_name  localhost;

    location ~ \.(php)$ {
      root   /var/www/cgi-bin;
      fastcgi_pass   unix:/run/php/php7.4-fpm.sock;
      fastcgi_index  index.php;
      fastcgi_param  SCRIPT_FILENAME
      $document_root$fastcgi_script_name;
      include        fastcgi_params;
    }
}

エントリサブファイル以外はデフォルトからの変更なし
/etc/nginx/nginx.conf 
```


APIサーバプログラム作成

```
$ cat cgi-bin/php-api.php 
<?php

// レスポンスヘッダの設定
header("Access-Control-Allow-Origin: https://ukijumotahaneniarukenia.postman.co"); // PostmanからのリクエストはCORSに引っかるので、信頼できるドメインならレスポンスヘッダに許可する
header('Content-Type: application/json; charset=UTF-8');

// パラメータが空文字でないかつ数字のみで構成されているか
if(isset($_GET["num"]) && !preg_match('/[^0-9]/', $_GET["num"])) {

    // パラメータエスケープ(xss対策)
    $param = htmlspecialchars($_GET["num"]);

    // キー名にアンダースコアとハイフンを許容する
    $arr["status"] = 0;
    $arr["numstr"] = (string)((int)$param * 10); // 型キャストなど
    $arr["num"] = ((int)$param * 10); // 型キャトなど
    $arr["isNum"] = true;
    $arr["list-str"] = ["a","b","c"];
    $arr["list_num"] = [1,2,3];
    $arr["list_dict"] = ["a"=>1,"b"=>2,"c"=>3];
    $arr["list_dict_in_list"] = ["a"=>[1,11,111],"b"=>2,"c"=>[3,33,333]];
    $arr["list_dict_in_dict"] = "これはむり";
    $arr["message"] = "success";

} else {

    $arr["status"] = 1;
    $arr["message"] = "invalid post parameter";
}

print json_encode($arr, JSON_UNESCAPED_UNICODE);
```


```
$ cat /var/www/cgi-bin/php-info.php 
<?php phpinfo();
```



動作確認

ブラウザから見てもOK

```
$ curl -s 'http://localhost:9999/php-api.php?num=' | jq
{
  "status": 0,
  "numstr": "0",
  "num": 0,
  "isNum": true,
  "list-str": [
    "a",
    "b",
    "c"
  ],
  "list_num": [
    1,
    2,
    3
  ],
  "list_dict": {
    "a": 1,
    "b": 2,
    "c": 3
  },
  "list_dict_in_list": {
    "a": [
      1,
      11,
      111
    ],
    "b": 2,
    "c": [
      3,
      33,
      333
    ]
  },
  "list_dict_in_dict": "これはむり",
  "message": "success"
}

$ curl -s 'http://localhost:9999/php-api.php'|jq
{
  "status": 1,
  "message": "invalid post parameter"
}

$ curl -s 'http://localhost:9999/php-info.php'|tidy -i 2>/dev/null

```


Postmanからの動作確認

ローカルホストでPostman-Agentを起動しておく。
右上のステータスバーにオレンジ色のアイコンが現れる。

```
$ Postman-Agent
```

WEB画面より動作確認したいURLを入力し、Sendする。
- https://ukijumotahaneniarukenia.postman.co


動作確認対象のエントリポイント

```
http://localhost:9999/php-api.php?num=10
```
