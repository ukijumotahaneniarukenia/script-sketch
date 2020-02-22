#!/bin/bash

cat pom.json | jq -c 'paths|join(".")' | grep -vP 'tail|text|^"dependency"$' | sed 's;^;/;;s;\.;/;g' | xargs -I@ echo "cat pom.xml | xmllint --xpath '@' - && echo" | sh | perl -pe 's/(.*>)(.*)(<.*)/\2/g'
