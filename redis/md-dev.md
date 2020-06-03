環境ディレクトリ
doc-ubuntu-18-04-vim

https://redis.io/download


インストール

```

wget http://download.redis.io/releases/redis-6.0.3.tar.gz

tar xvf redis-6.0.3.tar.gz

cd redis-6.0.3

make -j12

make -j12 install

```

実行バイナリなど

```
$find / -name "*redis*" | grep bin
/usr/local/bin/redis-check-aof
/usr/local/bin/redis-sentinel
/usr/local/bin/redis-benchmark
/usr/local/bin/redis-check-rdb
/usr/local/bin/redis-server
/usr/local/bin/redis-cli
```

```
$redis-server --help
Usage: ./redis-server [/path/to/redis.conf] [options]
       ./redis-server - (read config from stdin)
       ./redis-server -v or --version
       ./redis-server -h or --help
       ./redis-server --test-memory <megabytes>

Examples:
       ./redis-server (run the server with default conf)
       ./redis-server /etc/redis/6379.conf
       ./redis-server --port 7777
       ./redis-server --port 7777 --replicaof 127.0.0.1 8888
       ./redis-server /etc/myredis.conf --loglevel verbose

Sentinel mode:
       ./redis-server /etc/sentinel.conf --sentinel
```

プロセス起動

```
$redis-server 1>$HOME/launch-redis.log 2>&1 &
[1] 5897

$ ps uax
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  19520  1720 pts/0    Ss   12:10   0:00 bash /etc/init/run.sh ubuntu
kuraine      7  0.0  0.0  19916  2296 pts/0    S+   12:10   0:00 bash
kuraine     29  0.0  0.0  20016  2632 pts/1    Ss   12:11   0:00 /bin/bash
kuraine   5897  0.0  0.0  60764  3112 pts/1    Sl   12:23   0:00 redis-server *:6379
kuraine   5911  0.0  0.0  35548  1568 pts/1    R+   12:23   0:00 ps uax


$lsof -P -i:6379
COMMAND    PID    USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
redis-ser 5897 kuraine    6u  IPv6 6044499      0t0  TCP *:6379 (LISTEN)
redis-ser 5897 kuraine    7u  IPv4 6044500      0t0  TCP *:6379 (LISTEN)

```

クライアントプログラム

