#!/usr/bin/env bash

ACCESS_TOKEN='Az6Z1otyyLYuf1ZJIzXsQF_kaAL2gUK6CuoRsg-E-N5SmQx-04AAchQ5KPEo7LnRYLnlYMul9U2ZHLiXYMEPMQtXmSsFPE7ZoGeyFTh8U1074TkwDCNN6zmrscebrdg6IQ9DmE7tK3a2JbnyCdKr9DP94Hqmj3sbMppDa1GHGGDD_CeNBPU8S1PDpff1sHG2gQA3aeYCyCYWCR1NuLUU-W95RWnZuMu025nsoLLY7lw:feedly'

DEFAULT_STREAM_ID=user%2F26c34d27-f858-40be-89a3-527fa5cb76ef%2Fcategory%2FProgramming

STREAM_ID=$1;shift

if [ -z $STREAM_ID ];then
  :
else
  DEFAULT_STREAM_ID=$STREAM_ID
fi

#初回
curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://cloud.feedly.com/v3/streams/$DEFAULT_STREAM_ID/ids" | jq -r '.ids' >>entry-id-list

CONTINUATION_ID=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://cloud.feedly.com/v3/streams/$DEFAULT_STREAM_ID/ids" | jq -r '.continuation')

rm -f entry-id-list

cnt=1

echo $cnt

while [ -n $CONTINUATION_ID ]
do
  cnt=$(( $cnt + 1 ))
  echo $cnt
  #初回以外
  curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://cloud.feedly.com/v3/streams/$DEFAULT_STREAM_ID/ids?continuation=$CONTINUATION_ID" | jq -r '.ids' >>entry-id-list
  CONTINUATION_ID=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://cloud.feedly.com/v3/streams/$DEFAULT_STREAM_ID/ids?continuation=$CONTINUATION_ID" | jq -r '.continuation')
  sleep 0.5
done
