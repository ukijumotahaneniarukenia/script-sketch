#!/bin/bash

_def_dir(){
  SRC_DIR=$(pwd)/iput
  TGT_DIR=$(pwd)/cnst/clr
}

_clean(){
  rm ${TGT_DIR}/* 2>/dev/null
}

_mk_cnstclr(){
  IS_BG_FLG="$1"
  FNM="$2"
  while read LN;do
    RN=$(sed 's/ .*//' <<<${LN});
    FUNC_NM=$(sed 's/.* //' <<<${LN});
    CNST_NM=${FUNC_NM^^};
    echo "" | awk '
    BEGIN{
      IS_BG_FLG="'${IS_BG_FLG}'"
      LNF="\x0a"
      SPA="\x20"
    }
    {
      RN="'${RN}'"
      if(RN == "1"){
        print "#!/bin/bash"LNF
        print "NORMAL=$(tput sgr0)"
      }
      CNST_NM="'FG_${CNST_NM}'"
      OPTION="setaf"
      if(IS_BG_FLG == "bg"){
        CNST_NM="'BG_${CNST_NM}'"
        OPTION="setab"
      }
      print CNST_NM"=$(tput "OPTION""SPA""RN")"
    }'
  done < <(cat ${SRC_DIR}/clr | nl) >${TGT_DIR}/${FNM}
}

_def_dir
_clean
_mk_cnstclr fg fgclr___@___.sh
_mk_cnstclr bg bgclr___@___.sh
