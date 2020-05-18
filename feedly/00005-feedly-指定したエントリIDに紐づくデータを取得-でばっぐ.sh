#!/usr/bin/env bash

ACCESS_TOKEN='Az6Z1otyyLYuf1ZJIzXsQF_kaAL2gUK6CuoRsg-E-N5SmQx-04AAchQ5KPEo7LnRYLnlYMul9U2ZHLiXYMEPMQtXmSsFPE7ZoGeyFTh8U1074TkwDCNN6zmrscebrdg6IQ9DmE7tK3a2JbnyCdKr9DP94Hqmj3sbMppDa1GHGGDD_CeNBPU8S1PDpff1sHG2gQA3aeYCyCYWCR1NuLUU-W95RWnZuMu025nsoLLY7lw:feedly'

ENTRY_ID='2tM1DedEr6eqgdqJ8X4sP%2BCS3BVG%2FbkK4hS45ZnKnRQ%3D_17221224a77%3A27f5929%3A2781a54f'

curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://cloud.feedly.com/v3/entries/$ENTRY_ID" | jq --stream -c '' | \
  grep -P 'href|title|url' | grep -vP 'content|origin' | jq -sc '{title:.[0][1],url:.[1][1],url1:.[2][1]}'
