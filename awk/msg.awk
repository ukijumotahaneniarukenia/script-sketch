#!/usr/local/bin/awk

function _finn_msg_l(STR,RPT,DECO,PAD,CLR){
  _clr(_deco(RPT,DECO)""_lpd(PAD,STR),CLR);
}

function _errr_msg_l(STR,RPT,DECO,PAD,CLR){
  _clr(_deco(RPT,DECO)""_lpd(PAD,STR),CLR);
}

function _warn_msg_l(STR,RPT,DECO,PAD,CLR){
  _clr(_deco(RPT,DECO)""_lpd(PAD,STR),CLR);
}

function _info_msg_l(STR,RPT,DECO,PAD,CLR){
  _clr(_deco(RPT,DECO)""_lpd(PAD,STR),CLR);
}

function _finn_msg_r(STR,RPT,DECO,PAD,CLR){
  _clr(_rpd(PAD,STR)""_deco(RPT,DECO),CLR);
}

function _errr_msg_r(STR,RPT,DECO,PAD,CLR){
  _clr(_rpd(PAD,STR)""_deco(RPT,DECO),CLR);
}

function _warn_msg_r(STR,RPT,DECO,PAD,CLR){
  _clr(_rpd(PAD,STR)""_deco(RPT,DECO),CLR);
}

function _info_msg_r(STR,RPT,DECO,PAD,CLR){
  _clr(""_rpd(PAD,STR)""_deco(RPT,DECO),CLR);
}

function _finn_msg_c(STR,RPT,DECO,PAD,CLR){
  _clr(_deco(RPT,DECO)""_cpd(PAD,STR)""_deco(RPT,DECO),CLR);
}

function _errr_msg_c(STR,RPT,DECO,PAD,CLR){
  _clr(_deco(RPT,DECO)""_cpd(PAD,STR)""_deco(RPT,DECO),CLR);
}

function _warn_msg_c(STR,RPT,DECO,PAD,CLR){
  _clr(_deco(RPT,DECO)""_cpd(PAD,STR)""_deco(RPT,DECO),CLR);
}

function _info_msg_c(STR,RPT,DECO,PAD,CLR){
  _clr(_deco(RPT,DECO)""_cpd(PAD,STR)""_deco(RPT,DECO),CLR);
}
