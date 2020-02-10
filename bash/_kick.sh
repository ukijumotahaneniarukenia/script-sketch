#!/bin/bash

_include_def(){
  while read f;do
    source ${f};
  done < <(find $(pwd)/func/{exe,clr} -type f -name "*")
  while read f;do
    source ${f};
  done < <(find $(pwd)/main/make -type f -name "*")
  while read f;do
    source ${f};
  done < <(find $(pwd)/util -type f -name "*")
}
_include_def

#------------------------------------------------------------------------
#_lpd

#------------------------------------------------------------------------

#_cmd_main_clean
#_mk_pd_dynamic_cmd_tac 1 5 '_lpd' 'WWW'
#_mk_pd_dynamic_cmd_tac 1 5 '_lpd' 'WWW'
#_call_dynamic_cmd

#------------------------------------------------------------------------
#_rpd

#------------------------------------------------------------------------

#_cmd_main_clean
#_mk_pd_dynamic_cmd_non_tac 1 5 '_rpd' 'WWW'
#_mk_pd_dynamic_cmd_tac 1 5 '_rpd' 'WWW'
#_call_dynamic_cmd

#------------------------------------------------------------------------
#_deco_lgt_lpd

#------------------------------------------------------------------------

#_cmd_main_clean
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_lft_lpd' '' '$'
#_mk_decopd_dynamic_cmd_non_tac 1 5 5 '_deco_lft_lpd' '' '$'
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_lft_lpd' '' '$'
#_mk_decopd_dynamic_cmd_non_tac 1 5 5 '_deco_lft_lpd' '' '$'
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_lft_lpd' 'abcdefghijklmnopqrstuvwxyz' '$'
#_mk_decopd_dynamic_cmd_non_tac 1 5 5 '_deco_lft_lpd' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' '$'
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_lft_lpd' '0123456789' '$'
#_call_dynamic_cmd

#------------------------------------------------------------------------
#_deco_rgt_rpd

#------------------------------------------------------------------------

#_cmd_main_clean
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_rgt_rpd' '' '$'
#_mk_decopd_dynamic_cmd_non_tac 1 5 5 '_deco_rgt_rpd' '' '$'
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_rgt_rpd' '' '$'
#_mk_decopd_dynamic_cmd_non_tac 1 5 5 '_deco_rgt_rpd' '' '$'
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_rgt_rpd' 'abcdefghijklmnopqrstuvwxyz' '$'
#_mk_decopd_dynamic_cmd_non_tac 1 5 5 '_deco_rgt_rpd' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' '$'
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_rgt_rpd' '0123456789' '$'
#_call_dynamic_cmd

#------------------------------------------------------------------------
#_deco_ful_pd

#------------------------------------------------------------------------

_cmd_main_clean
#_mk_decopd_dynamic_cmd_non_tac 1 5 5 '_deco_ful_pd' '' '('
#_mk_decopd_dynamic_cmd_tac 1 30 30 '_deco_ful_pd' '' '\\\\x40\\\\x21\\\\x40'
_mk_decopd_dynamic_cmd_tac 1 30 30 '_deco_ful_pd' '' '\\\\x40\\\\x40'
_mk_decopd_dynamic_cmd_tac 1 30 60 '_deco_ful_pd' '' '\\\\x40\\\\x40'
#_mk_decopd_dynamic_cmd_tac 1 10 10 '_deco_ful_pd' '' '\\\\x28@@@  @@@@\\\\x29'
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_ful_pd' '' '$'
#_mk_decopd_dynamic_cmd_non_tac 1 5 5 '_deco_ful_pd' '' '$'
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_ful_pd' 'abcdefghijklmnopqrstuvwxyz' '$'
#_mk_decopd_dynamic_cmd_non_tac 1 5 5 '_deco_ful_pd' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' '$'
#_mk_decopd_dynamic_cmd_tac 1 5 5 '_deco_ful_pd' '0123456789' '$'
_call_dynamic_cmd

#------------------------------------------------------------------------
#_deco_ful_rev

#------------------------------------------------------------------------

#_cmd_main_clean
#_mk_ascii_dynamic_cmd 35 47 '_deco_ful_rev' '0123456789'
#_mk_ascii_dynamic_cmd 58 64 '_deco_ful_rev' '0123456789'
#_mk_ascii_dynamic_cmd 91 91 '_deco_ful_rev' '0123456789'
#_mk_ascii_dynamic_cmd 123 126 '_deco_ful_rev' '0123456789'
#_mk_ascii_dynamic_cmd 35 47 '_deco_ful_rev' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 58 64 '_deco_ful_rev' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 91 91 '_deco_ful_rev' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 123 126 '_deco_ful_rev' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 35 47 '_deco_ful_rev' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 58 64 '_deco_ful_rev' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 91 91 '_deco_ful_rev' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 123 126 '_deco_ful_rev' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 123 126 '_deco_ful_rev' ''
#_grp_rn 1 5 5 4
#_call_dynamic_cmd

