#!/bin/bash

file="$1"
shift
args="$@"
exec tclsh "${file}" "$0" ${args}
