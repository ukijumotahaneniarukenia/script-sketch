#!/usr/bin/env bash

#OUTPUT_FILE_NAME=emmet-html-snippet-macro-execute-list.sh

curl -fsSL https://raw.githubusercontent.com/emmetio/emmet/master/snippets/html.json -o emmet-html.json

cat emmet-html.json  | jq 'to_entries|map(.key)|group_by(.[:1])|map([((map(.[:1])|unique)[]),.])|map(.[0] as $k|.[1]|map($k+"ZZZ"+.))|flatten[]|splits("ZZZ")'|xargs -n2|awk '{print $1,$2}' OFS="\t" >emmet-html-snippet.tsv

cat emmet-html-snippet.tsv | awk 'BEGIN{sep="ZZZ"}{a[$1]=a[$1]sep$2;b[$1]++}END{for(e in a){sub(sep,"",a[e]);print e,b[e],a[e]}}' | sort -k1,2 | ruby -anle 'a=$F[2].split("ZZZ");a.size.times{|e|p $.,e+1,$F[0],a[e]}' | xargs -n4 | awk '{printf "QH%03d\t%03d\t%s\t%s\n" ,$1,$2,$3,$4}' >emmet-html-snippet-pretty.tsv

cat emmet-html-snippet-pretty.tsv | while read grp grpseq key value;do printf "%s-%s-html-snippet.vim\t" $grp $grpseq;echo "let @q=\"i$value\<Esc>:call emmet#expandAbbr(3,\\\"\\\")\<Enter>\"";done >emmet-html-snippet-macro-table.tsv

cat emmet-html-snippet-pretty.tsv | while read grp grpseq key value;do echo "let @q=\"i$value\<Esc>:call emmet#expandAbbr(3,\\\"\\\")\<Enter>\"">$(printf "%s-%s-emmet-html-snippet-macro.vim\t" $grp $grpseq;);done

#バックアップ
#echo "cp $HOME/.vimrc $HOME/.vimrc-bak" > $OUTPUT_FILE_NAME
#
#ls $HOME/script-sketch/emmet/00002-emmet-vimマクロで自動生成/*vim | \
#
#
#	while read f;do
#
#		{
#
#
#
#			#初期化
#			echo "cat $HOME/.vimrc | sed '\$d' | sponge $HOME/.vimrc"
#
#			#追記
#			echo "cat $f >>$HOME/.vimrc"
#
#			#実行
#			echo "vim  +':norm @q' +':w! a.txt' +'q'"
#
#			echo "wait \$!"
#
#			#リネーム
#			echo "mv a.txt $f.html"
#
#
#
#		} >> $OUTPUT_FILE_NAME
#
#	done
#
#
#
##リカバリ
#echo "cp $HOME/.vimrc-bak $HOME/.vimrc" >> $OUTPUT_FILE_NAME
#
#
##権限付与
#chmod 755 $OUTPUT_FILE_NAME
