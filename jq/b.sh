#!/bin/bash


#key用
#cat test.json | jq -c 'to_entries|map({"grp":.key|gsub("[a-zA-Z]{1,}";"")|gsub("^\\.";"")|gsub("\\..*";""),"item":.key|gsub("\\.";"-")|gsub("-[0-9]{1,}-";"-")})'

#value用
#cat test.json | jq -c 'to_entries|map({"grp":.key|gsub("[a-zA-Z]{1,}";"")|gsub("^\\.";"")|gsub("\\..*";""),"item":.value})'

#key-value合体用
cat test.json | jq -c 'to_entries|map({"grp":.key|gsub("[a-zA-Z]{1,}";"")|gsub("^\\.";"")|gsub("\\..*";""),"item":


{"key":.key|gsub("\\.";"-")|gsub("-[0-9]{1,}-";"-"),"value":.value}})






'

