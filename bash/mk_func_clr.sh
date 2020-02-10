#!/bin/bash

_def_global_var(){
  _def_dir
}

_def_dir(){
  SRC_DIR=$(pwd)/iput
  TGT_DIR=$(pwd)/func/clr
}

_clean(){
  rm "${TGT_DIR}/*" 2>/dev/null
}

_del_last_line(){
  local TGT_FNM="$1"
  sed -i '$d' "${TGT_FNM}"
}

_post_prc(){
  while read TGT_FNM;do
    _del_last_line "${TGT_FNM}"
  done < <(find "${TGT_DIR}" -type f -name "*@*" -o -name "*+*")
}

_mk_cnstclr(){
  local IS_BG_FLG="$1"
  local FNM="$2"
  while read LN;do
    local RN=$(sed 's/ .*//' <<<${LN})
    local FUNC_NM=$(sed 's/.* //' <<<${LN})
    local CNST_NM=${FUNC_NM^^}
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
      LNF="'\\x0a'"
      SPA="'\\x20'"
      LFSP2=LNF""SPA""SPA
      IS_BG_FLG="'${IS_BG_FLG}'"
      FUNC_NM="'fg_${FUNC_NM}'"
      CNST_NM="'FG_${CNST_NM}'"
      if(IS_BG_FLG == "bg"){
        FUNC_NM="'bg_${FUNC_NM}'"
        CNST_NM="'BG_${CNST_NM}'"
      }
      INCLUDE_MARK="@"
    }
    {
      if(RN == "1"){
        print "#!/bin/bash"LNF
      }
      print FUNC_NM"(){"LFSP2"echo -e ""\x22""${"CNST_NM"}$*${NORMAL}""\x22"LNF"}"LNF
    }'
  done < <(cat "${SRC_DIR}/clr" | nl) > "${TGT_DIR}/${FNM}"
}

_mk_fmtclr(){
  local FNM="$1"
  while read LN;do
    local RN=$(sed 's/ .*//' <<<${LN})
    local CLR=$(sed 's/.* //' <<<${LN})
    echo "" | awk '
    BEGIN{
      RN="'${RN}'"
      CLR="'${CLR}'"
      FNM="'${FNM}'"
      LNF="'\\x0a'"
      SPA="'\\x20'"
      LFSP2=LNF""SPA""SPA
      LFSP4=LNF""SPA""SPA""SPA""SPA
      PREFIX_FUNC_NM="_exec_cmd_on_clr_"
      OPUT_FNM="$(pwd)/main/oput/mk_dynamic_cmd"
      INCLUDE_MARK="@"
    }
    {
      if(RN == "1"){
        print "#!/bin/bash"LNF
      }
      print PREFIX_FUNC_NM""CLR"""(){"LFSP2"while read CMD;do"LFSP4"fg_"CLR""SPA"\x22""$(eval ${CMD})\x22"LFSP2"done < <(cat "OPUT_FNM")"LNF"}"LNF
    }
    END{
    }'
  done < <(cat "${SRC_DIR}/clr" | nl) > "${TGT_DIR}/${FNM}"
}

_main(){
  _def_global_var
  _clean
  _mk_cnstclr fg fgclr___@___.sh
  _mk_cnstclr bg bgclr___@___.sh
  _mk_fmtclr fmtclr___+___.sh
  _post_prc
}

_main
