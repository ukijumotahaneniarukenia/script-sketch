この手順はやりなおしができる

# Step 0:ローカルホストでHTTPサーバたてる

dockerで作成。リダイレクト先を自前で準備

- 以下のURLにブラウザからアクセスしてTesting 123..のレスポンスページが表示されたらOK
  - http://localhost:8080


# Step 1: Obtain a platform consumer key


以下のページからコンシューマーキーを取得する
- https://getpocket.com/developer/apps/new

Create an Application

以下の通り入力する
|key|value|
|:-:|:-:|
|Application Name|test|
|Application Description|test|
|Permissions-Add|check|
|Permissions-Modify|check|
|Permissions-Retreive|check|
|Platforms-Web|check|

最後にチェック
I accept the Terms of Service.

画面遷移先にアプリケーション単位でコンシューマーキーが作成されるので、
控えておく

# Step 2: Obtain a request token

dockerコンテナ側から実行

リクエストトークンを取得する

```
curl -X POST -F "consumer_key=89770-372ba6d8a571aa0ecc82d71a" -F "redirect_uri=http://localhost:8080/" https://getpocket.com/v3/oauth/request
```

dockerコンテナ側から実行

keyがcodeのvalue値がリクエストトークン

```
$curl -X POST -F "consumer_key=89770-372ba6d8a571aa0ecc82d71a" -F "redirect_uri=http://localhost:8080/" https://getpocket.com/v3/oauth/request
code=b649c90d-0ad8-91ba-1ab1-4a9480
```

# Step 3: Redirect user to Pocket to continue authorization

自身のデータを操作するためにアプリケーションを作成したが、
そのアプリケーション単位での操作を許可するために、以下のコマンドを実行

表示されたページで、本人であることを確認し、認可ボタンをおす

xdg-openコマンドがありかつX環境があるコンテナの場合、dockerコンテナ側から実行可能

コマンドラインから実行
```
xdg-open https://getpocket.com/auth/authorize?request_token=b649c90d-0ad8-91ba-1ab1-4a9480&redirect_uri=http://localhost:8080/
```

dockerホスト側から実行

ブラウザからアクセス
```
https://getpocket.com/auth/authorize?request_token=b649c90d-0ad8-91ba-1ab1-4a9480&redirect_uri=http://localhost:8080/
```

# Step 4: Receive the callback from Pocket

リダイレクト画面が表示されたらOK
今回の場合はTesting 123..のレスポンスページが表示されたらOK


# Step 5: Convert a request token into a Pocket access token

Step1のコンシューマキーとStep2のリクエストトークンを引数に渡して以下のコマンドを実行

dockerコンテナ側から実行

コマンドラインから実行
```
curl -X POST -F "consumer_key=89770-372ba6d8a571aa0ecc82d71a" -F "code=b649c90d-0ad8-91ba-1ab1-4a9480" https://getpocket.com/v3/oauth/authorize
```

アクセストークンが取得できる

```
$curl -X POST -F "consumer_key=89770-372ba6d8a571aa0ecc82d71a" -F "code=b649c90d-0ad8-91ba-1ab1-4a9480" https://getpocket.com/v3/oauth/authorize
access_token=9f03752d-2133-f72d-312d-869305&username=mrchildrenkh1008%40gmail.com
```

# Step 6: Make authenticated requests to Pocket

取得
- https://getpocket.com/developer/docs/v3/retrieve

追加
- https://getpocket.com/developer/docs/v3/add

更新・削除
- https://getpocket.com/developer/docs/v3/modify


Step5のアクセストークンを引数に渡してポケットAPIの規約に従い、コマンドを実行。

dockerコンテナ側から実行

dockerホストがプロキシサーバーとして振舞っているから

以下の例は全件fetch
```
curl -X POST -F "consumer_key=89770-372ba6d8a571aa0ecc82d71a" -F "access_token=9f03752d-2133-f72d-312d-869305" https://getpocket.com/v3/get
```

3MBくらいあるんだ。。
```
apache@a5861ea7d7b3 ~$ll -lh a
-rw-rw-r--. 1 apache apache 3.1M  2月  9 13:19 a
```

# Step 7:jqコマンドで確認

```
apache@a5861ea7d7b3 ~$cat a | jq | head -n30
{
  "status": 1,
  "complete": 1,
  "list": {
    "1329105271": {
      "item_id": "1329105271",
      "resolved_id": "1329105271",
      "given_url": "http://javatechnology.net/other/pocket-api-oauth2-0/",
      "given_title": "",
      "favorite": "0",
      "status": "0",
      "time_added": "1581069839",
      "time_updated": "1581069840",
      "time_read": "0",
      "time_favorited": "0",
      "sort_id": 0,
      "resolved_title": "Pocket APIを使ってOAuth2.0を理解する。",
      "resolved_url": "http://javatechnology.net/other/pocket-api-oauth2-0/",
      "excerpt": "TwitterやFacebookはもちろん、有名なWebサービスには開発用APIが用意されています。このAPIを使って世界中の開発者は自分のアプリとWebサービスをつなげることができます。",
      "is_article": "0",
      "is_index": "0",
      "has_video": "0",
      "has_image": "0",
      "word_count": "971",
      "lang": "ja",
      "top_image_url": "https://i1.wp.com/javatechnology.net/wp-content/uploads/pocket-authorize-9.png?fit=1103%2C282",
      "listen_duration_estimate": 376
    },
    "1815454726": {
      "item_id": "1815454726",
apache@a5861ea7d7b3 ~$cat a | jq | tail -n30
      "status": "0",
      "time_added": "1544326036",
      "time_updated": "1544326036",
      "time_read": "0",
      "time_favorited": "0",
      "sort_id": 2672,
      "resolved_title": "Pocket の旅が今始まります。最大限活用しましょう。",
      "resolved_url": "https://medium.com/@Pocket/pocket-%E3%81%AE%E6%97%85%E3%81%8C%E4%BB%8A%E5%A7%8B%E3%81%BE%E3%82%8A%E3%81%BE%E3%81%99-%E6%9C%80%E5%A4%A7%E9%99%90%E6%B4%BB%E7%94%A8%E3%81%97%E3%81%BE%E3%81%97%E3%82%87%E3%81%86-bd0cb5a0a637",
      "excerpt": "Pocket の旅が今始まります。最大限活用しましょう。Pocket へようこそ。あなたは今、オンラインで見つけた膨大な情報を知識へと変える旅に出ようとしています。Pocket と一緒なら、喜びや楽しみ、自己形成へとつながる素晴",
      "is_article": "1",
      "is_index": "0",
      "has_video": "0",
      "has_image": "1",
      "word_count": "477",
      "lang": "ja",
      "top_image_url": "https://miro.medium.com/max/1200/1*hKCxwuSJWmmAGa4bVi_V7Q.png",
      "domain_metadata": {
        "name": "Medium",
        "logo": "https://logo.clearbit.com/medium.com?size=800",
        "greyscale_logo": "https://logo.clearbit.com/medium.com?size=800&greyscale=true"
      },
      "listen_duration_estimate": 185
    }
  },
  "error": null,
  "search_meta": {
    "search_type": "normal"
  },
  "since": 1581221944
}
```


# Step 99:取得結果を保存し、アプリケーションを削除

以下のURLからStep1で作成したアプリケーションを削除しておく

- https://getpocket.com/developer/apps/
