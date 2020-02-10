#!/bin/bash

ls {a..z}.json 2>/dev/null | xargs -n1 -I@ bash -c 'echo file.name = @&& cat @ | gron' | sed -E 's/\{\}|\[\]/null/;s/;$//;s;\.;_;g;s;_json;\.json;'
