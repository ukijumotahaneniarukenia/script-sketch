#!/usr/local/bin/awk

function _systime(CLR){
  _clr(strftime("%Y-%m-%d#%H:%M:%S"),CLR)
}

function _emoji(CPT,RET){
  CMD=sprintf("echo -e %s%s%s%s",SQT,BSL,CPT,SQT)
  CMD | getline RET
  return RET
}

function _cpd(PAD,STR,RET){
  PAD=PAD-length(STR)
  PADHLF=PAD/2
  IS_EVEN=PAD%2
  SPA="\x20"
  VTB="\x7c"
  LN=""
  while(PADHLF-- >0)
    LN=LN""sprintf("%s",SPA)
  if ( IS_EVEN == 1 )
    RET=VTB""LN""STR""substr(LN,2,length(LN))""VTB
  else
    RET=VTB""LN""STR""LN""VTB
  return RET
}

function _lpd(PAD,STR,RET){
  RET=sprintf("|%"PAD"s|",STR)
  return RET
}

function _rpd(PAD,STR,RET){
  RET=sprintf("|%-"PAD"s|",STR)
  return RET
}

function _embeded_lf(){
  print ""
}

function _deco(RPT,DECO,RET){
  while(RPT-- >0)
    RET=RET""sprintf("%s",DECO)
  return RET
}

function _clr(STR,CLR){
  printf("\033["CLR"m%s\033[0m\n",STR)
}
