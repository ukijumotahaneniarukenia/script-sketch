#!/usr/bin/env bash

cat <<EOS >template.html
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
</head>
<body>
<table border="1">
<tbody>
TOBE_REPLACE_HEADER
TOBE_REPLACE_BODY
</tbody>
</table>
</body>
</html>
EOS

#一覧作成対象資産

rm -rf $HOME/public_html/*

cp -r $HOME/script-dat $HOME/public_html/
#cp -r $HOME/script-cmd $HOME/public_html/
#cp -r $HOME/script-crawler $HOME/public_html/
#cp -r $HOME/script-sketch $HOME/public_html/

touch public_html/index.html

>public_html/index.html

filedump-jq public_html | grep -vP '\.git' | sed -n 1p | awk -v FS='\t' '{print $1,$2,$7,$8,$9,$10}' OFS='\t' | sed -r 's/\t/<\/th><th>/g' | sed -r 's/^/<tr><th>/' | sed -r 's/$/<\/th><\/tr>/' | sed '/TOBE_REPLACE_HEADER/r /dev/stdin' template.html | sed '/TOBE_REPLACE_HEADER/d' >>public_html/index.html

filedump-jq public_html | grep -vP '\.git' | sed -n '1!p' | awk -v FS='\t' '{print $1,$2,$7,$8,$9,$10}' OFS='\t' | sed 's;public_html/;;' | awk '{if($1=="file"){print $1,"<a href=\x22"$2"\x22>"$2"</a>",$3,$4,$5,$6}else if($1=="directory"){print $1,"<a href=\x22"$2"\x22>"$2"</a>",$3,$4,$5,$6}else{print $0}}' OFS='\t' | sed -r 's/\t/<\/th><th>/g' | sed -r 's/^/<tr><th>/' | sed -r 's/$/<\/th><\/tr>/' | sed '/TOBE_REPLACE_BODY/r /dev/stdin' public_html/index.html | sed '/TOBE_REPLACE_BODY/d' | sponge public_html/index.html
