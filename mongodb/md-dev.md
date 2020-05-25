以降の作業は全て実行者ユーザーはrootのみ

プロセス起動

rootユーザーで実行

```
$mongod --config /etc/mongod.conf 1>$HOME/launch-mongodb.log 2>&1


$ps uax
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14244  1476 pts/0    Ss   22:57   0:00 bash /etc/init/run.sh centos
kuraine      6  0.0  0.0 391508 13604 pts/0    Sl   22:57   0:00 /usr/libexec/mozc/mozc_server
kuraine      7  0.0  0.0  14512  2140 pts/0    S+   22:57   0:00 bash
kuraine   1033  0.0  0.0  14512  2176 pts/1    Ss   23:02   0:00 /bin/bash
root      1079  0.0  0.0  87268  2644 pts/1    S    23:02   0:00 su root
root      1081  0.0  0.0  14512  2244 pts/1    S    23:02   0:00 bash
root      1347  1.8  0.1 1094104 52004 ?       Sl   23:13   0:00 mongod --config /etc/mongod.conf
root      1393  0.0  0.0  54308  1868 pts/1    R+   23:14   0:00 ps uax


$lsof -i:27017
COMMAND  PID USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
mongod  1347 root   11u  IPv4 4029869      0t0  TCP localhost:27017 (LISTEN)
```

一般ユーザーで起動するとフォークできぬ
mongodbユーザで起動とフォークできぬ
```
$cat launch-mongodb.log
about to fork child process, waiting until server is ready for connections.
forked process: 1461
ERROR: child process failed, exited with error number 1
To see additional information in this output, start without the "--fork" option.
```

rootユーザーで起動するとフォークできる
```
$cat launch-mongodb.log
about to fork child process, waiting until server is ready for connections.
forked process: 2187
child process started successfully, parent exiting
```



プロセス終了

```
ps uax | grep mongo | grep -v grep | awk '{print $2}' | xargs kill -9
```



rootユーザーで起動していろいろでるがしょーがいない

```
$mongo
MongoDB shell version v4.0.18
connecting to: mongodb://127.0.0.1:27017/?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("f6f44cdb-4c6a-45c1-ac5c-d719d5d70163") }
MongoDB server version: 4.0.18
Server has startup warnings:
2020-05-24T23:29:00.126+0900 I CONTROL  [initandlisten]
2020-05-24T23:29:00.126+0900 I CONTROL  [initandlisten] ** WARNING: Access control is not enabled for the database.
2020-05-24T23:29:00.126+0900 I CONTROL  [initandlisten] **          Read and write access to data and configuration is unrestricted.
2020-05-24T23:29:00.126+0900 I CONTROL  [initandlisten] ** WARNING: You are running this process as the root user, which is not recommended.
2020-05-24T23:29:00.126+0900 I CONTROL  [initandlisten]
2020-05-24T23:29:00.127+0900 I CONTROL  [initandlisten]
2020-05-24T23:29:00.127+0900 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/enabled is 'always'.
2020-05-24T23:29:00.127+0900 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2020-05-24T23:29:00.127+0900 I CONTROL  [initandlisten]
2020-05-24T23:29:00.127+0900 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/defrag is 'always'.
2020-05-24T23:29:00.127+0900 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2020-05-24T23:29:00.127+0900 I CONTROL  [initandlisten]
---
Enable MongoDB's free cloud-based monitoring service, which will then receive and display
metrics about your deployment (disk utilization, CPU, operation statistics, etc).

The monitoring data will be available on a MongoDB website with a unique URL accessible to you
and anyone you share the URL with. MongoDB may use this information to make product
improvements and to suggest MongoDB products and deployment options to you.

To enable free monitoring, run the following command: db.enableFreeMonitoring()
To permanently disable this reminder, run the following command: db.disableFreeMonitoring()
---

>
>
>
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB
> use testdb
switched to db testdb
>
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB
>
> db.testcoll.insert({"key1":"value1","key2":"value2"})
WriteResult({ "nInserted" : 1 })
> db.testcoll.insert( { "array" : [ "Windows", "Mac" , "Linux" ] } )
WriteResult({ "nInserted" : 1 })
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB
testdb  0.000GB
> db.testcoll.find()
{ "_id" : ObjectId("5eca852f441488146b36e44f"), "key1" : "value1", "key2" : "value2" }
{ "_id" : ObjectId("5eca853b441488146b36e450"), "array" : [ "Windows", "Mac", "Linux" ] }
> db.testcoll.findOne()
{
	"_id" : ObjectId("5eca852f441488146b36e44f"),
	"key1" : "value1",
	"key2" : "value2"
}
> db.testcoll.findOne()["key1"]
value1
> show collections
testcoll
```

