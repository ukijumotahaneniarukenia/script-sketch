#!/bin/bash

#echo {a..e} | sed 's;^;[";;s;$;"];;s; ;", ";g;' | jq -c '
#  . as $rsv_args
#  |foreach .[] as $ele(
#    [];
#    $rsv_args
#  )
#'

#echo {a..e} | sed 's;^;[";;s;$;"];;s; ;", ";g;' | jq -c '
#  . as $rsv_args
#  |foreach .[] as $ele(
#    [];
#    $rsv_args[0:]
#  )
#'

#後ろから１つ
#echo {a..e} | sed 's;^;[";;s;$;"];;s; ;", ";g;' | jq -c '
#  . as $rsv_args
#  |foreach .[] as $ele(
#    [];
#    $rsv_args[-1:]
#  )
#'

#後ろから２つ
#echo {a..e} | sed 's;^;[";;s;$;"];;s; ;", ";g;' | jq -c '
#  . as $rsv_args
#  |foreach .[] as $ele(
#    [];
#    $rsv_args[-2:]
#  )
#'

#まえから３つ
#echo {a..e} | sed 's;^;[";;s;$;"];;s; ;", ";g;' | jq -c '
#  . as $rsv_args
#  |foreach .[] as $ele(
#    [];
#    $rsv_args[:-2]
#  )
#'

#まえから３つ
#echo {a..e} | sed 's;^;[";;s;$;"];;s; ;", ";g;' | jq -c '
#  . as $rsv_args
#  |foreach .[] as $ele(
#    [];
#    $rsv_args[0:3]
#  )
#'

#まえから４つ
#echo {a..e} | sed 's;^;[";;s;$;"];;s; ;", ";g;' | jq -c '
#  . as $rsv_args
#  |foreach .[] as $ele(
#    [];
#    #$rsv_args[-1:]+$rsv_args[:-1]
#    #$rsv_args[-2:]+$rsv_args[:-2]
#    $rsv_args[-5:]+$rsv_args[:-5]
#  )
#'
echo {a..e} | sed 's;^;[";;s;$;"];;s; ;", ";g;' | jq -c '
  .|length as $cnt
  |. as $rsv_args
  |[range(1;$cnt+1)]
  |foreach .[] as $ind(
    [];
    $rsv_args[-$ind:]+$rsv_args[:-$ind]
  )
'
