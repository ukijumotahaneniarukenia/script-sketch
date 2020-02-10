#!/bin/bash

bash -c 'test -p /dev/stdin ; echo $?'

echo foo | bash -c 'test -p /dev/stdin ; echo $?'
