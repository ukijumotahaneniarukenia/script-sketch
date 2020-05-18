#!/usr/bin/env bash

CONSUMER_KEY=91461-689a3e2b1f64efd88ca3d1a6

REQUEST_TOKEN=$(curl -sSL -X POST -F "consumer_key=$CONSUMER_KEY" -F "redirect_uri=http://localhost:8080/" https://getpocket.com/v3/oauth/request|sed 's/.*=//')

#標準出力に出力されたURLをブラウザのURLアドレスバーに入力し、認可ボタンを押下後、リダイレクト先のapacheのテストページが表示されたらOK
#ここはseleniumで自動化したい
echo "https://getpocket.com/auth/authorize?request_token=$REQUEST_TOKEN&redirect_uri=http://localhost:8080/"

curl -X POST -F "consumer_key=$CONSUMER_KEY" -F "code=$REQUEST_TOKEN" https://getpocket.com/v3/oauth/authorize