```
$redis-cli --help

redis-cli 6.0.3

Usage: redis-cli [OPTIONS] [cmd [arg [arg ...]]]
  -h <hostname>      Server hostname (default: 127.0.0.1).
  -p <port>          Server port (default: 6379).
  -s <socket>        Server socket (overrides hostname and port).
  -a <password>      Password to use when connecting to the server.
                     You can also use the REDISCLI_AUTH environment
                     variable to pass this password more safely
                     (if both are used, this argument takes predecence).
  --user <username>  Used to send ACL style 'AUTH username pass'. Needs -a.
  --pass <password>  Alias of -a for consistency with the new --user option.
  --askpass          Force user to input password with mask from STDIN.
                     If this argument is used, '-a' and REDISCLI_AUTH
                     environment variable will be ignored.
  -u <uri>           Server URI.
  -r <repeat>        Execute specified command N times.
  -i <interval>      When -r is used, waits <interval> seconds per command.
                     It is possible to specify sub-second times like -i 0.1.
  -n <db>            Database number.
  -3                 Start session in RESP3 protocol mode.
  -x                 Read last argument from STDIN.
  -d <delimiter>     Multi-bulk delimiter in for raw formatting (default: \n).
  -c                 Enable cluster mode (follow -ASK and -MOVED redirections).
  --raw              Use raw formatting for replies (default when STDOUT is
                     not a tty).
  --no-raw           Force formatted output even when STDOUT is not a tty.
  --csv              Output in CSV format.
  --stat             Print rolling stats about server: mem, clients, ...
  --latency          Enter a special mode continuously sampling latency.
                     If you use this mode in an interactive session it runs
                     forever displaying real-time stats. Otherwise if --raw or
                     --csv is specified, or if you redirect the output to a non
                     TTY, it samples the latency for 1 second (you can use
                     -i to change the interval), then produces a single output
                     and exits.
  --latency-history  Like --latency but tracking latency changes over time.
                     Default time interval is 15 sec. Change it using -i.
  --latency-dist     Shows latency as a spectrum, requires xterm 256 colors.
                     Default time interval is 1 sec. Change it using -i.
  --lru-test <keys>  Simulate a cache workload with an 80-20 distribution.
  --replica          Simulate a replica showing commands received from the master.
  --rdb <filename>   Transfer an RDB dump from remote server to local file.
  --pipe             Transfer raw Redis protocol from stdin to server.
  --pipe-timeout <n> In --pipe mode, abort with error if after sending all data.
                     no reply is received within <n> seconds.
                     Default timeout: 30. Use 0 to wait forever.
  --bigkeys          Sample Redis keys looking for keys with many elements (complexity).
  --memkeys          Sample Redis keys looking for keys consuming a lot of memory.
  --memkeys-samples <n> Sample Redis keys looking for keys consuming a lot of memory.
                     And define number of key elements to sample
  --hotkeys          Sample Redis keys looking for hot keys.
                     only works when maxmemory-policy is *lfu.
  --scan             List all keys using the SCAN command.
  --pattern <pat>    Useful with --scan to specify a SCAN pattern.
  --intrinsic-latency <sec> Run a test to measure intrinsic system latency.
                     The test will run for the specified amount of seconds.
  --eval <file>      Send an EVAL command using the Lua script at <file>.
  --ldb              Used with --eval enable the Redis Lua debugger.
  --ldb-sync-mode    Like --ldb but uses the synchronous Lua debugger, in
                     this mode the server is blocked and script changes are
                     not rolled back from the server memory.
  --cluster <command> [args...] [opts...]
                     Cluster Manager command and arguments (see below).
  --verbose          Verbose mode.
  --no-auth-warning  Don't show warning message when using password on command
                     line interface.
  --help             Output this help and exit.
  --version          Output version and exit.

Cluster Manager Commands:
  Use --cluster help to list all available cluster manager commands.

Examples:
  cat /etc/passwd | redis-cli -x set mypasswd
  redis-cli get mypasswd
  redis-cli -r 100 lpush mylist x
  redis-cli -r 100 -i 1 info | grep used_memory_human:
  redis-cli --eval myscript.lua key1 key2 , arg1 arg2 arg3
  redis-cli --scan --pattern '*:12345*'

  (Note: when using --eval the comma separates KEYS[] from ARGV[] items)

When no command is given, redis-cli starts in interactive mode.
Type "help" in interactive mode for information on available commands
and settings.

```





```
$ redis-cli
127.0.0.1:6379> ping
PONG

```



データ投入スクリプト


- https://yomon.hatenablog.com/entry/2017/04/25/112502

```
$ ls
asyncomplete.log  dotfile  dump.rdb  insert-data.sh  key-value.txt  launch-mozc.log  launch-redis.log  result.txt  vim-lsp.log

$ cat insert-data.sh
#!/usr/bin/env bash

redis_host=127.0.0.1
redis_port=6379
redis_db=2 #2番目のdbファイルに
result_file=result.txt
data_file=key-value.txt

echo "" > $result_file
exec 6<>/dev/tcp/${redis_host}/${redis_port} #ディスクリプタ６番で双方向通信
cat <&6 >> $result_file & #オープンした６番で標準入力を読込み、結果ファイルに書き込む処理をバッググラウンドで待機
echo "select ${redis_db}" >&6 #ログ情報追記 書き込むデータベース名を追記
timer=$SECONDS
i=0
total_record=$(cat ${data_file} | wc -l)
cat ${data_file} | while read key value;
do
  i=$((++i))
  echo -e " SET \"${key}\" \"${value}\"" >&6 #SET句のデータをデータファイル件数分追記
  #進捗状況表示
  if [ $(($i%10000)) -eq 0 ];then echo -en "Progress: $((${i}*100/${total_record}))%\r";fi #１万回ごとに全体件数のうち、１００件書込できたら進捗率を表示
done

#結果表示
total_sec=$(($SECONDS - ${timer}))
total_ok=$(grep "+OK" ${result_file} | wc -l)
echo "${total_record} items in the ${data_file}"
echo "${total_ok} items inserted in ${total_sec} sec"

exec 6<&- #ディスクリプタ６番で双方向通信をクローズ


```


