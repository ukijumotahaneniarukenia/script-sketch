#!/usr/bin/env bash

echo "$@" | jq -c '
    .|length as $cnt
    |. as $rsv_args
    |[range(1;$cnt+1)]
    |foreach .[] as $ind(
      [];
      $rsv_args[$ind:]+$rsv_args[:$ind]
    )
  '
