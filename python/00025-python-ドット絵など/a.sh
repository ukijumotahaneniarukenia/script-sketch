#!/usr/bin/env bash

#https://qiita.com/x-color/items/ce4fe4e5e2ae07974549

LFT_VERTICAL=2807
LFT_CORNER=280b
UPPER_HORIZONTAL=2819
RGT_CORNER=2838
RGT_VERTICAL=2834
LOWER_HORIZONTAL=2826

MESSAGE=" loading.."
SLEEP_TIME=0.2

while :
do
    printf "\e[32m\r\u$LFT_VERTICAL\e[0m $MESSAGE"
    sleep $SLEEP_TIME
    printf "\e[32m\r\u$LFT_CORNER\e[0m $MESSAGE"
    sleep $SLEEP_TIME
    printf "\e[32m\r\u$UPPER_HORIZONTAL\e[0m $MESSAGE"
    sleep $SLEEP_TIME
    printf "\e[32m\r\u$RGT_CORNER\e[0m $MESSAGE"
    sleep $SLEEP_TIME
    printf "\e[32m\r\u$RGT_VERTICAL\e[0m $MESSAGE"
    sleep $SLEEP_TIME
    printf "\e[32m\r\u$LOWER_HORIZONTAL\e[0m $MESSAGE"
    sleep $SLEEP_TIME
done