規模感つかむ

１万件を超えたら、カレントディレクトリにdump.rdbができる

```
１００件
$ seq -f "key%03g value" 100 >key-value.txt
$ time ./insert-data.sh
100 items in the key-value.txt
101 items inserted in 0 sec

real	0m0.015s
user	0m0.007s
sys	0m0.010s

１０００件
$ seq -f "key%03g value" 1000 >key-value.txt
$ time ./insert-data.sh
1000 items in the key-value.txt
1001 items inserted in 0 sec

real	0m0.038s
user	0m0.020s
sys	0m0.021s

１万件
$ seq -f "key%03g value" 10000 >key-value.txt
$ time ./insert-data.sh
10000 items in the key-value.txt
10001 items inserted in 0 sec

real	0m0.296s
user	0m0.175s
sys	0m0.124s

１０万件
$ seq -f "key%03g value" 100000 >key-value.txt
$ time ./insert-data.sh
100000 items in the key-value.txt
100001 items inserted in 3 sec

real	0m3.422s
user	0m2.128s
sys	0m1.302s

１００万件
$ seq -f "key%03g value" 1000000 >key-value.txt
$ time ./insert-data.sh
1000001 items in the key-value.txt
1000002 items inserted in 30 sec

real	0m30.678s
user	0m18.117s
sys	0m12.637s

１０００万件
$ seq -f "key%03g value" 10000000 >key-value.txt
$ time ./insert-data.sh
10000001 items in the key-value.txt
10000002 items inserted in 335 sec

real	5m34.938s
user	3m18.720s
sys	2m16.973s

１億件（１０分以上かかる）

```

- redisはpostgres拡張でsqlライクに使えるらしい

PostgreSQL の FDW (Foreign Data Wrapper) 異なるデータソースにあるデータを PostgreSQL が読み取り・書き取りするための機能のこと。

- https://qiita.com/e-a-st/items/04f440db42302a590f62

redisのダンプはimportとexportで代用ぽい

- https://qiita.com/rubytomato@github/items/d66d932959d596876ab5


- https://adtech-blog.united.jp/2015/09/kvs/redis%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E9%87%8F%E6%8C%BF%E5%85%A5%E6%89%8B%E6%B3%95/


データ削除はflushall

- https://symfoware.blog.fc2.com/blog-entry-521.html

```
$ redis-cli
127.0.0.1:6379> select 0
OK
127.0.0.1:6379> dbsize
(integer) 0
127.0.0.1:6379> set key1 value1
OK
127.0.0.1:6379> dbsize
(integer) 1
127.0.0.1:6379> set key2 value3
OK
127.0.0.1:6379> dbsize
(integer) 2
127.0.0.1:6379>
127.0.0.1:6379> flushall
OK
(0.76s)
127.0.0.1:6379> dbsize
(integer) 0
127.0.0.1:6379> select 0
OK
127.0.0.1:6379> set key1 value1
OK
127.0.0.1:6379> select 1
OK
127.0.0.1:6379[1]> set key1 value1
OK
127.0.0.1:6379[1]> dbsize
(integer) 1
127.0.0.1:6379[1]> select 0
OK
127.0.0.1:6379> dbsize
(integer) 1
127.0.0.1:6379> flushall
OK
127.0.0.1:6379> dbsize
(integer) 0
127.0.0.1:6379> select 1
OK
127.0.0.1:6379[1]> dbsize
(integer) 0
127.0.0.1:6379[1]>
```

