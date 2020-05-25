# 参考文献

- https://qiita.com/kawaz/items/5f03dde3c219bdbffc3b

- https://developer.feedly.com/v3/auth/


# Step 0:ローカルホストでHTTPサーバたてる

dockerで作成。リダイレクト先を自前で準備

```
$sudo /usr/sbin/httpd
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.3. Set the 'ServerName' directive globally to suppress this message
$ps uax
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
apache       1  0.0  0.0  14380  2004 pts/0    Ss+  15:12   0:00 /bin/bash
apache      18  0.0  0.0  14380  2020 pts/1    Ss   15:12   0:00 /bin/bash
root        40  0.0  0.0 224064  3444 ?        Ss   15:14   0:00 /usr/sbin/httpd
apache      41  0.0  0.0 224064  2936 ?        S    15:14   0:00 /usr/sbin/httpd
apache      42  0.0  0.0 224064  2936 ?        S    15:14   0:00 /usr/sbin/httpd
apache      43  0.0  0.0 224064  2936 ?        S    15:14   0:00 /usr/sbin/httpd
apache      44  0.0  0.0 224064  2936 ?        S    15:14   0:00 /usr/sbin/httpd
apache      45  0.0  0.0 224064  2936 ?        S    15:14   0:00 /usr/sbin/httpd
apache      46  0.0  0.0  54304  1864 pts/1    R+   15:14   0:00 ps uax
```

- 以下のURLにブラウザからアクセスしてTesting 123..のレスポンスページが表示されたらOK
  - http://localhost:8080


# Step 1:リクエストトークンを取得

以下のURLをアドレスバーに入力してEnter

```
https://cloud.feedly.com/v3/auth/auth?client_id=feedly&redirect_uri=http://localhost:8080&scope=https://cloud.feedly.com/subscriptions&response_type=code&provider=google&migrate=false
```

リダイレクト先ページのアドレスバーにcodeパラメータがついてくる。これがリクエストトークン。

```
http://localhost:8080/?code=A6MEWT94_PQGbnQj4sTKhUyd8dGOSUEtUZKTH8175OrBb9_kQes6ESyETETYykQSb6d1qhOIokrH62zAcUJ-RsZIiCF8QTPKAlmof25oAwWaESSDO1ifASc7rukGsLkgfAfwdADX-IbsQMn7K7hxJFRSsdrGwrQ0de5pFeGALI99FcKPrSs54Lfy&state=
```


# Step 2:アクセストークンを取得

コマンドラインから以下のコマンドを実行。jsonデータを整形するためにjqコマンドの標準入力に渡す。
```
curl -s -d 'client_id=feedly&client_secret=0XP4XQ07VVMDWBKUHTJM4WUQ&grant_type=authorization_code&redirect_uri=http%3A%2F%2Fwww.feedly.com%2Ffeedly.html&code=XXX' https://cloud.feedly.com/v3/auth/token | jq
```

アクセストークンが取得できた

access_token->ACCESS_TOKEN

```
{
  "plan": "standard",
  "provider": "Google",
  "id": "26c34d27-f858-40be-89a3-527fa5cb76ef",
  "state": "",
  "scope": "https://cloud.feedly.com/subscriptions",
  "token_type": "bearer",
  "access_token": "A9pkpfplWP7jE2LphCjPK9xGpsVV4LalMSv9yBAVN8fk4FvR0qfvbAuQJrvn7ZhafJj4fyN_ZTyfC6edKRQpmHOqYx0gMPmGojHeMOc3PoOXdd1P_t3sx4piQPyBFAaITqzwOSxK-e9w7XN9mLo4WE3OALLiarVqMSgTIOPhwLuu4Z5OPqodfKTdnSqJTs9tHv4AslNBa7PJFZrF5mNe8JkVUe1h0yvOCCHFvRetevCz3g:feedly",
  "expires_in": 604800,
  "refresh_token": "A8NqOi33Auz8bkapaHqqd9C3AyspjK43VIMeDZNZr9qYuA0X8hoc3N7ZQIigxVXuEFHcCxJTl6VEkNXy0Y-MfLMtdcyYIR1DHIE1NQqfnZbkK3hZbV2rdqIw1_ZHFK8X_HMPSwZ6_KnUCBu-daAzWL2VMoT8W-y1IlthAhKO4zGPglNU76t--A_dnqF8y2MwVBu-MtY95s9wxAYfigZpj8L8e_EXoY8ku3PO8-BcvakzcozwmhixAA:feedly"
}
```

