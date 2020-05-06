#!/usr/bin/env bash

INPUT_SUFFIX=.tsv
OUTPUT_SUFFIX=_tbl

cp $HOME/.sqliterc $HOME/.sqliterc.bk

#-initオプションにファイルを指定しなければ、デフォルトで.sqlitercが読み込まれる
#メタ定義投入時の設定パラメータ
cat <<EOS >$HOME/.sqliterc

.mode column
.headers on
.width 0
.timer on
.nullvalue "NULL"
.prompt "sqlite>>>"
.separator \t

EOS

sqlite3 testdb < init.sql

#データ投入時の設定パラメータ
cat <<EOS >$HOME/.sqliterc

.mode column
.headers on
.width 0
.timer on
.nullvalue "NULL"
.prompt "sqlite>>>"
.separator \t

EOS

ls *$INPUT_SUFFIX | while read t;do echo .import $t ${t//.*/$OUTPUT_SUFFIX};done >>$HOME/.sqliterc

sqlite3 testdb < healthcheck.sql

cp $HOME/.sqliterc.bk $HOME/.sqliterc

rm $HOME/.sqliterc.bk
