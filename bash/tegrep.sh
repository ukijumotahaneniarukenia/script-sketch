#!/bin/bash -x

usage() {
  #標準エラー出力はデフォルトで仮想端末ターミナル(ptsファイルで管理されているターミナルのこと)に吐く
  echo >&2 "Usage: tegrep [FILE]"
}

#EDITOR環境変数にvimを設定
EDITOR=vim

tmpfile="$(mktemp)"
trap "rm -f $tmpfile" EXIT

if [ ! -t 0 ]; then
  #testコマンドの-tオプション
  #-t FD  ファイル記述子 FD がターミナル上で開いている
  #当該コマンドの直前でファイルを扱うプロセスを起動している場合
  cat /dev/stdin > "$tmpfile"
  #標準入力をtty実端末ファイルから読み込んで、
  #vimで編集した内容をtty実端末ファイルに書き込む
  #書き込んだファイル内容を標準出力に吐き出す

  #直前のプロセスの結果を標準入力で読み込んで、vimで編集して
  0</dev/tty "$EDITOR" "$tmpfile" 1>/dev/tty
  cat "$tmpfile"
elif [ "$#" -gt 0 ]; then
  #引数に与えられたファイルを一時ファイルにコピーして
  #vimでオープン
  #編集した内容をcatで標準出力に出力
  cp "$1" "$tmpfile"
  $EDITOR "$tmpfile"
  cat "$tmpfile"
else
  #いずれでもなかったら、使用例
  usage
  exit 1
fi
