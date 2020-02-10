#/bin/bash

source $(pwd)/tool/ascii_code.sh
source /home/oracle/rr/func/clr/fgclr___@___.sh
source /home/oracle/rr/func/clr/bgclr___@___.sh
source /home/oracle/rr/func/msg/msg___@___.sh

_replace_ascii_to_code(){
  PRE_FILE=$1
  #fg_yellow "${PRE_FILE}"
  #fg_white "$(cat "${PRE_FILE}")"
  #POST_FILE=$(awk '
  echo "" | awk '
  function _exec_cmd(CMD){
    system(CMD)
  }
  BEGIN{
    #PATH="/home/oracle/rr/func/util/awk_func_def.sh"
    PATH="/home/oracle/rr/func/util/awk_func_def.sh"
    print PATH
    CMD = sprintf("source %s",PATH);
    #CMD = sprintf("awk -f %s",PATH);
    REZ=_exec_cmd(CMD) 
    close(CMD)
    #REZ
  }
  {
    #_clr("########################################",30);
  }
  #{
  #  gsub(/\x20/,"\\x20")
  #  #gsub(/\x21/,ECM)
  #  gsub(/\x22/,"\\x22")
  #  #gsub(/\x23/,NSG)
  #  gsub(/\x5c\x24/,"\\x24")
  #  #gsub(/\x25/,PCT)
  #  #gsub(/\x26/,AMP)
  #  #gsub(/\x27/,SQT)
  #  gsub(/\x5c\x28/,"\\x28")
  #  gsub(/\x5c\x29/,"\\x29")
  #  #gsub(/\x2a/,AST)
  #  #gsub(/\x2b/,PLS)
  #  #gsub(/\x2c/,CNM)
  #  #gsub(/\x2d/,PYN)
  #  #gsub(/\x5c\x2e/,DOT)
  #  #gsub(/\x2f/,SLS)
  #  #gsub(/\x3a/,CLN)
  #  #gsub(/\x3b/,SCN)
  #  #gsub(/\x3c/,LTS)
  #  #gsub(/\x3d/,EQL)
  #  #gsub(/\x3e/,GTS)
  #  #gsub(/\x3f/,QES)
  #  #gsub(/\x40/,ATM)
  #  gsub(/\x5c\x5b/,"\x5c\\x5b")
  #  #gsub(/\x5c/,BSL)
  #  #gsub(/\x5d/,RSB)
  #  #gsub(/\x5c\x5e/,CLT)
  #  #gsub(/\x5f/,USC)
  #  #gsub(/\x60/,BQT)
  #  gsub(/\x7b/,"\\x7b")
  #  #gsub(/\x5c\x7c/,VTB)
  #  gsub(/\x7d/,"\\x7d")
  #  #gsub(/\x7e/,TLD)
  #  print
  #}
  ' #"${PRE_FILE}"
  #fg_yellow "${POST_FILE}"
  _fin_msg "${FUNCNAME}"
}

_replace_ascii_to_code "$@"