# Step 3: FeedlyのAPI規約に従い、いろいろ取得


- https://developer.feedly.com/v3/

ACCESS_TOKENはStep2で取得した値で置換

プロファイル取得
```
curl -s -H 'Authorization: Bearer ACCESS_TOKEN' https://cloud.feedly.com/v3/profile
```

マーカー取得

ストリーム

```
curl -s -H 'Authorization: Bearer ACCESS_TOKEN' https://cloud.feedly.com/v3/markers/counts
```

idがストリームID

タグみたいなもの

プログラミングタグおおいな9859件


```
$curl -s -H 'Authorization: Bearer A9pkpfplWP7jE2LphCjPK9xGpsVV4LalMSv9yBAVN8fk4FvR0qfvbAuQJrvn7ZhafJj4fyN_ZTyfC6edKRQpmHOqYx0gMPmGojHeMOc3PoOXdd1P_t3sx4piQPyBFAaITqzwOSxK-e9w7XN9mLo4WE3OALLiarVqMSgTIOPhwLuu4Z5OPqodfKTdnSqJTs9tHv4AslNBa7PJFZrF5mNe8JkVUe1h0yvOCCHFvRetevCz3g:feedly' https://cloud.feedly.com/v3/markers/counts | jq | head -n30
{
  "unreadcounts": [
    {
      "id": "feed/http://tmtms.hatenablog.com/feed",
      "count": 2,
      "updated": 1580144709449
    },
    {
      "id": "feed/http://databaseperformance.blogspot.com/feeds/posts/default",
      "count": 0,
      "updated": 1547900613433
    },
    {
      "id": "feed/https://wemo.tech/feed",
      "count": 0,
      "updated": 1578294505333
    },
    {
      "id": "feed/http://www.glamenv-septzen.net/index.php?mdl=rss&mode=rdf",
      "count": 0,
      "updated": 1557107832914
    },
    {
      "id": "feed/https://suboptimalplan.wordpress.com/feed/",
      "count": 0,
      "updated": 1429151762000
    },
    {
      "id": "feed/https://sqlmaria.com/feed/",
      "count": 0,


$curl -s -H 'Authorization: Bearer A9pkpfplWP7jE2LphCjPK9xGpsVV4LalMSv9yBAVN8fk4FvR0qfvbAuQJrvn7ZhafJj4fyN_ZTyfC6edKRQpmHOqYx0gMPmGojHeMOc3PoOXdd1P_t3sx4piQPyBFAaITqzwOSxK-e9w7XN9mLo4WE3OALLiarVqMSgTIOPhwLuu4Z5OPqodfKTdnSqJTs9tHv4AslNBa7PJFZrF5mNe8JkVUe1h0yvOCCHFvRetevCz3g:feedly' https://cloud.feedly.com/v3/markers/counts | jq | tail -n30
      "updated": 1580469405446
    },
    {
      "id": "feed/http://rss.itmedia.co.jp/rss/1.0/plusd.xml",
      "count": 346,
      "updated": 1581175626948
    },
    {
      "id": "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/global.must",
      "count": 4,
      "updated": 1581042284929
    },
    {
      "id": "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
      "count": 9859,
      "updated": 1581227395722
    },
    {
      "id": "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/global.uncategorized",
      "count": 0,
      "updated": 1577779136018
    },
    {
      "id": "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/global.all",
      "count": 9859,
      "updated": 1581227395722
    }
  ],
  "updated": 1581227395722
}
```

ストリームコンテンツ取得

STREAM_IDのスラッシュはURLエンコードする

```
/→%2F
```

```
curl -s -H 'Authorization: Bearer ACCESS_TOKEN' https://cloud.feedly.com/v3/streams/STREAM_ID/contents?count=2
```

修正前
```
user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/global.all
```

修正後
```
user%2F26c34d27-f858-40be-89a3-527fa5cb76ef%2Fcategory%2Fglobal.all
```
