#!/usr/bin/env bash

#消えない場合はこっちから
#https://getpocket.com/privacy_clear

CONSUMER_KEY=91461-689a3e2b1f64efd88ca3d1a6

ACCESS_TOKEN=32fb578c-ac37-53fe-6ba5-c57f4e

ITEM_ID=2341781628

curl -X POST "https://getpocket.com/v3/send?actions=%5B%7B%22action%22%3A%22delete%22%2C%22item_id%22%3A$ITEM_ID%7D%5D&access_token=$ACCESS_TOKEN&consumer_key=$CONSUMER_KEY"
