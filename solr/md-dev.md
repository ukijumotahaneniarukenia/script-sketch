実行ユーザーはsolr

-p 8983:8983

環境変数の設定

```
*** [WARN] ***  Your Max Processes Limit is currently 4096.
 It should be set to 65000 to avoid operational disruption.
 If you no longer wish to see this warning, set SOLR_ULIMIT_CHECKS to false in your profile or solr.in.sh


$ grep -n SOLR_ULIMIT_CHECKS /usr/local/src/solr-8.5.1/bin/solr.in.sh
202:# SOLR_ULIMIT_CHECKS=false either here or as part of your profile.
207:#SOLR_ULIMIT_CHECKS=


$ grep -n SOLR_ULIMIT_CHECKS /usr/local/src/solr-8.5.1/bin/solr.in.sh
202:# SOLR_ULIMIT_CHECKS=false either here or as part of your profile.
207:SOLR_ULIMIT_CHECKS=65000
```



パスの設定


```
echo 'export APACHE_SOLR_HOME=/usr/local/src/solr-8.5.1'>>$HOME/.bashrc
echo 'export PATH=$APACHE_SOLR_HOME/bin:$PATH'>>$HOME/.bashrc
source $HOME/.bashrc
```

実行ユーザーはroot

```
$ ls -l | grep solr
drwxr-xr-x.  9 root root      4096  5月 11 13:21 solr-8.5.1
-rw-r--r--.  1 root root 190483244  5月 11 13:21 solr-8.5.1.tgz
$ chown -R solr:solr solr-8.5.1*
$ ls -l | grep solr
drwxr-xr-x.  9 solr solr      4096  5月 11 13:21 solr-8.5.1
-rw-r--r--.  1 solr solr 190483244  5月 11 13:21 solr-8.5.1.tgz
```

以降実行ユーザーはsolr

solrユーザー以外で作業するとエラーとなる

```
WARNING: Using _default configset with data driven schema functionality. NOT RECOMMENDED for production use.
         To turn off: bin/solr config -c mywiki-big-reshape -p 8983 -action set-user-property -property update.autoCreateFields -value false

ERROR: Failed to create new core instance directory: /usr/local/src/solr-8.5.1/server/solr/mywiki-big-reshape
```

作業スペース作成

```
mkdir -p wrksp

cd wrksp

```


テストデータ準備

```
$ cat in-small-data/test.xml
<?xml version="1.0" encoding="UTF-8"?>
<items>
  <item id="123">
    <name>Andy</name>
    <age>21</age>
  </item>
  <item id="234">
    <name>Brian</name>
    <age>23</age>
  </item>
  <item id="345">
    <name>Charles</name>
    <age>19</age>
  </item>
</items>
$ cat in-small-data/test.json | jq
{
  "items": {
    "item": [
      {
        "name": "Andy",
        "age": "21",
        "id": "123"
      },
      {
        "name": "Brian",
        "age": "23",
        "id": "234"
      },
      {
        "name": "Charles",
        "age": "19",
        "id": "345"
      }
    ]
  }
}
```



```
$ls
test-big.json  test-big.xml  test.json  test.xml

$mkdir -p in-small-data

$mkdir -p in-big-data

$mv test-big* in-big-data

$mv mv test* in-small-data/

$ tree -ug
.
`-- [solr     solr    ]  wrksp
    |-- [solr     solr    ]  in-big-data
    |   |-- [solr     solr    ]  test-big.json
    |   `-- [solr     solr    ]  test-big.xml
    `-- [solr     solr    ]  in-small-data
        |-- [solr     solr    ]  test.json
        `-- [solr     solr    ]  test.xml

3 directories, 4 files

$ tree -X -ug
<?xml version="1.0"?>
<tree>
  <directory name=".">
    <directory name="wrksp" user="solr" group="solr">
      <directory name="in-big-data" user="solr" group="solr">
        <file name="test-big.json" user="solr" group="solr"></file>
        <file name="test-big.xml" user="solr" group="solr"></file>
      </directory>
      <directory name="in-small-data" user="solr" group="solr">
        <file name="test.json" user="solr" group="solr"></file>
        <file name="test.xml" user="solr" group="solr"></file>
      </directory>
    </directory>
  </directory>
  <report>
    <directories>3</directories>
    <files>4</files>
  </report>
</tree>


```

SOLRプロセス起動

```
$ solr start -p 8983
*** [WARN] ***  Your Max Processes Limit is currently 4096.
 It should be set to 65000 to avoid operational disruption.
 If you no longer wish to see this warning, set SOLR_ULIMIT_CHECKS to false in your profile or solr.in.sh
Waiting up to 180 seconds to see Solr running on port 8983 [/]
Started Solr server on port 8983 (pid=13413). Happy searching!

```


プロセス確認

```
$ ps uax | tee 1>/dev/null >(head -n+1) >(grep solr)
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root     13350  0.0  0.0  87268  2632 pts/1    S    14:32   0:00 su solr
solr     13352  0.0  0.0  14380  2068 pts/1    S    14:32   0:00 bash
solr     13413  4.1  0.7 5438456 237568 pts/1  Sl   14:32   0:06 /usr/local/src/jdk-11/bin/java -server -Xms512m -Xmx512m -XX:+UseG1GC -XX:+PerfDisableSharedMem -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=250 -XX:+UseLargePages -XX:+AlwaysPreTouch -Xlog:gc*:file=/usr/local/src/solr-8.5.1/server/logs/solr_gc.log:time,uptime:filecount=9,filesize=20M -Dsolr.jetty.inetaccess.includes= -Dsolr.jetty.inetaccess.excludes= -Dsolr.log.dir=/usr/local/src/solr-8.5.1/server/logs -Djetty.port=8983 -DSTOP.PORT=7983 -DSTOP.KEY=solrrocks -Duser.timezone=UTC -Djetty.home=/usr/local/src/solr-8.5.1/server -Dsolr.solr.home=/usr/local/src/solr-8.5.1/server/solr -Dsolr.data.home= -Dsolr.install.dir=/usr/local/src/solr-8.5.1 -Dsolr.default.confdir=/usr/local/src/solr-8.5.1/server/solr/configsets/_default/conf -Xss256k -Dsolr.jetty.https.port=8983 -Dsolr.log.muteconsole -XX:OnOutOfMemoryError=/usr/local/src/solr-8.5.1/bin/oom_solr.sh 8983 /usr/local/src/solr-8.5.1/server/logs -jar start.jar --module=http
solr     13542  0.0  0.0  54308  1868 pts/1    R+   14:35   0:00 ps uax
solr     13543  0.0  0.0   6888   668 pts/1    S+   14:35   0:00 tee /dev/fd/63 /dev/fd/62
solr     13544  0.0  0.0  14380   796 pts/1    S+   14:35   0:00 bash
solr     13545  0.0  0.0  14380   796 pts/1    S+   14:35   0:00 bash
solr     13546  0.0  0.0   6896   676 pts/1    S+   14:35   0:00 head -n+1
solr     13547  0.0  0.0  11644   976 pts/1    S+   14:35   0:00 grep --color=auto solr
```

