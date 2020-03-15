#!/bin/bash

NORMAL=$(tput sgr0)
FG_GREEN=$(tput setaf 2)
FG_YELLOW=$(tput setaf 3)
FG_CYAN=$(tput setaf 6)
FG_WHITE=$(tput setaf 7)

fg_green(){
  echo -ne "${FG_GREEN}$*${NORMAL}"
}

fg_yellow(){
  echo -ne "${FG_YELLOW}$*${NORMAL}"
}

fg_white(){
  echo -ne "${FG_WHITE}$*${NORMAL}"
}

fg_cyan(){
  echo -ne "${FG_CYAN}$*${NORMAL}"
}

info_msg(){
  local STR="$1"
  _fg_green "$(printf "INFO--->%s\n" ${STR})"
}

err_msg(){
  local STR="$1"
  _fg_cyan "$(printf "ERROR!--->%s\n" ${STR})"
}
