#!/bin/bash

_fin_msg(){
  STR="$1"
  ( [ -z "${STR}" ] || [ "${#STR}" -eq 0 ] ) && return 1
  fg_cyan "$(printf "FINISHED--->%s\n" ${STR})"
}

_warn_msg(){
  STR="$1"
  ( [ -z "${STR}" ] || [ "${#STR}" -eq 0 ] ) && return 1
  fg_yellow "WARNING!--->${STR}"
}

_err_msg(){
  STR="$1"
  ( [ -z "${STR}" ] || [ "${#STR}" -eq 0 ] ) && return 1
  fg_red "ERROR!--->${STR}"
}

_info_msg(){
  STR="$1"
  ( [ -z "${STR}" ] || [ "${#STR}" -eq 0 ] ) && return 1
  fg_green "INFO--->${STR}"
}
