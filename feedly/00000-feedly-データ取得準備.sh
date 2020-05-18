#!/usr/bin/env bash

#ブラウザのアドレスバーより取得(codeキーの値に当たるもの)
REQUEST_TOKEN='A23xFo2c8lBy-KTAHneQ-cpjhJWC3JOIyk9ITyDXlBb1UByFu08H3KRoP2Axos5PuXwhMGYhNQdTMdvPDEik-z3XWFnbCHUzEw1iqf28l4CzK7Ngqp2TBIbw7eG9BF5eHXFl-AX-I9tZk768Ov20zMsszwk-Gr6LRs95OUIrIjRuF0XGs-B9-85M&state='

curl -s -d "client_id=feedly&client_secret=0XP4XQ07VVMDWBKUHTJM4WUQ&grant_type=authorization_code&redirect_uri=http%3A%2F%2Fwww.feedly.com%2Ffeedly.html&code=$REQUEST_TOKEN" https://cloud.feedly.com/v3/auth/token | jq