マイ コア作成

```
$solr create -c mywiki-small -s 2 -rf 2
```

以下が標準出力に出力される

```
WARNING: Using _default configset with data driven schema functionality. NOT RECOMMENDED for production use.
         To turn off: bin/solr config -c mywiki-small -p 8983 -action set-user-property -property update.autoCreateFields -value false

Created new core 'mywiki-small'
```

データ投入

```
$post -c mywiki-small $HOME/wrksp/in-small-data
```

以下が標準出力に出力される

```
/usr/local/src/jdk-11/bin/java -classpath /usr/local/src/solr-8.5.1/dist/solr-core-8.5.1.jar -Dauto=yes -Dc=mywiki-small -Ddata=files -Drecursive=yes org.apache.solr.util.SimplePostTool /home/solr/wrksp/in-small-data
SimplePostTool version 5.0.0
Posting files to [base] url http://localhost:8983/solr/mywiki-small/update...
Entering auto mode. File endings considered are xml,json,jsonl,csv,pdf,doc,docx,ppt,pptx,xls,xlsx,odt,odp,ods,ott,otp,ots,rtf,htm,html,txt,log
Entering recursive mode, max depth=999, delay=0s
Indexing directory /home/solr/wrksp/in-small-data (2 files, depth=0)
POSTing file test.xml (application/xml) to [base]
POSTing file test.json (application/json) to [base]/json/docs
2 files indexed.
COMMITting Solr index changes to http://localhost:8983/solr/mywiki-small/update...
Time spent: 0:00:00.299
```


検索


```
$curl -s 'http://localhost:8983/solr/mywiki-small/select?q=*%3A*&rows=3&start=0'
```


以下が標準出力に出力される

```
$ curl -s 'http://localhost:8983/solr/mywiki-small/select?q=*%3A*&rows=3&start=0'
{
  "responseHeader":{
    "status":0,
    "QTime":21,
    "params":{
      "q":"*:*",
      "start":"0",
      "rows":"3"}},
  "response":{"numFound":1,"start":0,"docs":[
      {
        "items.item.name":["Andy",
          "Brian",
          "Charles"],
        "items.item.age":[21,
          23,
          19],
        "items.item.id":[123,
          234,
          345],
        "id":"d301336d-b56a-4b80-87ce-c3a3a0f9ddb8",
        "_version_":1666371512576245760}]
  }}
```


レコードの組が誤って認識されているので、正しく取り込めるように整形しないといけぬ

サンプルデータにある正しい形式

```
$cat films.json | jq '.[:3]'
[
  {
    "id": "/en/45_2006",
    "directed_by": [
      "Gary Lennon"
    ],
    "initial_release_date": "2006-11-30",
    "genre": [
      "Black comedy",
      "Thriller",
      "Psychological thriller",
      "Indie film",
      "Action Film",
      "Crime Thriller",
      "Crime Fiction",
      "Drama"
    ],
    "name": ".45"
  },
  {
    "id": "/en/9_2005",
    "directed_by": [
      "Shane Acker"
    ],
    "initial_release_date": "2005-04-21",
    "genre": [
      "Computer Animation",
      "Animation",
      "Apocalyptic and post-apocalyptic fiction",
      "Science Fiction",
      "Short Film",
      "Thriller",
      "Fantasy"
    ],
    "name": "9"
  },
  {
    "id": "/en/69_2004",
    "directed_by": [
      "Lee Sang-il"
    ],
    "initial_release_date": "2004-07-10",
    "genre": [
      "Japanese Movies",
      "Drama"
    ],
    "name": "69"
  }
]
```

整形後

```
cat test.json | jq '.items.item' >test-reshape.json

```

確認

```
$ cat test-reshape.json | jq
[
  {
    "name": "Andy",
    "age": "21",
    "id": "123"
  },
  {
    "name": "Brian",
    "age": "23",
    "id": "234"
  },
  {
    "name": "Charles",
    "age": "19",
    "id": "345"
  }
]
```


```
$ mkdir -p in-small-data-reshape


$ mv in-small-data/test-reshape.json in-small-data-reshape/


$ tree -ug in-small-data-reshape/
in-small-data-reshape/
`-- [solr     solr    ]  test-reshape.json

0 directories, 1 file

```

reshape用にコア作成


```
$ solr create -c mywiki-small-reshape -s 2 -rf 2
WARNING: Using _default configset with data driven schema functionality. NOT RECOMMENDED for production use.
         To turn off: bin/solr config -c mywiki-small-reshape -p 8983 -action set-user-property -property update.autoCreateFields -value false

Created new core 'mywiki-small-reshape'

```


データ投入


```
$ post -c mywiki-small-reshape $HOME/wrksp/in-small-data-reshape
/usr/local/src/jdk-11/bin/java -classpath /usr/local/src/solr-8.5.1/dist/solr-core-8.5.1.jar -Dauto=yes -Dc=mywiki-small-reshape -Ddata=files -Drecursive=yes org.apache.solr.util.SimplePostTool /home/solr/wrksp/in-small-data-reshape
SimplePostTool version 5.0.0
Posting files to [base] url http://localhost:8983/solr/mywiki-small-reshape/update...
Entering auto mode. File endings considered are xml,json,jsonl,csv,pdf,doc,docx,ppt,pptx,xls,xlsx,odt,odp,ods,ott,otp,ots,rtf,htm,html,txt,log
Entering recursive mode, max depth=999, delay=0s
Indexing directory /home/solr/wrksp/in-small-data-reshape (1 files, depth=0)
POSTing file test-reshape.json (application/json) to [base]/json/docs
1 files indexed.
COMMITting Solr index changes to http://localhost:8983/solr/mywiki-small-reshape/update...
Time spent: 0:00:00.131
```


うまく投入できた


```
$ curl -s 'http://localhost:8983/solr/mywiki-small-reshape/select?q=*%3A*&rows=3&start=0'
{
  "responseHeader":{
    "status":0,
    "QTime":0,
    "params":{
      "q":"*:*",
      "start":"0",
      "rows":"3"}},
  "response":{"numFound":3,"start":0,"docs":[
      {
        "name":["Andy"],
        "age":[21],
        "id":"123",
        "_version_":1666373946196361216},
      {
        "name":["Brian"],
        "age":[23],
        "id":"234",
        "_version_":1666373946198458368},
      {
        "name":["Charles"],
        "age":[19],
        "id":"345",
        "_version_":1666373946199506944}]
  }}
```

検索する


```
$ curl -s 'http://localhost:8983/solr/mywiki-small-reshape/select?q=name%3AAndy'
{
  "responseHeader":{
    "status":0,
    "QTime":6,
    "params":{
      "q":"name:Andy"}},
  "response":{"numFound":1,"start":0,"docs":[
      {
        "name":["Andy"],
        "age":[21],
        "id":"123",
        "_version_":1666373946196361216}]
  }}
