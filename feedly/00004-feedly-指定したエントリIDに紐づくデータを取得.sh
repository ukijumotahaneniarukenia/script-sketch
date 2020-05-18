#!/usr/bin/env bash

ACCESS_TOKEN='Az6Z1otyyLYuf1ZJIzXsQF_kaAL2gUK6CuoRsg-E-N5SmQx-04AAchQ5KPEo7LnRYLnlYMul9U2ZHLiXYMEPMQtXmSsFPE7ZoGeyFTh8U1074TkwDCNN6zmrscebrdg6IQ9DmE7tK3a2JbnyCdKr9DP94Hqmj3sbMppDa1GHGGDD_CeNBPU8S1PDpff1sHG2gQA3aeYCyCYWCR1NuLUU-W95RWnZuMu025nsoLLY7lw:feedly'

#スラッシュのエスケープ

#= --> %3D
#
#/ --> %2F
#
#: --> %3A
#
#+ --> %2B

rm -f feedly.tsv

cat entry-id-list | jq -s -r 'flatten|.[]' | sed 's;=;%3D;g;s;/;%2F;g;s;:;%3A;g;s;+;%2B;g;' | \
while read ENTRY_ID;do
    curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://cloud.feedly.com/v3/entries/$ENTRY_ID"| jq --stream -c '' | grep -P 'canonicalUrl|title|href' | grep -vP 'content|origin' | \
      jq --arg entry_id $ENTRY_ID -s -r -c '{title:.[0][1],url:.[1][1],url1:.[2][1]}|[.title,.url,.url1,$entry_id]|@tsv' >>feedly.tsv
done

sed -i '1iタイトル\tURL\tURL1\tエントリID' feedly.tsv