ダンプ

```
$mongodump
2020-05-24T23:34:21.547+0900	writing admin.system.version to
2020-05-24T23:34:21.547+0900	done dumping admin.system.version (1 document)
2020-05-24T23:34:21.547+0900	writing testdb.testcoll to
2020-05-24T23:34:21.548+0900	done dumping testdb.testcoll (2 documents)

ダンプ実行カレントディレクトリにdumpディレクトリができる

$tree dump/
dump/
|-- admin
|   |-- system.version.bson
|   `-- system.version.metadata.json
`-- testdb
    |-- testcoll.bson
    `-- testcoll.metadata.json

2 directories, 4 files
```

データベースからテーブル削除

```
$mongo testdb --eval 'db.testcoll.drop();'
MongoDB shell version v4.0.18
connecting to: mongodb://127.0.0.1:27017/testdb?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("9ebe791e-fbd1-47d7-81ab-07b16a44c01c") }
MongoDB server version: 4.0.18
true
```

データベースを削除

```
$mongo testdb --eval 'db.dropDatabase();'
MongoDB shell version v4.0.18
connecting to: mongodb://127.0.0.1:27017/testdb?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("b7eeacbc-c119-454c-81ff-29d4fcd51017") }
MongoDB server version: 4.0.18
{ "dropped" : "testdb", "ok" : 1 }
```


削除確認

```
$mongo testdb --quiet --eval 'db.testcoll.find();'
```

リストア

```
$mongorestore dump/
2020-05-24T23:40:11.098+0900	preparing collections to restore from
2020-05-24T23:40:11.099+0900	reading metadata for testdb.testcoll from dump/testdb/testcoll.metadata.json
2020-05-24T23:40:11.130+0900	restoring testdb.testcoll from dump/testdb/testcoll.bson
2020-05-24T23:40:11.131+0900	no indexes to restore
2020-05-24T23:40:11.131+0900	finished restoring testdb.testcoll (2 documents)
2020-05-24T23:40:11.131+0900	done
```

リストアされたことを確認

```
$mongo testdb --quiet --eval 'db.testcoll.find();'
{ "_id" : ObjectId("5eca852f441488146b36e44f"), "key1" : "value1", "key2" : "value2" }
{ "_id" : ObjectId("5eca853b441488146b36e450"), "array" : [ "Windows", "Mac", "Linux" ] }
```

認証

管理者ユーザーの作成

スクリプト形式でもいける

```
$cat create-user-admin.js

//管理者用のユーザー
//一般ユーザーに対するデータベースへの権限管理を行うことができる
db.dropUser("admin")
db.createUser(
    {
      user: "admin",
      pwd: "admin_pwd",
      roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
    }
  )

$mongo admin create-user-admin.js
MongoDB shell version v4.0.18
connecting to: mongodb://127.0.0.1:27017/admin?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("266588cd-6779-4e0f-8b66-1be1b5d96e6f") }
MongoDB server version: 4.0.18
Successfully added user: {
	"user" : "admin",
	"roles" : [
		{
			"role" : "userAdminAnyDatabase",
			"db" : "admin"
		}
	]
}
```

一般ユーザーの作成

```
$cat create-user-non-admin.js
//管理者用のユーザー
//一般ユーザーに対するデータベースへの権限管理を行うことができる
db.dropUser("user01")
//一般ユーザー
db.createUser(
    {
      user: "user01",
      pwd: "user01_pwd",
      roles: [ { role: "readWrite", db: "testdb" } ]
    }
  )