$ curl -s 'http://localhost:8983/solr/mywiki-small-reshape/select?q=name%3ABrain'
{
  "responseHeader":{
    "status":0,
    "QTime":0,
    "params":{
      "q":"name:Brain"}},
  "response":{"numFound":0,"start":0,"docs":[]
  }}
$ curl -s 'http://localhost:8983/solr/mywiki-small-reshape/select?q=name%3ABrian'
{
  "responseHeader":{
    "status":0,
    "QTime":0,
    "params":{
      "q":"name:Brian"}},
  "response":{"numFound":1,"start":0,"docs":[
      {
        "name":["Brian"],
        "age":[23],
        "id":"234",
        "_version_":1666373946198458368}]
  }}
$ curl -s 'http://localhost:8983/solr/mywiki-small-reshape/select?q=age%3A21'
{
  "responseHeader":{
    "status":0,
    "QTime":5,
    "params":{
      "q":"age:21"}},
  "response":{"numFound":1,"start":0,"docs":[
      {
        "name":["Andy"],
        "age":[21],
        "id":"123",
        "_version_":1666373946196361216}]
  }}
```


ビッグデータ系も同じようにreshapeして投入


```
$ cat test-big.json | jq '.playlist.movie' >test-big-reshape.json
```



```
$ mkdir -p in-big-data-reshape
$ mv in-big-data/test-big-reshape.json in-big-data-reshape/
$ tree -ug in-big-data-reshape/
in-big-data-reshape/
`-- [solr     solr    ]  test-big-reshape.json

0 directories, 1 file
```

reshape用にコア作成


```
$solr create -c mywiki-big-reshape -s 2 -rf 2
WARNING: Using _default configset with data driven schema functionality. NOT RECOMMENDED for production use.
         To turn off: bin/solr config -c mywiki-big-reshape -p 8983 -action set-user-property -property update.autoCreateFields -value false

Created new core 'mywiki-big-reshape'
```


データ投入


```
$ post -c mywiki-big-reshape $HOME/wrksp/in-big-data-reshape
/usr/local/src/jdk-11/bin/java -classpath /usr/local/src/solr-8.5.1/dist/solr-core-8.5.1.jar -Dauto=yes -Dc=mywiki-big-reshape -Ddata=files -Drecursive=yes org.apache.solr.util.SimplePostTool /home/solr/wrksp/in-big-data-reshape
SimplePostTool version 5.0.0
Posting files to [base] url http://localhost:8983/solr/mywiki-big-reshape/update...
Entering auto mode. File endings considered are xml,json,jsonl,csv,pdf,doc,docx,ppt,pptx,xls,xlsx,odt,odp,ods,ott,otp,ots,rtf,htm,html,txt,log
Entering recursive mode, max depth=999, delay=0s
Indexing directory /home/solr/wrksp/in-big-data-reshape (1 files, depth=0)
POSTing file test-big-reshape.json (application/json) to [base]/json/docs
1 files indexed.
COMMITting Solr index changes to http://localhost:8983/solr/mywiki-big-reshape/update...
Time spent: 0:00:00.183
```

うまく投入できた


```
$ curl -s 'http://localhost:8983/solr/mywiki-small-reshape/select?q=*%3A*&rows=3&start=0'
```


```
$ curl -s 'http://localhost:8983/solr/mywiki-big-reshape/select?q=*%3A*&rows=3&start=0'
{
  "responseHeader":{
    "status":0,
    "QTime":0,
    "params":{
      "q":"*:*",
      "start":"0",
      "rows":"3"}},
  "response":{"numFound":5,"start":0,"docs":[
      {
        "title":["Apollo 13"],
        "director":["Ron Howard"],
        "release_date":["1995-06-30T00:00:00Z"],
        "mpaa_rating":["PG"],
        "running_time":[140],
        "genre":["adventure",
          "drama"],
        "cast.person.name":["Tom Hanks",
          "Bill Paxton",
          "Kevin Bacon",
          "Gary Sinise",
          "Ed Harris"],
        "cast.person.role":["Jim Lovell",
          "Fred Haise",
          "Jack Swigert",
          "Ken Mattingly",
          "Gene Kranz"],
        "imdb_info.synopsis":["\n        NASA must devise a strategy to return Apollo 13 to Earth safely\n        after the spacecraft undergoes massive internal damage putting\n        the lives of the three astronauts on board in jeopardy.\n      "],
        "imdb_info.score":[7.6],
        "imdb_info.url":["http://www.imdb.com/title/tt0112384/"],
        "id":"tt0112384",
        "_version_":1666374796418482176},
      {
        "title":["Solaris"],
        "director":["Steven Soderbergh"],
        "release_date":["2002-11-27T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[99],
        "genre":["drama",
          "mystery",
          "romance"],
        "cast.person.name":["George Clooney",
          "Natascha McElhone",
          "Ulrich Tukur"],
        "cast.person.role":["Chris Kelvin",
          "Rheya",
          "Gibarian"],
        "imdb_info.synopsis":["\n        A troubled psychologist is sent to investigate the crew of an\n        isolated research station orbiting a bizarre planet.\n      "],
        "imdb_info.score":[6.2],
        "imdb_info.url":["http://www.imdb.com/title/tt0307479/"],
        "id":"tt0307479",
        "_version_":1666374796422676480},
      {
        "title":["Ender's Game"],
        "director":["Gavin Hood"],
        "release_date":["2013-11-01T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[114],
        "genre":["action",
          "scifi"],
        "cast.person.name":["Asa Butterfield",
          "Harrison Ford",
          "Hailee Steinfeld"],
        "cast.person.role":["Ender Wiggin",
          "Colonel Graff",
          "Petra Arkanian"],
        "imdb_info.synopsis":["\n        Young Ender Wiggin is recruited by the International Military\n        to lead the fight against the Formics, a genocidal alien race\n        which nearly annihilated the human race in a previous invasion.\n      "],
        "imdb_info.score":[6.7],
        "imdb_info.url":["http://www.imdb.com/title/tt1731141/"],
        "id":"tt1731141",
        "_version_":1666374796423725056}]
  }}
```


ジャンルがアドベンチャー

