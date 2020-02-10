#!/bin/bash

cp ~/.sqliterc ~/.sqliterc.bk

cat <<EOS >~/.sqliterc
.mode column
.headers on
.nullvalue "NULL"
.parameter set :tgt 'a b c'
.parameter set :tgt1 'd e f'
.parameter set :tgt2 10
.parameter set :tgt3 '2019-11-30'
.parameter set :tgt4 date('2019-11-30')
.parameter set :tgt5 "$(echo -e '\U1f4a'{0..9})"
.load /usr/local/src/libsqlitefunctions.so
EOS

sqlite3 < <(cat <<EOS
  select
    :tgt
    ,:tgt1
    ,:tgt2
    ,:tgt3
    ,:tgt4
    ,:tgt5
    ,sin(PI())
    ,ceil(11/10)
  ;
EOS
)

cp ~/.sqliterc.bk ~/.sqliterc
