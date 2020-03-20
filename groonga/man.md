# JSONデータ回収

- API提供

- API非提供


# 前処理

feedlyを例に

1000件そのままファイルに出力

```
curl -s -H 'Authorization: Bearer A06ZLbYO6DNLI6o7cH_LuJ7-HCERsBMrKmsMzWAIPhifNDJe_WpTZKG97vVz1ONodHF3u1X7Y9PHRWCDD9wu3OQgtl3BU2VXUTg310QgRQcE5U6Igb46SUF81G1PymbOlT3Tyep0aT34wT1G8gLR6T8fM6j6xjI428yeuHu6IOuIKazFVZeoBEBsZGtWLAfTOvtbIXIWO2phI7Z7DK81RIQ0u_DtyiWJVYBfw7pi28wG:feedly' https://cloud.feedly.com/v3/streams/user%2F26c34d27-f858-40be-89a3-527fa5cb76ef%2Fcategory%2FProgramming/contents?count=1000>1000-cnt.json
```

必要そうな項目のみ抽出

```
cat 1000-cnt.json |jq -c --stream 'select(length==2)|{key:.[0]|join("."),value:.[1]}' | jq -s -c '.[]|select(.key|test("items\\.[0-9]{1,}\\.(title|id|htmlUrl|origin\\.htmlUrl|origin\\.title|crawled|summary\\.content|published|alternate\\.[0-9]{1,}\\.href|categories\\.[0-9]{1,}\\.id)"))'|jq -s 'from_entries'>1000-cnt.json.done
```

項目名の正規化

ハイフン区切りで一意にする

```
cat 1000-cnt.json.done | jq  'to_entries|map({"grp":.key|gsub("[a-zA-Z]{1,}";"")|gsub("^\\.";"")|gsub("\\..*";""),"item":
{"key":.key|gsub("\\.";"-")|gsub("-[0-9]{1,}-";"-"),"value":.value}})|group_by(.grp)|map({"grp":.[].grp,"items":(reduce .[].item as $item([];.+[$item]))})|unique'>1000-cnt.json.done.done
```

groonga投入用に整形

ここはベンダ依存によると思うが、大体同じであろう


groongaの場合、_keyないしは_idの列が必須のため、それように列追加したデータを用意する。

当該列の値はユニーク値と同じものであるといい。今回の場合はgrp。

```
cat 1000-cnt.json.done.done | jq 'map({"grp":.grp} as $grp|{"_key":.grp} as $key |.items|from_entries|reduce . as $item({};$key+$grp+$item))'>1000-cnt.json.done.done.done
```

tojsonでエスケープ

ここはベンダ依存によると思うが、大体同じであろう

```
cat 1000-cnt.json.done.done.done | jq 'tojson'>1000-cnt.json.done.done.done.done
```


# groongaデータベースに投入

データベース作成して、テーブル定義作成

```
groonga -n testdb

groonga testdb table_create --name test_tbl --flags 'TABLE_HASH_KEY|KEY_LARGE' --key_type UInt32
groonga testdb column_create --table test_tbl --name grp --type UInt32
groonga testdb column_create --table test_tbl --name items-id --type LongText
groonga testdb column_create --table test_tbl --name items-title --type LongText
groonga testdb column_create --table test_tbl --name items-summary-content --type LongText
groonga testdb column_create --table test_tbl --name items-alternate-href --type LongText
groonga testdb column_create --table test_tbl --name items-crawled --type Time
groonga testdb column_create --table test_tbl --name items-published --type Time
groonga testdb column_create --table test_tbl --name items-origin-title --type LongText
groonga testdb column_create --table test_tbl --name items-origin-htmlUrl --type LongText
groonga testdb column_create --table test_tbl --name items-categories-id --type LongText


groonga testdb load --table test_tbl $(cat 1000-cnt.json.done.done.done.done)
[[0,1581857875.239317,0.04261350631713867],1000]
```

投入後確認


```
groonga testdb select --table test_tbl | jq
```


# エクスポート

- https://groonga.org/ja/docs/reference/commands/dump.html

```
$groonga testdb dump >testdb.dump
```

ダンプファイルはそのままgroongaプロセスに投入できるスクリプトとして出力されている