```
$ curl -s 'http://localhost:8983/solr/mywiki-big-reshape/select?q=genre:adventure'
{
  "responseHeader":{
    "status":0,
    "QTime":0,
    "params":{
      "q":"genre:adventure"}},
  "response":{"numFound":3,"start":0,"docs":[
      {
        "title":["Apollo 13"],
        "director":["Ron Howard"],
        "release_date":["1995-06-30T00:00:00Z"],
        "mpaa_rating":["PG"],
        "running_time":[140],
        "genre":["adventure",
          "drama"],
        "cast.person.name":["Tom Hanks",
          "Bill Paxton",
          "Kevin Bacon",
          "Gary Sinise",
          "Ed Harris"],
        "cast.person.role":["Jim Lovell",
          "Fred Haise",
          "Jack Swigert",
          "Ken Mattingly",
          "Gene Kranz"],
        "imdb_info.synopsis":["\n        NASA must devise a strategy to return Apollo 13 to Earth safely\n        after the spacecraft undergoes massive internal damage putting\n        the lives of the three astronauts on board in jeopardy.\n      "],
        "imdb_info.score":[7.6],
        "imdb_info.url":["http://www.imdb.com/title/tt0112384/"],
        "id":"tt0112384",
        "_version_":1666374796418482176},
      {
        "title":["Interstellar"],
        "director":["Christopher Nolan"],
        "release_date":["2014-11-07T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[169],
        "genre":["adventure",
          "drama",
          "scifi"],
        "cast.person.name":["Matthew McConaughey",
          "Anne Hathaway",
          "Jessica Chastain",
          "Michael Caine"],
        "cast.person.role":["Cooper",
          "Brand",
          "Murph",
          "Professor Brand"],
        "imdb_info.synopsis":["\n        A team of explorers travel through a wormhole in space in an\n        attempt to ensure humanity's survival.\n      "],
        "imdb_info.score":[8.6],
        "imdb_info.url":["http://www.imdb.com/title/tt0816692/"],
        "id":"tt0816692",
        "_version_":1666374796424773632},
      {
        "title":["The Martian"],
        "director":["Ridley Scott"],
        "release_date":["2015-10-02T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[144],
        "genre":["adventure",
          "drama",
          "scifi"],
        "cast.person.name":["Matt Damon",
          "Jessica Chastain",
          "Kristen Wiig"],
        "cast.person.role":["Mark Watney",
          "Melissa Lewis",
          "Annie Montrose"],
        "imdb_info.synopsis":["\n        During a manned mission to Mars, Astronaut Mark Watney is\n        presumed dead after a fierce storm and left behind by his crew.\n        But Watney has survived and finds himself stranded and alone on\n        the hostile planet. With only meager supplies, he must draw upon\n        his ingenuity, wit and spirit to subsist and find a way to\n        signal to Earth that he is alive.\n      "],
        "imdb_info.score":[8.1],
        "imdb_info.url":["http://www.imdb.com/title/tt3659388/"],
        "id":"tt3659388",
        "_version_":1666374796425822208}]
  }}
```


ジャンルがドラマ

```
$ curl -s 'http://localhost:8983/solr/mywiki-big-reshape/select?q=genre:drama'
{
  "responseHeader":{
    "status":0,
    "QTime":0,
    "params":{
      "q":"genre:drama"}},
  "response":{"numFound":4,"start":0,"docs":[
      {
        "title":["Apollo 13"],
        "director":["Ron Howard"],
        "release_date":["1995-06-30T00:00:00Z"],
        "mpaa_rating":["PG"],
        "running_time":[140],
        "genre":["adventure",
          "drama"],
        "cast.person.name":["Tom Hanks",
          "Bill Paxton",
          "Kevin Bacon",
          "Gary Sinise",
          "Ed Harris"],
        "cast.person.role":["Jim Lovell",
          "Fred Haise",
          "Jack Swigert",
          "Ken Mattingly",
          "Gene Kranz"],
        "imdb_info.synopsis":["\n        NASA must devise a strategy to return Apollo 13 to Earth safely\n        after the spacecraft undergoes massive internal damage putting\n        the lives of the three astronauts on board in jeopardy.\n      "],
        "imdb_info.score":[7.6],
        "imdb_info.url":["http://www.imdb.com/title/tt0112384/"],
        "id":"tt0112384",
        "_version_":1666374796418482176},
      {
        "title":["Solaris"],
        "director":["Steven Soderbergh"],
        "release_date":["2002-11-27T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[99],
        "genre":["drama",
          "mystery",
          "romance"],
        "cast.person.name":["George Clooney",
          "Natascha McElhone",
          "Ulrich Tukur"],
        "cast.person.role":["Chris Kelvin",
          "Rheya",
          "Gibarian"],
        "imdb_info.synopsis":["\n        A troubled psychologist is sent to investigate the crew of an\n        isolated research station orbiting a bizarre planet.\n      "],
        "imdb_info.score":[6.2],
        "imdb_info.url":["http://www.imdb.com/title/tt0307479/"],
        "id":"tt0307479",
        "_version_":1666374796422676480},
      {
        "title":["Interstellar"],
        "director":["Christopher Nolan"],
        "release_date":["2014-11-07T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[169],
        "genre":["adventure",
          "drama",
          "scifi"],
        "cast.person.name":["Matthew McConaughey",
          "Anne Hathaway",
          "Jessica Chastain",
          "Michael Caine"],
        "cast.person.role":["Cooper",
          "Brand",
          "Murph",
          "Professor Brand"],
        "imdb_info.synopsis":["\n        A team of explorers travel through a wormhole in space in an\n        attempt to ensure humanity's survival.\n      "],
        "imdb_info.score":[8.6],
        "imdb_info.url":["http://www.imdb.com/title/tt0816692/"],
        "id":"tt0816692",
        "_version_":1666374796424773632},
      {
        "title":["The Martian"],
        "director":["Ridley Scott"],
        "release_date":["2015-10-02T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[144],
        "genre":["adventure",
          "drama",
          "scifi"],
        "cast.person.name":["Matt Damon",
          "Jessica Chastain",
          "Kristen Wiig"],
        "cast.person.role":["Mark Watney",
          "Melissa Lewis",
          "Annie Montrose"],
        "imdb_info.synopsis":["\n        During a manned mission to Mars, Astronaut Mark Watney is\n        presumed dead after a fierce storm and left behind by his crew.\n        But Watney has survived and finds himself stranded and alone on\n        the hostile planet. With only meager supplies, he must draw upon\n        his ingenuity, wit and spirit to subsist and find a way to\n        signal to Earth that he is alive.\n      "],
        "imdb_info.score":[8.1],
        "imdb_info.url":["http://www.imdb.com/title/tt3659388/"],
        "id":"tt3659388",
        "_version_":1666374796425822208}]
  }}
```


コアの削除

単一指定削除しかできない模様


```
$ solr delete -c mywiki-small

Deleting core 'mywiki-small' using command:
http://localhost:8983/solr/admin/cores?action=UNLOAD&core=mywiki-small&deleteIndex=true&deleteDataDir=true&deleteInstanceDir=true

$ solr delete -c mywiki-small-reshape

Deleting core 'mywiki-small-reshape' using command:
http://localhost:8983/solr/admin/cores?action=UNLOAD&core=mywiki-small-reshape&deleteIndex=true&deleteDataDir=true&deleteInstanceDir=true

$ solr delete -c mywiki-big-reshape

Deleting core 'mywiki-big-reshape' using command:
http://localhost:8983/solr/admin/cores?action=UNLOAD&core=mywiki-big-reshape&deleteIndex=true&deleteDataDir=true&deleteInstanceDir=true

```


