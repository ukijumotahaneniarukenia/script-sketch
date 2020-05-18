#!/usr/bin/env bash

CONSUMER_KEY=91461-689a3e2b1f64efd88ca3d1a6

ACCESS_TOKEN=32fb578c-ac37-53fe-6ba5-c57f4e

curl -X POST -F "consumer_key=$CONSUMER_KEY" -F "access_token=$ACCESS_TOKEN" https://getpocket.com/v3/get
