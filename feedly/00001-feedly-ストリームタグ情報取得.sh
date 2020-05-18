#!/usr/bin/env bash

ACCESS_TOKEN='Az6Z1otyyLYuf1ZJIzXsQF_kaAL2gUK6CuoRsg-E-N5SmQx-04AAchQ5KPEo7LnRYLnlYMul9U2ZHLiXYMEPMQtXmSsFPE7ZoGeyFTh8U1074TkwDCNN6zmrscebrdg6IQ9DmE7tK3a2JbnyCdKr9DP94Hqmj3sbMppDa1GHGGDD_CeNBPU8S1PDpff1sHG2gQA3aeYCyCYWCR1NuLUU-W95RWnZuMu025nsoLLY7lw:feedly'


curl -s -H "Authorization: Bearer $ACCESS_TOKEN" https://cloud.feedly.com/v3/markers/counts | jq
