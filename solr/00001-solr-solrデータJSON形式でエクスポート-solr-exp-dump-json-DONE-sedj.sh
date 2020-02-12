#!/bin/bash

MX_CNT=$(curl -s "http://localhost:8983/solr/wiki/select?q=*%3A*&rows=100&start=101&wt=json" | gron | grep -Po '(?<=json\.response\.numFound = )[0-9]+')

seq 1 $MX_CNT | xargs -n100 | awk -v end=100 '{print $1,$end}' | \
  while read start end;do
    echo "curl -s \"http://localhost:8983/solr/wiki/select?q=*%3A*&rows=100&start=$start&wt=json\""
  done
