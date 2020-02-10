#!/bin/bash

#https://rcmdnk.com/blog/2014/01/15/computer-bash-zsh_2/

#aaaaの出力さきを制御端末ファイルに向ける
#echo aaaaa >/dev/tty

#ログファイルには書き込まれない
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:08) ~/script_scratch/bash]$./a.sh >log
#aaaaa
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:13) ~/script_scratch/bash]$cat log
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:15) ~/script_scratch/bash]$


#aaaaの出力さきを標準出力に向ける
#echo aaaaa

#ログファイルには書き込まれる
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:50) ~/script_scratch/bash]$./a.sh >log
#[sqlite💞ceacf3fb0808 (日 11月 03 13:56:51) ~/script_scratch/bash]$cat log
#aaaaa


#aaaaの出力先を標準エラー出力に向ける
echo aaaaa 1>&2


#ログファイルには書き込まれない
#[sqlite💞ceacf3fb0808 (日 11月 03 13:57:23) ~/script_scratch/bash]$./a.sh >log
#aaaaa
#[sqlite💞ceacf3fb0808 (日 11月 03 13:57:25) ~/script_scratch/bash]$cat log

