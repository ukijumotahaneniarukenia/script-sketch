#!/usr/bin/env bash

echo "https://golang.org/pkg/strings/" | ruby -ruri -rnet/http -anle '$F.map{|e|Net::HTTP.get_print(URI.parse(e))}' >golang-pkg-strings.html

cat golang-pkg-strings.html | pup '#manual-nav' | sed '1i<?xml version="1.0" encoding="UTF-8"?>' >golang-pkg-strings.xml

echo golang-pkg-strings.xml | xml2json

cat golang-pkg-strings.json | jq --stream -c '{key:.[0]|map(if type == "number" then tostring else . end)|join("-"),value:.[1]}|select(.value!=null)' | jq -sr 'map({key:.key,value:.value|gsub("^\n +";"")|gsub("\n +$";"")})|.[]|[.key,.value]|@tsv'
