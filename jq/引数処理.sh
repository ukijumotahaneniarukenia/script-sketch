#!/bin/bash

#echo "$@"| sed 's;^;[";;s;$;"];;s; ;", ";g;' | jq --arg foo 123 -c '
#$foo
#'

#[sqlite🖤ceacf3fb0808 (火 11月 19 23:19:44) ~/script_scratch/jq]$./引数処理.sh {a..e}
#bash -c echo 4 | jq --arg rsv_args "a b c d e" -c "\$rsv_args" 
#"a b c d e"

#echo 4 | jq --arg rsv_args "$(echo "$@"| sed 's;^;[";;s;$;"];;s; ;", ";g;')" -c '$rsv_args'
#echo 4 | jq --arg rsv_args "$(echo "$@")" -c '$rsv_args'
#echo {a..e} | xargs -t -I@ bash -c 'echo 4 | jq --arg rsv_args "@" -c "\$rsv_args"'
#echo {a..e} | xargs -I@ bash -c 'echo 4 | jq --arg rsv_args "@" -c "\$rsv_args"'

#echo 4 | jq --arg rsv_args 5 -c '.|$rsv_args|type'
#
#echo 4 | jq --arg rsv_args 5 -c '.|$rsv_args'
#
#echo 4 | jq --arg rsv_args 5 -c '.|type'
#
#echo 4 | jq --arg rsv_args 5 -c '.'

#echo 4 | jq --arg rsv_args "5" -c '
#  def add(x;y): x+y;
#  . as $via_pipe_args | $rsv_args|tonumber as $via_cmdline_args
#  |add($via_pipe_args;$via_cmdline_args)
#  '

#echo 4 | jq --arg rsv_args "5" -c '
#  def add(x;y): x+y;
#  def minus(x;y): x-y;
#  def mod(x;y): x/y;
#  def multi(x;y): x*y;
#  def printf(x;y;z;zz): (x|tostring)+z+(y|tostring)+"="+(zz|tostring);
#  . as $via_pipe_args | $rsv_args|tonumber as $via_cmdline_args
#  |add($via_pipe_args;$via_cmdline_args) as $rt_add
#  |minus($via_pipe_args;$via_cmdline_args) as $rt_minus
#  |mod($via_pipe_args;$via_cmdline_args) as $rt_mod
#  |multi($via_pipe_args;$via_cmdline_args) as $rt_multi
#  |printf($via_pipe_args;$via_cmdline_args;"+";$rt_add)
#  |printf($via_pipe_args;$via_cmdline_args;"+";$rt_add)
#  '
#echo 4 | jq --arg rsv_args "5" -c '
#  def add(x;y): x+y;
#  def minus(x;y): x-y;
#  def mod(x;y): x/y;
#  def multi(x;y): x*y;
#  def printf(x;y;z;zz): (x|tostring)+z+(y|tostring)+"="+(zz|tostring);
#  . as $via_pipe_args | $rsv_args|tonumber as $via_cmdline_args
#  |["add","minus","mod","multi"] as $tgt
#  |foreach $tgt[] as $ope("";$ope+"($via_pipe_args;$via_cmdline_args) as $rt_"+$ope+"\n"
#)
#  '
  #+"printf($via_pipe_args;$via_cmdline_args;+$rt_"+$ope))

echo 4 | jq --arg rsv_args "5" -c '
  def add(x;y): x+y;
  def printf(x;y;z;zz): (x|tostring)+z+(y|tostring)+"="+(zz|tostring);
  . as $via_pipe_args | $rsv_args|tonumber as $via_cmdline_args
  |add($via_pipe_args;$via_cmdline_args) as $rt
  |printf($via_pipe_args;$via_cmdline_args;"+";$rt)
  '
