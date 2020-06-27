#!/usr/bin/env bash

ls -l | grep -vP '^d' | awk '{print $9}' | grep -P '^[0-9]{5}-' | awk -F '-' '{print $1,$0}' | \

  while read SUFFIX FILE_NAME;do

    IS_EXISTS=$(echo $SUFFIX | grep -P "$(cat bunrui | awk -F'-' '{print $1}' | xargs | tr ' ' '|')")

    if [ -n $IS_EXISTS ];then
      #マッチした場合

      echo git mv

      echo $FILE_NAME

      cat bunrui | grep $IS_EXISTS #ディレクトリ名の取得

    fi

  done | xargs -n4
