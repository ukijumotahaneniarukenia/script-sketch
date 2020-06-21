#!/usr/bin/env bash

usage(){
cat <<EOS

Usage:
bash $0 math

or

bash $0 io

or

bash $0 strings

or

bash $0 text/scanner

EOS

exit 0
}

PKG_NAME=$1;shift

[ -z $PKG_NAME ] && usage


FILE_NAME=$(echo $PKG_NAME | tr '/' '-')

echo "https://golang.org/pkg/$PKG_NAME/" | ruby -ruri -rnet/http -anle '$F.map{|e|Net::HTTP.get_print(URI.parse(e))}' >golang-pkg-$FILE_NAME.html

cat golang-pkg-$FILE_NAME.html | pup '#manual-nav' | sed '1i<?xml version="1.0" encoding="UTF-8"?>' >golang-pkg-$FILE_NAME.xml

echo golang-pkg-$FILE_NAME.xml | xml2json

cat golang-pkg-$FILE_NAME.json | jq --stream -c '{key:.[0]|map(if type == "number" then tostring else . end)|join("-"),value:.[1]}|select(.value!=null)' | \
  jq -sr "map({pkg:\"$PKG_NAME\",key:.key,value:.value|gsub(\"^\n +\";\"\")|gsub(\"\n +$\";\"\")})|.[]|[.pkg,.key,.value]|@tsv" | \
  sed '1iパッケージ名\tキー\tバリュー' | sed "2i$PKG_NAME\tdiv-url\thttps://golang.org/pkg/$PKG_NAME/" >golang-pkg-$FILE_NAME.tsv


ls golang* | grep -v tsv | xargs rm
