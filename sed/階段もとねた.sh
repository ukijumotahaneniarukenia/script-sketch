#!/bin/bash

#ok
#echo 1234 | sed -n -r '
#:loop
#s/([0-9]){1}([0-9]*)/\2\1/
#p
#/1234/!bloop
#'

#ok
#echo 1234 | sed -n -r '
#:loop
#s/(.){1}(.*)/\2\1/
#p
#/1234/!bloop
#'

#ok
#echo 1234 | sed -n -r "
#:loop
#s/(.){1}(.*)/\2\1/
#p
#/1234/!bloop
#"

#ok
#echo 1234 | xargs -I@ bash -c 'echo @ | sed --debug -n -r "
#:loop
#s/(.){1}(.*)/\2\1/
#p
#/@/!bloop
#"
#'

echo 1234 | xargs -I@ bash -c 'echo @ | sed -n -r "
:loop
s/(.){1}(.*)/\2\1/
p
/@/!bloop
"
'
