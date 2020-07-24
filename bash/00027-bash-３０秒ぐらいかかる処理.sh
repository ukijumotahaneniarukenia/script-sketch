#!/usr/bin/env bash

#標準出力に出力するような処理はだめ、どうしても必要やったら、ファイルにリダイレクト
#sleep 0.5 #なにか時間の掛かりそうな処理

#10メガ書き込む
cat /dev/urandom | dd bs=1M count=100 1>stdout.log 2>stderr.log #なにか時間の掛かりそうな処理
