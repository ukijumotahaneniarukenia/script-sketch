#!/bin/bash

_exec_cmd_on_clr_red(){
  while read CMD;do
    fg_red "$(eval ${CMD})"
  done < <(cat $(pwd)/main/oput/mk_dynamic_cmd)
}

_exec_cmd_on_clr_green(){
  while read CMD;do
    fg_green "$(eval ${CMD})"
  done < <(cat $(pwd)/main/oput/mk_dynamic_cmd)
}

_exec_cmd_on_clr_yellow(){
  while read CMD;do
    fg_yellow "$(eval ${CMD})"
  done < <(cat $(pwd)/main/oput/mk_dynamic_cmd)
}

_exec_cmd_on_clr_blue(){
  while read CMD;do
    fg_blue "$(eval ${CMD})"
  done < <(cat $(pwd)/main/oput/mk_dynamic_cmd)
}

_exec_cmd_on_clr_magenta(){
  while read CMD;do
    fg_magenta "$(eval ${CMD})"
  done < <(cat $(pwd)/main/oput/mk_dynamic_cmd)
}

_exec_cmd_on_clr_cyan(){
  while read CMD;do
    fg_cyan "$(eval ${CMD})"
  done < <(cat $(pwd)/main/oput/mk_dynamic_cmd)
}

_exec_cmd_on_clr_white(){
  while read CMD;do
    fg_white "$(eval ${CMD})"
  done < <(cat $(pwd)/main/oput/mk_dynamic_cmd)
}