solrプロセスの停止


```
$ solr stop
Sending stop command to Solr running on port 8983 ... waiting up to 180 seconds to allow Jetty process 13413 to stop gracefully.
$ ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14240  1240 pts/0    Ss   08:30   0:00 bash /etc/init/run.sh
kuraine      8  0.0  0.0 237372 18388 ?        S    08:30   0:08 fcitx
kuraine      9  0.0  0.0  14380  1780 pts/0    S+   08:30   0:00 bash
kuraine     21  0.0  0.0  58908   880 ?        S    08:30   0:00 dbus-launch --autolaunch bc74deaa9e044c079ed6fc963d084157 --binary-syntax --close-stderr
kuraine     29  0.0  0.0  58004  1360 ?        Ss   08:30   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --session
kuraine     34  0.0  0.0  58280  1728 ?        Ss   08:30   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
kuraine     38  0.0  0.0  51300   788 ?        SN   08:30   0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-8PqgqAikLv,guid=511fd5f3f8d51b70be6e6e5d5eb88ea7 34
kuraine  14358  0.0  0.0  14380  2132 pts/1    Ss   15:14   0:00 /bin/bash
root     15609  0.0  0.0  87268  2632 pts/1    S    17:20   0:00 su solr
solr     15611  0.0  0.0  14380  2064 pts/1    S    17:20   0:00 bash
solr     15864  0.0  0.0  54308  1868 pts/1    R+   17:34   0:00 ps aux
```

起動方法は２つ

```
$ solr --help

Usage: solr COMMAND OPTIONS
       where COMMAND is one of: start, stop, restart, status, healthcheck, create, create_core, create_collection, delete, version, zk, auth, assert, config, autoscaling, export

  Standalone server example (start Solr running in the background on port 8984):

    ./solr start -p 8984

  SolrCloud example (start Solr running in SolrCloud mode using localhost:2181 to connect to Zookeeper, with 1g max heap size and remote Java debug options enabled):

    ./solr start -c -m 1g -z localhost:2181 -a "-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=1044"

  Omit '-z localhost:2181' from the above command if you have defined ZK_HOST in solr.in.sh.

Pass -help after any COMMAND to see command-specific usage information,
  such as:    ./solr start -help or ./solr stop -help
```

- スタンドアロン起動

```
    ./solr start -p 8984
```

- ソーラクラウド起動

  - dbeaver等で接続する際はこっちで起動しておくのがよさげ

```
    ./solr start -c -m 1g -z localhost:2181 -a "-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=1044"

```



solr クラウドモードでのチュートリアル

  - https://lucene.apache.org/solr/guide/8_4/getting-started-with-solrcloud.html

```
$ solr -e cloud
*** [WARN] ***  Your Max Processes Limit is currently 4096.
 It should be set to 65000 to avoid operational disruption.
 If you no longer wish to see this warning, set SOLR_ULIMIT_CHECKS to false in your profile or solr.in.sh

Welcome to the SolrCloud example!

This interactive session will help you launch a SolrCloud cluster on your local workstation.
To begin, how many Solr nodes would you like to run in your local cluster? (specify 1-4 nodes) [2]:

Ok, let's start up 2 Solr nodes for your example SolrCloud cluster.
Please enter the port for node1 [8983]:

Please enter the port for node2 [7574]:

Creating Solr home directory /usr/local/src/solr-8.5.1/example/cloud/node1/solr
Cloning /usr/local/src/solr-8.5.1/example/cloud/node1 into
   /usr/local/src/solr-8.5.1/example/cloud/node2

Starting up Solr on port 8983 using command:
"/usr/local/src/solr-8.5.1/bin/solr" start -cloud -p 8983 -s "/usr/local/src/solr-8.5.1/example/cloud/node1/solr"

*** [WARN] ***  Your Max Processes Limit is currently 4096.
 It should be set to 65000 to avoid operational disruption.
 If you no longer wish to see this warning, set SOLR_ULIMIT_CHECKS to false in your profile or solr.in.sh
Waiting up to 180 seconds to see Solr running on port 8983 [/]
Started Solr server on port 8983 (pid=16995). Happy searching!


Starting up Solr on port 7574 using command:
"/usr/local/src/solr-8.5.1/bin/solr" start -cloud -p 7574 -s "/usr/local/src/solr-8.5.1/example/cloud/node2/solr" -z localhost:9983

*** [WARN] ***  Your Max Processes Limit is currently 4096.
 It should be set to 65000 to avoid operational disruption.
 If you no longer wish to see this warning, set SOLR_ULIMIT_CHECKS to false in your profile or solr.in.sh
Waiting up to 180 seconds to see Solr running on port 7574 [/]
Started Solr server on port 7574 (pid=17195). Happy searching!

INFO  - 2020-05-11 17:52:30.336; org.apache.solr.common.cloud.ConnectionManager; Waiting for client to connect to ZooKeeper
INFO  - 2020-05-11 17:52:30.362; org.apache.solr.common.cloud.ConnectionManager; zkClient has connected
INFO  - 2020-05-11 17:52:30.362; org.apache.solr.common.cloud.ConnectionManager; Client is connected to ZooKeeper
INFO  - 2020-05-11 17:52:30.371; org.apache.solr.common.cloud.ZkStateReader; Updated live nodes from ZooKeeper... (0) -> (2)
INFO  - 2020-05-11 17:52:30.377; org.apache.solr.client.solrj.impl.ZkClientClusterStateProvider; Cluster at localhost:9983 ready

Now let's create a new collection for indexing documents in your 2-node cluster.
Please provide a name for your new collection: [gettingstarted]

How many shards would you like to split gettingstarted into? [2]

How many replicas per shard would you like to create? [2]

Please choose a configuration for the gettingstarted collection, available options are:
_default or sample_techproducts_configs [_default]

Created collection 'gettingstarted' with 2 shard(s), 2 replica(s) with config-set 'gettingstarted'

Enabling auto soft-commits with maxTime 3 secs using the Config API

POSTing request to Config API: http://localhost:8983/solr/gettingstarted/config
{"set-property":{"updateHandler.autoSoftCommit.maxTime":"3000"}}
Successfully set-property updateHandler.autoSoftCommit.maxTime to 3000


SolrCloud example running, please visit: http://localhost:8983/solr

```


ステータス確認

