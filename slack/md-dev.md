- https://api.slack.com/authentication/basics

- アプリ作成

  - Create New Appボタンを押下する
  - https://api.slack.com/apps

以下のように入力

|key|value|
|:-:|:-:|
|App Name|script-sketch-app|
|Development Slack Workspace|script-sketch|

- アプリに対する機能追加

  - https://api.slack.com/appsへ遷移

  - script-sketch-appを選択

  - Basic Information画面の左サイドバーのOAuth & Permissionsを選択

  - Bot Token Scopesでchannels:readとchat:write機能を追加

  - 追加後、Install Appボタンを押下する

- チャネルへのアプリ配備

  - 追加したいチャネルをブラウザで開き、ウィンドウトップのアプリを追加するボタンを押下

  - script-sketch-appを選択し、追加

- チャネルIDの取得

TOKENはscript-sketch-appのOAuth & PermissionsページのBot User OAuth Access Tokenに記載されているもの

```
$TOKEN=xoxb-XXXXXXX...


$ curl -s -F token=$TOKEN https://slack.com/api/conversations.list | jq -c '.channels|map({key:.id,value:.name})|.[]'
{"key":"C014YR3BC9L","value":"週次同期"}
{"key":"C014YR3BD6J","value":"チーム"}
{"key":"C0155H80926","value":"社内通知"}
{"key":"C0155P8UCLT","value":"ようこそ"}
{"key":"C015BNHM5MJ","value":"プロジェクト"}
{"key":"C015J65GBB3","value":"アイデア"}

```

チャネルにメッセージを投稿する

上記で取得したチャネルIDのうち、アプリを配備したIDを引数に指定する

```

$ curl -F token=$TOKEN -F channel=C015J65GBB3 -F text="モンティー パイソン" https://slack.com/api/chat.postMessage

```


- 参考
  - https://encr.jp/blog/posts/20200311_morning/
