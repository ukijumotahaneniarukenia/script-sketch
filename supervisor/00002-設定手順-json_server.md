```
一般ユーザーで作成

$ cat <<EOS > db.json
{
  "movies": [
    {
      "id": 1,
      "name": "The Godfather",
      "director": "Francis Ford Coppola",
      "rating": 9.1
    },
    {
      "id": 2,
      "name": "Casablanca",
      "director": "Michael Curtiz",
      "rating": 8.8
    }
  ]
}
EOS


以降rootユーザーで実施

$ apt install -y jq moreutils lsof

$ npm install -g json-server
npm WARN deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
npm WARN deprecated har-validator@5.1.5: this library is no longer supported
/usr/bin/json-server -> /usr/lib/node_modules/json-server/lib/cli/bin.js
+ json-server@0.16.1
added 229 packages from 124 contributors in 13.036s



$ lsof -i:4000 -P
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
node    8426 aine   19u  IPv4 234993      0t0  TCP localhost:4000 (LISTEN)


コンテナホストとコンテナゲストをまたいでポート番号は一意にしないとだめ

すでにコンテナホストで割当ずみだとこけるので、かぶらないように指定

cat <<EOS > add-config-content.txt 
[inet_http_server]
port=127.0.0.1:9002

[supervisorctl]
serverurl=unix:///var/tmp/supervisor.sock
serverurl=http://127.0.0.1:9002
EOS


sed -i '/; supervisor config file/r add-config-content.txt' /etc/supervisor/supervisord.conf


cat <<EOS >/etc/supervisor/conf.d/supervisor-json_server.conf
[program:json_server]
command=/usr/bin/json-server --watch /home/aine/db.json --port 4000 ; 起動コマンド
user=aine ; 起動ユーザ
autorestart=true ; プロセスダウン時に自動再起動
stdout_logfile=/var/log/supervisor/supervisord-json_server.log ; 標準出力ログ
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=5
stdout_capture_maxbytes=1MB
redirect_stderr=true ; エラー出力を標準出力にリダイレクト
EOS

cat <<EOS >/etc/logrotate.d/supervisor-json_server
/var/log/supervisor/supervisord-json_server.log {
    notifempty
    dateformat .%Y%m%d
    missingok
    nocompress
    daily
    rotate 10
}
EOS



$ systemctl restart supervisor

$ systemctl status --no-pager supervisor -l
● supervisor.service - Supervisor process control system for UNIX
   Loaded: loaded (/lib/systemd/system/supervisor.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2020-09-22 23:34:12 JST; 2s ago
     Docs: http://supervisord.org
  Process: 9219 ExecStop=/usr/bin/supervisorctl $OPTIONS shutdown (code=exited, status=0/SUCCESS)
 Main PID: 9220 (supervisord)
   CGroup: /system.slice/supervisor.service
           ├─9220 /usr/bin/python /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
           └─9223 node /usr/bin/json-server --watch /home/aine/db.json --port 4000

 9月 22 23:34:12 aine-MS-7B98 systemd[1]: Started Supervisor process control system for UNIX.
 9月 22 23:34:12 aine-MS-7B98 supervisord[9220]: 2020-09-22 23:34:12,107 CRIT Supervisor running as root (no user in config file)
 9月 22 23:34:12 aine-MS-7B98 supervisord[9220]: 2020-09-22 23:34:12,107 INFO Included extra file "/etc/supervisor/conf.d/supervisor-json_server.conf" during parsing
 9月 22 23:34:12 aine-MS-7B98 supervisord[9220]: 2020-09-22 23:34:12,112 INFO RPC interface 'supervisor' initialized
 9月 22 23:34:12 aine-MS-7B98 supervisord[9220]: 2020-09-22 23:34:12,112 CRIT Server 'inet_http_server' running without any HTTP authentication checking
 9月 22 23:34:12 aine-MS-7B98 supervisord[9220]: 2020-09-22 23:34:12,112 INFO RPC interface 'supervisor' initialized
 9月 22 23:34:12 aine-MS-7B98 supervisord[9220]: 2020-09-22 23:34:12,112 CRIT Server 'unix_http_server' running without any HTTP authentication checking
 9月 22 23:34:12 aine-MS-7B98 supervisord[9220]: 2020-09-22 23:34:12,112 INFO supervisord started with pid 9220
 9月 22 23:34:13 aine-MS-7B98 supervisord[9220]: 2020-09-22 23:34:13,116 INFO spawned: 'json_server' with pid 9223
 9月 22 23:34:14 aine-MS-7B98 supervisord[9220]: 2020-09-22 23:34:14,334 INFO success: json_server entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)


$ sudo lsof -i:4000 -i:9002 -P
COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
superviso 9220 root    4u  IPv4 244571      0t0  TCP localhost:9002 (LISTEN)
node      9223 aine   19u  IPv4 246726      0t0  TCP localhost:4000 (LISTEN)


$ brave-browser http://localhost:4000

$ brave-browser http://localhost:9002


```