```
$head -n20 testdb.dump 
table_create test_tbl TABLE_HASH_KEY|KEY_LARGE UInt32
column_create test_tbl grp COLUMN_SCALAR UInt32
column_create test_tbl items-alternate-href COLUMN_SCALAR LongText
column_create test_tbl items-categories-id COLUMN_SCALAR LongText
column_create test_tbl items-crawled COLUMN_SCALAR Time
column_create test_tbl items-id COLUMN_SCALAR LongText
column_create test_tbl items-origin-htmlUrl COLUMN_SCALAR LongText
column_create test_tbl items-origin-title COLUMN_SCALAR LongText
column_create test_tbl items-published COLUMN_SCALAR Time
column_create test_tbl items-summary-content COLUMN_SCALAR LongText
column_create test_tbl items-title COLUMN_SCALAR LongText

load --table test_tbl
[
["_key","grp","items-alternate-href","items-categories-id","items-crawled","items-id","items-origin-htmlUrl","items-origin-title","items-published","items-summary-content","items-title"],
[0,0,"https://www.reuters.com/article/us-health-coronavirus-california-stay-at/california-governor-issues-statewide-stay-at-home-order-idUSKBN21707B","user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",1584685131660.0,"7/REDKQ0ddhFhnXIvWlqxaaJaABWsOyup+G/ET0ccSg=_170f698278c:19b95:52181886","https://news.ycombinator.com/best","Top Links | Hacker News",1584685131660.0,"<a href=\"https://news.ycombinator.com/item?id=22633798\">Comments</a>","California governor issues statewide 'stay at home' order"],
[1,1,"http://blog.livedoor.jp/kamiiida1966/archives/51354596.html","user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",1584684929523.0,"pyrFTscQB53b5/9koQYmv8mJJl9ldyYgLZ9AwTwWWPk=_170f69511f3:b66132:c087a336","http://blog.livedoor.jp/kamiiida1966/","上飯田ブログ",1584678738000.0,"オービス・フライロッドの新製品！リーコンが入荷いたしました。オービスのミッドプライスシリーズのリーコンがヘリオス3(H3)テクノロジーを後ろ盾に一新されました。H3構造によるブランク断面形状であるフープの強度増加、ブランクの贅肉を省いた軽量化、パワー伝達の向上と...","ORVIS RECON"],
[10,10,"https://www.vice.com/en_us/article/qjdm53/this-risky-hack-could-double-access-to-ventilators-as-coronavirus-peaks","user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",1584679564182.0,"2tM1DedEr6eqgdqJ8X4sP+CS3BVG/bkK4hS45ZnKnRQ=_170f6433396:bb7539:64461f40","https://news.ycombinator.com/","Hacker News",1584675052000.0,"<a href=\"https://news.ycombinator.com/item?id=22634494\">Comments</a>","Risky hack could double access to ventilators"],
[100,100,"https://www.techdirt.com/articles/20200318/19164444128/body-camera-once-again-catches-nypd-officer-planting-drugs-someones-car.shtml","user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",1584661017719.0,"XWqY8/21/hoPde6CSSnjKPopw3E+CLO0c+DAhXk0Rdg=_170f5283477:969be0:c087a336","https://news.ycombinator.com/newest","Hacker News: Newest",1584650786000.0,"<p>Article URL: <a href=\"https://www.techdirt.com/articles/20200318/19164444128/body-camera-once-again-catches-nypd-officer-planting-drugs-someones-car.shtml\">https://www.techdirt.com/articles/20200318/19164444128/body-camera-once-again-catches-nypd-officer-planting-drugs-someones-car.shtml</a></p>\n<p>Comments URL: <a href=\"https://news.ycombinator.com/item?id=22631555\">https://news.ycombinator.com/item?id=22631555</a></p>\n<p>Points: 328</p>\n<p># Comments: 147</p>","Body Camera Once Again Catches an NYPD Officer Planting Drugs in Someone's Car"],
[101,101,"https://speakerdeck.com/nicksantamaria/securing-drupal-on-kubernetes-sydney-meetup","user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",1584660959977.0,"kbcnL5XqWJi/iYn/BuKqrf/JSzXEf2szaOaXmzc6oZ4=_170f52752e9:a21070:64461f40","https://speakerdeck.com","Programming - Speaker Deck",1584660876000.0,"","Securing Drupal on Kubernetes - Sydney Meetup"],
```

# インポート

- ダンプファイル以外を削除

```
$ls testdb* | grep -v dump | xargs rm
```



```
$ls -l
total 7796
-rw-rw-r--. 1 apache apache 2537514  3月 20 15:24 1000-cnt.json
-rw-rw-r--. 1 apache apache 1039875  3月 20 15:30 1000-cnt.json.done
-rw-rw-r--. 1 apache apache 1454271  3月 20 15:30 1000-cnt.json.done.done
-rw-rw-r--. 1 apache apache 1063993  3月 20 15:31 1000-cnt.json.done.done.done
-rw-rw-r--. 1 apache apache 1043380  3月 20 15:31 1000-cnt.json.done.done.done.done
-rw-rw-r--. 1 apache apache    1068  3月 20 16:01 asyncomplete.log
drwxr-xr-x. 3 apache apache    4096  3月  1 03:46 dotfile
-rw-rw-r--. 1 apache apache  815494  3月 20 16:01 testdb.dump
-rw-rw-r--. 1 apache apache    2916  3月 20 16:02 vim-lsp.log
```