```
$ solr status

Found 2 Solr nodes:

Solr process 17195 running on port 7574

{
  "solr_home":"/usr/local/src/solr-8.5.1/example/cloud/node2/solr",
  "version":"8.5.1 edb9fc409398f2c3446883f9f80595c884d245d0 - ivera - 2020-04-08 09:01:41",
  "startTime":"2020-05-11T08:52:26.850Z",
  "uptime":"0 days, 0 hours, 3 minutes, 35 seconds",
  "memory":"264.2 MB (%51.6) of 512 MB",
  "cloud":{
    "ZooKeeper":"localhost:9983",
    "liveNodes":"2",
    "collections":"1"}}


Solr process 16995 running on port 8983
{
  "solr_home":"/usr/local/src/solr-8.5.1/example/cloud/node1/solr",
  "version":"8.5.1 edb9fc409398f2c3446883f9f80595c884d245d0 - ivera - 2020-04-08 09:01:41",
  "startTime":"2020-05-11T08:52:23.182Z",
  "uptime":"0 days, 0 hours, 3 minutes, 40 seconds",
  "memory":"218.8 MB (%42.7) of 512 MB",
  "cloud":{
    "ZooKeeper":"localhost:9983",
    "liveNodes":"2",
    "collections":"1"}}

```


プロセス確認

```
$ ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14240  1240 pts/0    Ss   08:30   0:00 bash /etc/init/run.sh
kuraine      8  0.0  0.0 237372 18388 ?        S    08:30   0:09 fcitx
kuraine      9  0.0  0.0  14380  1780 pts/0    S+   08:30   0:00 bash
kuraine     21  0.0  0.0  58908   880 ?        S    08:30   0:00 dbus-launch --autolaunch bc74deaa9e044c079ed6fc963d084157 --binary-syntax --close-stderr
kuraine     29  0.0  0.0  58004  1360 ?        Ss   08:30   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --session
kuraine     34  0.0  0.0  58280  1728 ?        Ss   08:30   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
kuraine     38  0.0  0.0  51300   788 ?        SN   08:30   0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-8PqgqAikLv,guid=511fd5f3f8d51b70be6e6e5d5eb88ea7 34
kuraine  14358  0.0  0.0  14380  2136 pts/1    Ss   15:14   0:00 /bin/bash
root     16637  0.0  0.0  87268  2636 pts/1    S    17:45   0:00 su solr
solr     16639  0.0  0.0  14380  2064 pts/1    S    17:45   0:00 bash
solr     16995  7.9  1.7 8425508 580736 pts/1  Sl   17:52   0:23 /usr/local/src/jdk-11/bin/java -server -Xms512m -Xmx512m -XX:+UseG1GC -XX:+PerfDisableSharedMem -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=2
solr     17195  6.7  1.7 6505268 579336 pts/1  Sl   17:52   0:19 /usr/local/src/jdk-11/bin/java -server -Xms512m -Xmx512m -XX:+UseG1GC -XX:+PerfDisableSharedMem -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=2
solr     17526  0.0  0.0  54308  1872 pts/1    R+   17:57   0:00 ps aux

```


ポート確認

```
$ lsof -i:9983
COMMAND   PID USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
java    16995 solr  158u  IPv4 6876908      0t0  TCP *:9983 (LISTEN)
java    16995 solr  165u  IPv4 6880565      0t0  TCP localhost:35832->localhost:9983 (ESTABLISHED)
java    16995 solr  166u  IPv4 6879666      0t0  TCP localhost:9983->localhost:35832 (ESTABLISHED)
java    16995 solr  189u  IPv4 6879741      0t0  TCP localhost:9983->localhost:35844 (ESTABLISHED)
java    17195 solr  155u  IPv4 6878802      0t0  TCP localhost:35844->localhost:9983 (ESTABLISHED)
$ lsof -i:8983
COMMAND   PID USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
java    16995 solr  168u  IPv4 6884489      0t0  TCP *:8983 (LISTEN)
java    16995 solr  187u  IPv4 6887720      0t0  TCP docker-container-centos-7-6-18-10-ruby-vscode:8983->docker-container-centos-7-6-18-10-ruby-vscode:48840 (ESTABLISHED)
java    16995 solr  188u  IPv4 6894742      0t0  TCP docker-container-centos-7-6-18-10-ruby-vscode:48840->docker-container-centos-7-6-18-10-ruby-vscode:8983 (ESTABLISHED)
$ lsof -i:7574
COMMAND   PID USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
java    16995 solr  192u  IPv4 6894743      0t0  TCP docker-container-centos-7-6-18-10-ruby-vscode:52556->docker-container-centos-7-6-18-10-ruby-vscode:7574 (ESTABLISHED)
java    17195 solr  156u  IPv4 6883118      0t0  TCP *:7574 (LISTEN)
java    17195 solr  175u  IPv4 6880137      0t0  TCP docker-container-centos-7-6-18-10-ruby-vscode:7574->docker-container-centos-7-6-18-10-ruby-vscode:52556 (ESTABLISHED)
```


ヘルスチェック


```
$ solr healthcheck -c gettingstarted
{
  "collection":"gettingstarted",
  "status":"healthy",
  "numDocs":0,
  "numShards":2,
  "shards":[
    {
      "shard":"shard1",
      "status":"healthy",
      "replicas":[
        {
          "name":"core_node3",
          "url":"http://172.17.0.2:8983/solr/gettingstarted_shard1_replica_n1/",
          "numDocs":0,
          "status":"active",
          "uptime":"0 days, 0 hours, 9 minutes, 31 seconds",
          "memory":"233.9 MB (%45.7) of 512 MB",
          "leader":true},
        {
          "name":"core_node5",
          "url":"http://172.17.0.2:7574/solr/gettingstarted_shard1_replica_n2/",
          "numDocs":0,
          "status":"active",
          "uptime":"0 days, 0 hours, 9 minutes, 28 seconds",
          "memory":"49.3 MB (%9.6) of 512 MB"}]},
    {
      "shard":"shard2",
      "status":"healthy",
      "replicas":[
        {
          "name":"core_node7",
          "url":"http://172.17.0.2:8983/solr/gettingstarted_shard2_replica_n4/",
          "numDocs":0,
          "status":"active",
          "uptime":"0 days, 0 hours, 9 minutes, 32 seconds",
          "memory":"234 MB (%45.7) of 512 MB",
          "leader":true},
        {
          "name":"core_node8",
          "url":"http://172.17.0.2:7574/solr/gettingstarted_shard2_replica_n6/",
          "numDocs":0,
          "status":"active",
          "uptime":"0 days, 0 hours, 9 minutes, 28 seconds",
          "memory":"49.7 MB (%9.7) of 512 MB"}]}]}
```


solrプロセスとコア作成まで完了したので、データ投入

- https://lucene.apache.org/solr/guide/8_4/post-tool.html#post-tool

