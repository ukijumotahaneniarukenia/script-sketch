#!/usr/bin/env bash

seq 1 1 10 | xargs -I@ jq -n '["@"|tonumber]' | jq -s -c 'flatten'
seq 1 2 10 | xargs -I@ jq -n '["@"|tonumber]' | jq -s -c 'flatten'
seq 1 3 10 | xargs -I@ jq -n '["@"|tonumber]' | jq -s -c 'flatten'
seq 1 5 10 | xargs -I@ jq -n '["@"|tonumber]' | jq -s -c 'flatten'