- 実行

```
$groonga -n testdb <testdb.dump
[[0,1584687929.774816,0.003559350967407227],true]
[[0,1584687929.778442,0.003829717636108398],true]
[[0,1584687929.7823,0.003080129623413086],true]
[[0,1584687929.785411,0.003129959106445312],true]
[[0,1584687929.788587,0.002962589263916016],true]
[[0,1584687929.791585,0.003156423568725586],true]
[[0,1584687929.794783,0.003129482269287109],true]
[[0,1584687929.797953,0.003182172775268555],true]
[[0,1584687929.801198,0.003221511840820312],true]
[[0,1584687929.80448,0.003308773040771484],true]
[[0,1584687929.807851,0.00362086296081543],true]
[[0,1584687929.811564,0.01777958869934082],1000]
```


- 確認

```
$groonga testdb select --table test_tbl | jq
[
  [
    0,
    1584687949.262518,
    0.0008256435394287109
  ],
  [
    [
      [
        1000
      ],
      [
        [
          "_id",
          "UInt32"
        ],
        [
          "_key",
          "UInt32"
        ],
        [
          "grp",
          "UInt32"
        ],
        [
          "items-alternate-href",
          "LongText"
        ],
        [
          "items-categories-id",
          "LongText"
        ],
        [
          "items-crawled",
          "Time"
        ],
        [
          "items-id",
          "LongText"
        ],
        [
          "items-origin-htmlUrl",
          "LongText"
        ],
        [
          "items-origin-title",
          "LongText"
        ],
        [
          "items-published",
          "Time"
        ],
        [
          "items-summary-content",
          "LongText"
        ],
        [
          "items-title",
          "LongText"
        ]
      ],
      [
        1,
        0,
        0,
        "https://www.reuters.com/article/us-health-coronavirus-california-stay-at/california-governor-issues-statewide-stay-at-home-order-idUSKBN21707B",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584685131660,
        "7/REDKQ0ddhFhnXIvWlqxaaJaABWsOyup+G/ET0ccSg=_170f698278c:19b95:52181886",
        "https://news.ycombinator.com/best",
        "Top Links | Hacker News",
        1584685131660,
        "<a href=\"https://news.ycombinator.com/item?id=22633798\">Comments</a>",
        "California governor issues statewide 'stay at home' order"
      ],
      [
        2,
        1,
        1,
        "http://blog.livedoor.jp/kamiiida1966/archives/51354596.html",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584684929523,
        "pyrFTscQB53b5/9koQYmv8mJJl9ldyYgLZ9AwTwWWPk=_170f69511f3:b66132:c087a336",
        "http://blog.livedoor.jp/kamiiida1966/",
        "上飯田ブログ",
        1584678738000,
        "オービス・フライロッドの新製品！リーコンが入荷いたしました。オービスのミッドプライスシリーズのリーコンがヘリオス3(H3)テクノロジーを後ろ盾に一新されました。H3構造によるブランク断面形状であるフープの強度増加、ブランクの贅肉を省いた軽量化、パワー伝達の向上と...",
        "ORVIS RECON"
      ],
      [
        3,
        10,
        10,
        "https://www.vice.com/en_us/article/qjdm53/this-risky-hack-could-double-access-to-ventilators-as-coronavirus-peaks",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584679564182,
        "2tM1DedEr6eqgdqJ8X4sP+CS3BVG/bkK4hS45ZnKnRQ=_170f6433396:bb7539:64461f40",
        "https://news.ycombinator.com/",
        "Hacker News",
        1584675052000,
        "<a href=\"https://news.ycombinator.com/item?id=22634494\">Comments</a>",
        "Risky hack could double access to ventilators"
      ],
      [
        4,
        100,
        100,
        "https://www.techdirt.com/articles/20200318/19164444128/body-camera-once-again-catches-nypd-officer-planting-drugs-someones-car.shtml",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584661017719,
        "XWqY8/21/hoPde6CSSnjKPopw3E+CLO0c+DAhXk0Rdg=_170f5283477:969be0:c087a336",
        "https://news.ycombinator.com/newest",
        "Hacker News: Newest",
        1584650786000,
        "<p>Article URL: <a href=\"https://www.techdirt.com/articles/20200318/19164444128/body-camera-once-again-catches-nypd-officer-planting-drugs-someones-car.shtml\">https://www.techdirt.com/articles/20200318/19164444128/body-camera-once-again-catches-nypd-officer-planting-drugs-someones-car.shtml</a></p>\n<p>Comments URL: <a href=\"https://news.ycombinator.com/item?id=22631555\">https://news.ycombinator.com/item?id=22631555</a></p>\n<p>Points: 328</p>\n<p># Comments: 147</p>",
        "Body Camera Once Again Catches an NYPD Officer Planting Drugs in Someone's Car"
      ],
      [
        5,
        101,
        101,
        "https://speakerdeck.com/nicksantamaria/securing-drupal-on-kubernetes-sydney-meetup",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584660959977,
        "kbcnL5XqWJi/iYn/BuKqrf/JSzXEf2szaOaXmzc6oZ4=_170f52752e9:a21070:64461f40",
        "https://speakerdeck.com",
        "Programming - Speaker Deck",
        1584660876000,
        "",
        "Securing Drupal on Kubernetes - Sydney Meetup"
      ],
      [
        6,
        102,
        102,
        "https://daily-gadget.net/2020/03/20/post-12756/",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584660734355,
        "iV1QThfVu3ya0+Xg8V15WJRnaZUrCDdlhHl2DMUY8H8=_170f523e193:96424a:c087a336",
        "https://daily-gadget.net",
        "デイリーガジェット",
        1584660611000,
        "アキバのメイド通りそばにある「PCコンフル2号店」では、毎週金土日に、主にノートPCで、とてもお得なセールを実施しています。 今週末（3月2...",
        "PCコンフル二号店限定 今週末のセール情報【ThinkPad L540が1万円台！デイリーガジェット割引も！】"
      ],
      [
        7,
        103,
        103,
        "https://apoorvaj.io/exploring-calling-conventions/",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584660665034,
        "2tM1DedEr6eqgdqJ8X4sP+CS3BVG/bkK4hS45ZnKnRQ=_170f522d2ca:a1c648:64461f40",
        "https://news.ycombinator.com/",
        "Hacker News",
        1584653743000,
        "<a href=\"https://news.ycombinator.com/item?id=22632008\">Comments</a>",
        "Exploring calling conventions with x86 assembly (2016)"
      ],
      [
        8,
        104,
        104,
        "https://www.itmedia.co.jp/mobile/articles/2003/20/news028.html",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584660605405,
        "WHu60N6sgKQ4t2C8WRv+z2/luUb/R26G7xBUpjjHYus=_170f521e9dd:9cf8db:c062e582",
        "https://www.itmedia.co.jp/",
        "ITmedia PC・AV・スマートフォン 最新記事一覧",
        1584658800000,
        "",
        "ドコモの5G戦略を読み解く　ネットワーク、料金、端末の特徴は？"
      ],
      [
        9,
        105,
        105,
        "https://www.datafix.com.au/BASHing/2020-03-18.html",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584659253447,
        "2tM1DedEr6eqgdqJ8X4sP+CS3BVG/bkK4hS45ZnKnRQ=_170f50d48c7:9fba67:64461f40",
        "https://news.ycombinator.com/",
        "Hacker News",
        1584484307000,
        "<a href=\"https://news.ycombinator.com/item?id=22611287\">Comments</a>",
        "A curious pair of data ops"
      ],
      [
        10,
        106,
        106,
        "http://www.oaktable.net/content/unreal-load-testing-cloud",
        "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
        1584659142007,
        "Qx/2NJVf+odZQ+jl1cBQR6z37DTbx0ZQxRiuUMv0Ot4=_170f50b9577:9f90ba:64461f40",
        "http://www.oaktable.net/oakienews",
        "Oakie Blogs Feed",
        1583541096000,
        "<p>Load testing as part of a cloud migration project is expected and  should be built into the requirements.  The goal is to set yourself up for success.</p>\n<p><a rel=\"attachment wp-att-9198\" href=\"https://dbakevlar.com/2020/03/unreal-load-testing-in-the-cloud/success3/\"><img alt=\"\" width=\"498\" src=\"https://dbakevlar.com/wp-content/uploads/2020/03/success3.gif\" class=\"wp-image-9198\" height=\"280\"></a></p>\n<h4>Log Latency</h4>\n<p>Recently I had a Cloud Solution Architect, (CSA) escalate an Oracle performance problem after migrating from on-prem to the cloud.</p>\n<p><a href=\"http://www.oaktable.net/content/unreal-load-testing-cloud\" target=\"_blank\">read more</a></p>",
        "Unreal Load Testing in the Cloud"
      ]
    ]
  ]
]
```