```
$ post -c gettingstarted $HOME/wrksp/in-big-data-reshape
/usr/local/src/jdk-11/bin/java -classpath /usr/local/src/solr-8.5.1/dist/solr-core-8.5.1.jar -Dauto=yes -Dc=gettingstarted -Ddata=files -Drecursive=yes org.apache.solr.util.SimplePostTool /home/solr/wrksp/in-big-data-reshape
SimplePostTool version 5.0.0
Posting files to [base] url http://localhost:8983/solr/gettingstarted/update...
Entering auto mode. File endings considered are xml,json,jsonl,csv,pdf,doc,docx,ppt,pptx,xls,xlsx,odt,odp,ods,ott,otp,ots,rtf,htm,html,txt,log
Entering recursive mode, max depth=999, delay=0s
Indexing directory /home/solr/wrksp/in-big-data-reshape (1 files, depth=0)
POSTing file test-big-reshape.json (application/json) to [base]/json/docs
1 files indexed.
COMMITting Solr index changes to http://localhost:8983/solr/gettingstarted/update...
Time spent: 0:00:01.098
```


検索してみる

- zkConnectedがtrueになったじょうたいで検索結果を取得できている

```
$ curl -s 'http://localhost:8983/solr/gettingstarted/select?q=*%3A*'
{
  "responseHeader":{
    "zkConnected":true,
    "status":0,
    "QTime":23,
    "params":{
      "q":"*:*"}},
  "response":{"numFound":5,"start":0,"maxScore":1.0,"docs":[
      {
        "title":["Solaris"],
        "director":["Steven Soderbergh"],
        "release_date":["2002-11-27T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[99],
        "genre":["drama",
          "mystery",
          "romance"],
        "cast.person.name":["George Clooney",
          "Natascha McElhone",
          "Ulrich Tukur"],
        "cast.person.role":["Chris Kelvin",
          "Rheya",
          "Gibarian"],
        "imdb_info.synopsis":["\n        A troubled psychologist is sent to investigate the crew of an\n        isolated research station orbiting a bizarre planet.\n      "],
        "imdb_info.score":[6.2],
        "imdb_info.url":["http://www.imdb.com/title/tt0307479/"],
        "id":"tt0307479",
        "_version_":1666384506893893632},
      {
        "title":["Ender's Game"],
        "director":["Gavin Hood"],
        "release_date":["2013-11-01T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[114],
        "genre":["action",
          "scifi"],
        "cast.person.name":["Asa Butterfield",
          "Harrison Ford",
          "Hailee Steinfeld"],
        "cast.person.role":["Ender Wiggin",
          "Colonel Graff",
          "Petra Arkanian"],
        "imdb_info.synopsis":["\n        Young Ender Wiggin is recruited by the International Military\n        to lead the fight against the Formics, a genocidal alien race\n        which nearly annihilated the human race in a previous invasion.\n      "],
        "imdb_info.score":[6.7],
        "imdb_info.url":["http://www.imdb.com/title/tt1731141/"],
        "id":"tt1731141",
        "_version_":1666384506901233664},
      {
        "title":["Interstellar"],
        "director":["Christopher Nolan"],
        "release_date":["2014-11-07T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[169],
        "genre":["adventure",
          "drama",
          "scifi"],
        "cast.person.name":["Matthew McConaughey",
          "Anne Hathaway",
          "Jessica Chastain",
          "Michael Caine"],
        "cast.person.role":["Cooper",
          "Brand",
          "Murph",
          "Professor Brand"],
        "imdb_info.synopsis":["\n        A team of explorers travel through a wormhole in space in an\n        attempt to ensure humanity's survival.\n      "],
        "imdb_info.score":[8.6],
        "imdb_info.url":["http://www.imdb.com/title/tt0816692/"],
        "id":"tt0816692",
        "_version_":1666384506905427968},
      {
        "title":["Apollo 13"],
        "director":["Ron Howard"],
        "release_date":["1995-06-30T00:00:00Z"],
        "mpaa_rating":["PG"],
        "running_time":[140],
        "genre":["adventure",
          "drama"],
        "cast.person.name":["Tom Hanks",
          "Bill Paxton",
          "Kevin Bacon",
          "Gary Sinise",
          "Ed Harris"],
        "cast.person.role":["Jim Lovell",
          "Fred Haise",
          "Jack Swigert",
          "Ken Mattingly",
          "Gene Kranz"],
        "imdb_info.synopsis":["\n        NASA must devise a strategy to return Apollo 13 to Earth safely\n        after the spacecraft undergoes massive internal damage putting\n        the lives of the three astronauts on board in jeopardy.\n      "],
        "imdb_info.score":[7.6],
        "imdb_info.url":["http://www.imdb.com/title/tt0112384/"],
        "id":"tt0112384",
        "_version_":1666384506385334272},
      {
        "title":["The Martian"],
        "director":["Ridley Scott"],
        "release_date":["2015-10-02T00:00:00Z"],
        "mpaa_rating":["PG-13"],
        "running_time":[144],
        "genre":["adventure",
          "drama",
          "scifi"],
        "cast.person.name":["Matt Damon",
          "Jessica Chastain",
          "Kristen Wiig"],
        "cast.person.role":["Mark Watney",
          "Melissa Lewis",
          "Annie Montrose"],
        "imdb_info.synopsis":["\n        During a manned mission to Mars, Astronaut Mark Watney is\n        presumed dead after a fierce storm and left behind by his crew.\n        But Watney has survived and finds himself stranded and alone on\n        the hostile planet. With only meager supplies, he must draw upon\n        his ingenuity, wit and spirit to subsist and find a way to\n        signal to Earth that he is alive.\n      "],
        "imdb_info.score":[8.1],
        "imdb_info.url":["http://www.imdb.com/title/tt3659388/"],
        "id":"tt3659388",
        "_version_":1666384506502774784}]
  }}
```




dbeaverに接続してクエリ発行

```
select fielda, fieldb, fieldc, fieldd_s, fielde_i from gettingstarted;
```

```
SQLエラー: java.sql.SQLException: java.io.IOException: --> http://172.17.0.2:7574/solr/gettingstarted_shard1_replica_n2/:Failed to execute sqlQuery 'select fielda, fieldb, fieldc, fieldd_s, fielde_i from gettingstarted limit 200' against JDBC connection 'jdbc:calcitesolr:'.
Error while executing SQL "select fielda, fieldb, fieldc, fieldd_s, fielde_i from gettingstarted limit 200": From line 1, column 8 to line 1, column 13: Column 'fielda' not found in any table
```

アスタにしてクエリ発行

```
select * from gettingstarted;
```


```


```


```
select genre_str from gettingstarted;
```




# solr Cloudモードでの起動 (dbeaverでzookeeper経由で接続するぽいので、これがデフォにしたい。スタンドアロンは単一機能検証ぐらいか。)

#https://lucene.apache.org/solr/guide/6_6/solr-control-script-reference.html


zookeeperは-cオプション指定時はデフォルトで起動するぽい

```

solr docker-container-centos-7-6-18-10-apache_solr-dbeaver ~$solr start -c
Waiting up to 180 seconds to see Solr running on port 8983 [/]
Started Solr server on port 8983 (pid=924). Happy searching!




```

ポート確認

