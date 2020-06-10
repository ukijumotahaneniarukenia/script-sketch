- https://api.slack.com/web

- アプリ作成

  - https://api.slack.com/apps


以下のように入力

|key|value|
|:-:|:-:|
|App Name|script-sketch-app|
|Development Slack Workspace|script-sketch|


機能追加で
以下のように設定

|key|value|
|:-:|:-:|
|Incoming Webhooks|ON|

設定後、「Add New Webhook to Workspace」ボタンを押下




アプリが投稿できるチャネル先を選択

今回は #アイデアを選択し、許可するボタンを押下

以下で投稿できるようになった

```
curl -X POST -H 'Content-type: application/json' --data '{"text":"Hello, World!"}' $WEBHOOKURL
```


OAuth認証などは

Basic InformationページでクライアントIDやクライアント秘密鍵を確認できる



