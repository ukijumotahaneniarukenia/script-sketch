#!/bin/bash


cat test.tsv.done | urlenc2str | xargs -n4 | xargs -I@ jq -n '"@"|split(" ")|map(select(""!=.))|{url:.[0],tag:.[1],uploaded:.[2],title:.[3]}'| jq -s ''