$mongo testdb create-user-non-admin.js
MongoDB shell version v4.0.18
connecting to: mongodb://127.0.0.1:27017/testdb?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("b83f3523-46a6-4f34-b1ee-5a78f98441ca") }
MongoDB server version: 4.0.18
Successfully added user: {
	"user" : "user01",
	"roles" : [
		{
			"role" : "readWrite",
			"db" : "testdb"
		}
	]
}

```

プロセス停止

```
$ps uax | grep mongo | grep -v grep | awk '{print $2}' | xargs kill -9
```

設定ファイル編集

以下の部分を追加
```
security:
  authorization: enabled
```

追加後

```
$cat /etc/mongod.conf
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# Where and how to store data.
storage:
  dbPath: /var/lib/mongo
  journal:
    enabled: true
#  engine:
#  mmapv1:
#  wiredTiger:

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1  # Enter 0.0.0.0,:: to bind to all IPv4 and IPv6 addresses or, alternatively, use the net.bindIpAll setting.


security:
  authorization: enabled

#operationProfiling:

#replication:

#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:

```

プロセス起動

```
$mongod --config /etc/mongod.conf 1>$HOME/launch-mongodb.log 2>&1
```


認証確認

```
$mongo testdb -u user01 -p
MongoDB shell version v4.0.18
Enter password:
connecting to: mongodb://127.0.0.1:27017/testdb?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("61c9201b-714a-4da7-8295-af0c620f58b5") }
MongoDB server version: 4.0.18
>
> show dbs;
testdb  0.000GB
```

non-admin

```
$mongo testdb -u user01 -p user01_pwd --quiet --eval 'db.testcoll.find();'
{ "_id" : ObjectId("5eca852f441488146b36e44f"), "key1" : "value1", "key2" : "value2" }
{ "_id" : ObjectId("5eca853b441488146b36e450"), "array" : [ "Windows", "Mac", "Linux" ] }
```

admin

```
$mongo --authenticationDatabase admin -u admin -p admin_pwd --quiet --eval 'db.system.users.find();'

$mongo --authenticationDatabase admin -u admin -p
MongoDB shell version v4.0.18
Enter password:
connecting to: mongodb://127.0.0.1:27017/?authSource=admin&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("cd8f3932-5e05-40d6-9112-84e314996df3") }
MongoDB server version: 4.0.18
>
```

admin

```
$mongo
MongoDB shell version v4.0.18
connecting to: mongodb://127.0.0.1:27017/?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("123c17d6-5cda-45b4-a04c-8b9cf8b08dac") }
MongoDB server version: 4.0.18
> use admin
switched to db admin
> db.system.users.find()
Error: error: {
	"ok" : 0,
	"errmsg" : "command find requires authentication",
	"code" : 13,
	"codeName" : "Unauthorized"
}
> db.auth("admin","admin_pwd")
1
> db.system.users.find()
{ "_id" : "admin.admin", "userId" : UUID("8180b833-9bda-4685-b066-1c0080e1a14d"), "user" : "admin", "db" : "admin", "credentials" : { "SCRAM-SHA-1" : { "iterationCount" : 10000, "salt" : "Fj496oL4aHdOZQAZAT1JxQ==", "storedKey" : "2c5jOQW/4Ih74cDESKWtO68xItQ=", "serverKey" : "edQfaIuNlWSiz+S2SVje+8M5qCc=" }, "SCRAM-SHA-256" : { "iterationCount" : 15000, "salt" : "SkAFa4fDcO5Z6AH37TjPVjRhnWN8TCWn5mHYTQ==", "storedKey" : "YtQ0Cfy+iE5w14iWGK+myaN8D+mCFWwXtNm6eYFa2ss=", "serverKey" : "33GE02k7a1AFb8em96V9QUhoDunGLeBIbAI5KCiPYEs=" } }, "roles" : [ { "role" : "userAdminAnyDatabase", "db" : "admin" } ] }
{ "_id" : "testdb.user01", "userId" : UUID("91ecd6f1-6392-4739-b7b6-f50f98dd7dc1"), "user" : "user01", "db" : "testdb", "credentials" : { "SCRAM-SHA-1" : { "iterationCount" : 10000, "salt" : "x4xKK/BJozZVf/yA0RanoA==", "storedKey" : "bLfJZq8wTvGJZHCTgDbdKo5TV2U=", "serverKey" : "GZ6w+/6F66ooYXSF5HQobS+Omd0=" }, "SCRAM-SHA-256" : { "iterationCount" : 15000, "salt" : "aomXUctpfBIsMG0AwwB2Kl7OBzCyosp4GsaT8Q==", "storedKey" : "cu42b33paC5nBgbtXdo1ifO6lBZMxQRGAKV84UZ4j2I=", "serverKey" : "aMAusY+zU37FzTQPaxu3EhfQ/bUvEFBOWWuW3T1dFbA=" } }, "roles" : [ { "role" : "readWrite", "db" : "testdb" } ] }

