#!/usr/bin/env bash

TMP=tmp-$$
cat - >$TMP
vim $TMP </dev/tty # 今使っている端末からの標準入力を読み込む
rm -rf $TMP
