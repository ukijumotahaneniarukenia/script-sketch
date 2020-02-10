#!/bin/bash
TMP=tmp_$$
cat - >$TMP 
vim $TMP </dev/tty
rm -rf $TMP
