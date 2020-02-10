#!/bin/bash

echo {a..j} | tr -d ' ' | xargs -I@ bash -c 'echo @ | sed -n -r "
:loop
s/(.){1}(.*)/\2\1/
p
/@/!bloop
"
'

echo ありがとうございました | xargs -I@ bash -c 'echo @ | sed -n -r "
:loop
s/(.){1}(.*)/\2\1/
p
/@/!bloop
"
'

echo '\\\\U1f4a'{0..2} | tr -d ' ' | xargs -I@ bash -c 'echo @ | sed -n -r -e "
:loop
s/(\\\U.....){1}(.*)/\2\1/
p
/@/!bloop
"
' | head -n4 