#------------------------------------------------------------------------
#_deco_ful

#------------------------------------------------------------------------

#_cmd_main_clean
#_mk_ascii_dynamic_cmd 35 47 '_deco_ful' '0123456789'
#_mk_ascii_dynamic_cmd 58 64 '_deco_ful' '0123456789'
#_mk_ascii_dynamic_cmd 91 91 '_deco_ful' '0123456789'
#_mk_ascii_dynamic_cmd 123 126 '_deco_ful' '0123456789'
#_mk_ascii_dynamic_cmd 35 47 '_deco_ful' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 58 64 '_deco_ful' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 91 91 '_deco_ful' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 123 126 '_deco_ful' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 35 47 '_deco_ful' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 58 64 '_deco_ful' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 91 91 '_deco_ful' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 123 126 '_deco_ful' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 123 126 '_deco_ful' ''
#_grp_rn 1 5 5 4
#_call_dynamic_cmd

#------------------------------------------------------------------------
#_deco_lft

#------------------------------------------------------------------------

#_cmd_main_clean
#_mk_ascii_dynamic_cmd 35 47 '_deco_lft' '0123456789'
#_mk_ascii_dynamic_cmd 58 64 '_deco_lft' '0123456789'
#_mk_ascii_dynamic_cmd 91 91 '_deco_lft' '0123456789'
#_mk_ascii_dynamic_cmd 123 126 '_deco_lft' '0123456789'
#_mk_ascii_dynamic_cmd 35 47 '_deco_lft' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 58 64 '_deco_lft' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 91 91 '_deco_lft' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 123 126 '_deco_lft' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 35 47 '_deco_lft' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 58 64 '_deco_lft' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 91 91 '_deco_lft' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 123 126 '_deco_lft' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 123 126 '_deco_lft' ''
#_grp_rn 1 5 5 4
#_call_dynamic_cmd


#------------------------------------------------------------------------
#_deco_rgt

#------------------------------------------------------------------------

#_cmd_main_clean
#_mk_ascii_dynamic_cmd 35 47 '_deco_rgt' '0123456789'
#_mk_ascii_dynamic_cmd 58 64 '_deco_rgt' '0123456789'
#_mk_ascii_dynamic_cmd 91 91 '_deco_rgt' '0123456789'
#_mk_ascii_dynamic_cmd 123 126 '_deco_rgt' '0123456789'
#_mk_ascii_dynamic_cmd 35 47 '_deco_rgt' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 58 64 '_deco_rgt' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 91 91 '_deco_rgt' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 123 126 '_deco_rgt' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#_mk_ascii_dynamic_cmd 35 47 '_deco_rgt' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 58 64 '_deco_rgt' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 91 91 '_deco_rgt' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 123 126 '_deco_rgt' 'abcdefghijklmnopqrstuvwxyz'
#_mk_ascii_dynamic_cmd 123 126 '_deco_rgt' ''
#_grp_rn 1 5 5 4
#_call_dynamic_cmd

#------------------------------------------------------------------------
#_mk_ascii_ is main

#------------------------------------------------------------------------

#_mk_ascii_code_non_lf 33 47
#_mk_ascii_code_non_lf 58 64
#_mk_ascii_code_non_lf 91 96
#_mk_ascii_code_non_lf 123 126
#_mk_ascii_char_non_lf 33 47
#_mk_ascii_char_non_lf 58 64
#_mk_ascii_char_non_lf 91 96
#_mk_ascii_char_non_lf 123 126
#_mk_ascii_code 33 47
#_mk_ascii_code 58 64
#_mk_ascii_code 91 96
#_mk_ascii_code 123 126
#_mk_ascii_char 33 47
#_mk_ascii_char 58 64
#_mk_ascii_char 91 96
#_mk_ascii_char 123 126


#_exec_cmd_on_clr_red
#_exec_cmd_on_clr_green
#_exec_cmd_on_clr_yellow
#_exec_cmd_on_clr_blue
#_exec_cmd_on_clr_magenta
#_exec_cmd_on_clr_cyan
#_exec_cmd_on_clr_white
#
#_cmd_main_clean
