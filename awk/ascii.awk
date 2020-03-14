#!/usr/bin/env awk

function def_ascii_code(){
  LNF="\x0a"
  SPA="\x20"
  ECM="\x21"
  DQT="\x22"
  NSG="\x23"
  DLR="\x24"
  PCT="\x25"
  AMP="\x26"
  SQT="\x27"
  LPS="\x28"
  RPS="\x29"
  AST="\x2a"
  PLS="\x2b"
  CNM="\x2c"
  PYN="\x2d"
  DOT="\x2e"
  SLS="\x2f"
  CLN="\x3a"
  SCN="\x3b"
  LTS="\x3c"
  EQL="\x3d"
  GTS="\x3e"
  QES="\x3f"
  ATM="\x40"
  LSB="\x5b"
  BSL="\x5c"
  RSB="\x5d"
  CLT="\x5e"
  USC="\x5f"
  BQT="\x60"
  LCB="\x7b"
  VTB="\x7c"
  RCB="\x7d"
  TLD="\x7e"
}

BEGIN{
  def_ascii_code()
  print LNF
  print SPA
  print ECM
  print DQT
  print NSG
  print DLR
  print PCT
  print AMP
  print SQT
  print LPS
  print RPS
  print AST
  print PLS
  print CNM
  print PYN
  print DOT
  print SLS
  print CLN
  print SCN
  print LTS
  print EQL
  print GTS
  print QES
  print ATM
  print LSB
  print BSL
  print RSB
  print CLT
  print USC
  print BQT
  print LCB
  print VTB
  print RCB
  print TLD
}
