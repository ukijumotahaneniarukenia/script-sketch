#!/usr/bin/env bash

MX_TAG_CNT=10

ACCESS_TOKEN="7cf0135d6eedcd5579dae554d14ae2383447115f"
USER_ID="ukijumotahaneniarukenia"

curl -s -H "Authorization: Bearer $ACCESS_TOKEN" https://qiita.com/api/v2/users/$USER_ID/stocks?page=1\&per_page=2 | gron | \
  grep -vP 'body' | \
  grep -P 'json\[[0-9]{1,}\]\.(id|user\.id|tags\[[0-9]{1,}\]\.name|title|updated_at)'>in
