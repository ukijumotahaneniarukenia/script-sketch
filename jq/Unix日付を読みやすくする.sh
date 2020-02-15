#!/bin/bash

echo '{"time":[1500000000,1500100000,1500200000,1500300000]}' | jq '.time[]|=strftime("%Y-%m-%dT%H:%M:%S")'


echo '{"time":["1500000000","1500100000","1500200000","1500300000"]}' | jq '.time[] |= (tonumber|strftime("%Y-%m-%dT%H%M%S"))'

echo '{"time":[{"start":1500000000,"end":1500100000},{"start":1500200000,"end":1500300000}]}' | jq '.time[]|=(map(.|strftime("%Y-%m-%dT%H%M%S")))'


echo '{"time":[{"start":"1500000000","end":"1500100000"},{"start":"1500200000","end":"1500300000"}]}' | jq '.time[]|=(map(.|tonumber|strftime("%Y-%m-%dT%H%M%S")))'