```


- InteliJだとみやすいらしい

  - https://qiita.com/akinko/items/b11a6e19b3b3dd8da119



mongodbのデータベースファイルを削除した場合


```
rm -rf  /var/lib/mongo

mkdir -p /var/lib/mongo


chown -R mongod:mongod /var/lib/mongo
```

dumpファイルから復旧

```
$ls -l create-user-*
-rw-r--r--. 1 root root 286  5月 25 01:47 create-user-admin.js
-rw-r--r--. 1 root root 300  5月 25 01:47 create-user-non-admin.js

$ls -l dump/
total 8
drwxr-xr-x. 2 root root 4096  5月 24 23:34 admin
drwxr-xr-x. 2 root root 4096  5月 24 23:34 testdb

$tree -ug dump/
dump/
|-- [root     root    ]  admin
|   |-- [root     root    ]  system.version.bson
|   `-- [root     root    ]  system.version.metadata.json
`-- [root     root    ]  testdb
    |-- [root     root    ]  testcoll.bson
    `-- [root     root    ]  testcoll.metadata.json

2 directories, 4 files

```

プロセス起動(認証無効にしてから)

```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14244  1476 pts/0    Ss    5月24   0:00 bash /etc/init/run.sh centos
kuraine      6  0.0  0.0 391508 13604 pts/0    Sl    5月24   0:00 /usr/libexec/mozc/mozc_server
kuraine      7  0.0  0.0  14512  2140 pts/0    S+    5月24   0:00 bash
kuraine   3086  0.0  0.0  14512  2172 pts/1    Ss    5月24   0:00 /bin/bash
root      3129  0.0  0.0  87268  2640 pts/1    S     5月24   0:00 su root
root      3131  0.0  0.0  14512  2280 pts/1    S     5月24   0:02 bash
root      4437 10.2  0.1 1094104 51516 ?       Sl   01:50   0:00 mongod --config /etc/mongod.conf
root      4474  0.0  0.0  54308  1868 pts/1    R+   01:50   0:00 ps aux


$lsof -i:27017
COMMAND  PID USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
mongod  4437 root   11u  IPv4 4621691      0t0  TCP localhost:27017 (LISTEN)
```

ユーザー登録

```
$mongo testdb create-user-non-admin.js
MongoDB shell version v4.0.18
connecting to: mongodb://127.0.0.1:27017/testdb?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("6050d9ab-c811-4e78-b445-a9719483ab8c") }
MongoDB server version: 4.0.18
Successfully added user: {
	"user" : "user01",
	"roles" : [
		{
			"role" : "readWrite",
			"db" : "testdb"
		}
	]
}


$mongo admin create-user-admin.js
MongoDB shell version v4.0.18
connecting to: mongodb://127.0.0.1:27017/admin?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("3e0e43a9-bdbc-415c-97a8-d084f4dd892d") }
MongoDB server version: 4.0.18
Successfully added user: {
	"user" : "admin",
	"roles" : [
		{
			"role" : "userAdminAnyDatabase",
			"db" : "admin"
		}
	]
}
```

リストア

```
$mongorestore dump/
2020-05-25T01:53:22.532+0900	preparing collections to restore from
2020-05-25T01:53:22.533+0900	reading metadata for testdb.testcoll from dump/testdb/testcoll.metadata.json
2020-05-25T01:53:22.568+0900	restoring testdb.testcoll from dump/testdb/testcoll.bson
2020-05-25T01:53:22.569+0900	no indexes to restore
2020-05-25T01:53:22.569+0900	finished restoring testdb.testcoll (2 documents)
2020-05-25T01:53:22.569+0900	done

```