```


solr docker-container-centos-7-6-18-10-apache_solr-dbeaver ~$lsof -i:9983 -i:8983
COMMAND PID USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
java    924 solr  158u  IPv4 9508211      0t0  TCP *:9983 (LISTEN)
java    924 solr  165u  IPv4 9503144      0t0  TCP localhost:45144->localhost:9983 (ESTABLISHED)
java    924 solr  166u  IPv4 9512134      0t0  TCP localhost:9983->localhost:45144 (ESTABLISHED)
java    924 solr  168u  IPv4 9510196      0t0  TCP *:8983 (LISTEN)
java    924 solr  187u  IPv4 9508244      0t0  TCP docker-container-centos-7-6-18-10-apache_solr-dbeaver:8983->docker-container-centos-7-6-18-10-apache_solr-dbeaver:39532 (ESTABLISHED)
java    924 solr  188u  IPv4 9515031      0t0  TCP docker-container-centos-7-6-18-10-apache_solr-dbeaver:39532->docker-container-centos-7-6-18-10-apache_solr-dbeaver:8983 (ESTABLISHED)


```




データ準備


```

$mkdir -p dump-in

$cd dump-in

$ls
test.json


$cat test.json  | jq
[
  {
    "name": "Andy",
    "age": "21",
    "id": "123"
  },
  {
    "name": "Brian",
    "age": "23",
    "id": "234"
  },
  {
    "name": "Charles",
    "age": "19",
    "id": "345"
  }
]



```


コア作成


```

$solr create -c mywiki-small-reshape -s 2 -rf 2
WARNING: Using _default configset with data driven schema functionality. NOT RECOMMENDED for production use.
         To turn off: bin/solr config -c mywiki-small-reshape -p 8983 -action set-user-property -property update.autoCreateFields -value false
Created collection 'mywiki-small-reshape' with 2 shard(s), 2 replica(s) with config-set 'mywiki-small-reshape'



```


データ投入


```

$post -c mywiki-small-reshape $HOME/dump-in

```

```

$post -c mywiki-small-reshape $HOME/dump-in
/usr/local/src/jdk-11/bin/java -classpath /usr/local/src/solr-8.5.1/dist/solr-core-8.5.1.jar -Dauto=yes -Dc=mywiki-small-reshape -Ddata=files -Drecursive=yes org.apache.solr.util.SimplePostTool /home/solr/dump-in
SimplePostTool version 5.0.0
Posting files to [base] url http://localhost:8983/solr/mywiki-small-reshape/update...
Entering auto mode. File endings considered are xml,json,jsonl,csv,pdf,doc,docx,ppt,pptx,xls,xlsx,odt,odp,ods,ott,otp,ots,rtf,htm,html,txt,log
Entering recursive mode, max depth=999, delay=0s
Indexing directory /home/solr/dump-in (1 files, depth=0)
POSTing file test.json (application/json) to [base]/json/docs
1 files indexed.
COMMITting Solr index changes to http://localhost:8983/solr/mywiki-small-reshape/update...
Time spent: 0:00:00.608


```


データ確認


```

$curl -s 'http://localhost:8983/solr/mywiki-small-reshape/select?q=*%3A*'

```


zookeeper起動しつつ、データ取得確認できた

```
$curl -s 'http://localhost:8983/solr/mywiki-small-reshape/select?q=*%3A*'
{
  "responseHeader":{
    "zkConnected":true,
    "status":0,
    "QTime":50,
    "params":{
      "q":"*:*"}},
  "response":{"numFound":3,"start":0,"maxScore":1.0,"docs":[
      {
        "name":["Andy"],
        "age":[21],
        "id":"123",
        "_version_":1666407181052805120},
      {
        "name":["Charles"],
        "age":[19],
        "id":"345",
        "_version_":1666407181130399744},
      {
        "name":["Brian"],
        "age":[23],
        "id":"234",
        "_version_":1666407181278248960}]
  }}

```



dbeaverクライアントを使用して操作する際はハイフン等の文字を混入させてしまうとsqlパースエラーとなるので、
キャメルケース等で対処

ということで、コア名違いでコアをもう一個作成


```
$solr create -c mywikiSmallReshape -s 2 -rf 2

```



```

$solr create -c mywikiSmallReshape -s 2 -rf 2
WARNING: Using _default configset with data driven schema functionality. NOT RECOMMENDED for production use.
         To turn off: bin/solr config -c mywikiSmallReshape -p 8983 -action set-user-property -property update.autoCreateFields -value false
Created collection 'mywikiSmallReshape' with 2 shard(s), 2 replica(s) with config-set 'mywikiSmallReshape'


```


再度データ投入


```
$post -c mywikiSmallReshape $HOME/dump-in
```


```
$post -c mywikiSmallReshape $HOME/dump-in
/usr/local/src/jdk-11/bin/java -classpath /usr/local/src/solr-8.5.1/dist/solr-core-8.5.1.jar -Dauto=yes -Dc=mywikiSmallReshape -Ddata=files -Drecursive=yes org.apache.solr.util.SimplePostTool /home/solr/dump-in
SimplePostTool version 5.0.0
Posting files to [base] url http://localhost:8983/solr/mywikiSmallReshape/update...
Entering auto mode. File endings considered are xml,json,jsonl,csv,pdf,doc,docx,ppt,pptx,xls,xlsx,odt,odp,ods,ott,otp,ots,rtf,htm,html,txt,log
Entering recursive mode, max depth=999, delay=0s
Indexing directory /home/solr/dump-in (1 files, depth=0)
POSTing file test.json (application/json) to [base]/json/docs
1 files indexed.
COMMITting Solr index changes to http://localhost:8983/solr/mywikiSmallReshape/update...
Time spent: 0:00:00.495
```


投入データ確認

```
$curl -s 'http://localhost:8983/solr/mywikiSmallReshape/select?q=*%3A*'
{
  "responseHeader":{
    "zkConnected":true,
    "status":0,
    "QTime":10,
    "params":{
      "q":"*:*"}},
  "response":{"numFound":3,"start":0,"maxScore":1.0,"docs":[
      {
        "name":["Andy"],
        "age":[21],
        "id":"123",
        "_version_":1666407928329928704},
      {
        "name":["Charles"],
        "age":[19],
        "id":"345",
        "_version_":1666407928332025856},
      {
        "name":["Brian"],
        "age":[23],
        "id":"234",
        "_version_":1666407928159010816}]
  }}
```



sql

これでいけますた

```
select * from mywikiSmallReshape;
```

dbeaverで Ctrl+Shift+Cでtsvデータクリップボードにコピーできる。便利。

```
_version_	name_str	_root_	name	id	age	_query_	score
1,666,407,928,159,010,816	{Brian}	[NULL]	{Brian}	234	{23}	[NULL]	1
1,666,407,928,329,928,704	{Andy}	[NULL]	{Andy}	123	{21}	[NULL]	1
1,666,407,928,332,025,856	{Charles}	[NULL]	{Charles}	345	{19}	[NULL]	1
```


dbeaverで接続する際はsolrCloudモードで決まり。



