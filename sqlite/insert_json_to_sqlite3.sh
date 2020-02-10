#!/bin/bash

pre_process(){
  cp ~/.sqliterc ~/.sqliterc.bk
}

post_process(){
  cp ~/.sqliterc.bk ~/.sqliterc
}

set_env(){
  cat <<EOS >~/.sqliterc
.mode column
.headers on
.nullvalue "NULL"
.parameter set :tgt $(jq '.|tojson' <<<$@)
EOS
}

execute(){
  sqlite3 testdb < <(cat <<EOS
    select * from json_tree(:tgt);
EOS
)
}

main(){
  pre_process
  set_env $@
  execute
  post_process
}

main $@
