#/bin/bash

source $(pwd)/tool/ascii_code.sh
source /home/oracle/rr/func/clr/fgclr___@___.sh
source /home/oracle/rr/func/clr/bgclr___@___.sh
source /home/oracle/rr/func/util/deco___@___.sh
source /home/oracle/rr/func/util/deco_dyn_cmd.sh
source /home/oracle/rr/func/msg/msg_func.sh

_replace_ascii_to_space(){
  FILE_NM=$1
  fg_white "$(cat "${FILE_NM}")"
  POST_REPLACE_FILE=$(echo "" | awk '
  BEGIN{
    SPA="\'${SPA}'"
    LNF="\'${LNF}'"
  }
  {
    gsub(/\x21/,SPA)
    gsub(/\x22/,SPA)
    gsub(/\x23/,SPA)
    gsub(/\x5c\x24/,SPA)
    gsub(/\x25/,SPA)
    gsub(/\x26/,SPA)
    gsub(/\x27/,SPA)
    gsub(/\x5c\x28/,SPA)
    gsub(/\x29/,SPA)
    gsub(/\x2a/,SPA)
    gsub(/\x2b/,SPA)
    gsub(/\x2c/,SPA)
    gsub(/\x2d/,SPA)
    gsub(/\x5c\x2e/,SPA)
    gsub(/\x2f/,SPA)
    gsub(/\x3a/,SPA)
    gsub(/\x3b/,SPA)
    gsub(/\x3c/,SPA)
    gsub(/\x3d/,SPA)
    gsub(/\x3e/,SPA)
    gsub(/\x3f/,SPA)
    gsub(/\x40/,SPA)
    gsub(/\x5c\x5b/,SPA)
    gsub(/\x5c\x5c/,SPA)
    gsub(/\x5d/,SPA)
    gsub(/\x5c\x5e/,SPA)
    gsub(/\x60/,SPA)
    gsub(/\x5c\x7b/,SPA)
    gsub(/\x5c\x7c/,SPA)
    gsub(/\x7d/,SPA)
    gsub(/\x7e/,SPA)
    
    gsub(/\x20/,LNF)
    print
  }
  ' "${FILE_NM}"
  )
  echo "${POST_REPLACE_FILE}" > "${FILE_NM}"
  fg_yellow "$(cat "${FILE_NM}")"
  _fin_msg "${FUNCNAME}"
}