認証有効化

プロセス停止し起動


```
$ps uax | grep mongo | grep -v grep | awk '{print $2}' | xargs kill -9
$mongod --config /etc/mongod.conf 1>$HOME/launch-mongodb.log 2>&1
```

認証確認

admin

```
$mongo
MongoDB shell version v4.0.18
connecting to: mongodb://127.0.0.1:27017/?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("858ff066-d817-48be-8d66-da47aefbeeb8") }
MongoDB server version: 4.0.18
> use admin
switched to db admin
> db.system.users.find()
Error: error: {
	"ok" : 0,
	"errmsg" : "command find requires authentication",
	"code" : 13,
	"codeName" : "Unauthorized"
}
> db.auth("admin","admin_pwd")
1
> db.system.users.find()
{ "_id" : "testdb.user01", "userId" : UUID("a7c61353-5e9d-425a-b9eb-b9a3c8505b94"), "user" : "user01", "db" : "testdb", "credentials" : { "SCRAM-SHA-1" : { "iterationCount" : 10000, "salt" : "NY2JpmC9WDO4lw6hrgBxfw==", "storedKey" : "EkH3nJ2IiaW1A3KhQkMnkr+dXVs=", "serverKey" : "03tBocokUKiJ7tRGJAqrIJEtNB0=" }, "SCRAM-SHA-256" : { "iterationCount" : 15000, "salt" : "8iAILTNKRlps7JqmRAvWbH1bF524UwMCLZ+FEA==", "storedKey" : "C/OTq7mZ0puvTS9cwEe7ZpGemhFeU1SP1esQPLQmZPo=", "serverKey" : "hiU3CcZlgUXTNaWz71n7IEjrfiqcd2dJwpqBZmglP5Y=" } }, "roles" : [ { "role" : "readWrite", "db" : "testdb" } ] }
{ "_id" : "admin.admin", "userId" : UUID("2f856d2a-8b3f-4247-ada5-be56e3ed3443"), "user" : "admin", "db" : "admin", "credentials" : { "SCRAM-SHA-1" : { "iterationCount" : 10000, "salt" : "dpQqI3l7o7K1+lCLTUb5rA==", "storedKey" : "wb12LqNY5hssbevixIrS24OJrYY=", "serverKey" : "sVSx2DbqL/sOh3i7PL1J00s8bo0=" }, "SCRAM-SHA-256" : { "iterationCount" : 15000, "salt" : "6Ynra3RPlwFQ1DkMt8flEXl3jrloudqtMvVUSA==", "storedKey" : "45Mh9nEyWRTD58Ekcj0sR1JRpCaDMmZ990Ib6lavk1o=", "serverKey" : "9gRqB3LFVAxvFrYlWDdRmJbxlJ6OK5ZtHx/9fVUjI9c=" } }, "roles" : [ { "role" : "userAdminAnyDatabase", "db" : "admin" } ] }
>
bye

```

non-admin

```
$mongo testdb -u user01 -p
MongoDB shell version v4.0.18
Enter password:
connecting to: mongodb://127.0.0.1:27017/testdb?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("945726f1-09a3-43a4-9131-dd47b70181c1") }
MongoDB server version: 4.0.18
> show dbs;
testdb  0.000GB
> db.testcoll.findOne()
{
	"_id" : ObjectId("5eca852f441488146b36e44f"),
	"key1" : "value1",
	"key2" : "value2"
}
> db.testcoll.find()
{ "_id" : ObjectId("5eca852f441488146b36e44f"), "key1" : "value1", "key2" : "value2" }
{ "_id" : ObjectId("5eca853b441488146b36e450"), "array" : [ "Windows", "Mac", "Linux" ] }


doc-centos-7-6-18-10-vim (root)  01:57:54  ~   mongo testdb -u user01 -p user01_pwd --quiet --eval 'db.testcoll.find();'
{ "_id" : ObjectId("5eca852f441488146b36e44f"), "key1" : "value1", "key2" : "value2" }
{ "_id" : ObjectId("5eca853b441488146b36e450"), "array" : [ "Windows", "Mac", "Linux" ] }


```
