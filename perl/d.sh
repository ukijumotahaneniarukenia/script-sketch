#!/usr/bin/env bash

UNICODE_SCRIPT_NAME=Han

UNICODE_SCRIPT_RANGE_REGEXP=$(perl -C -MUnicode::UCD -E '($script_name)=@ARGV;$,="\t";$a=Unicode::UCD::charscript($script_name);map{($s,$e,$k)=@{$_};say sprintf(qq/%X %X/,$s,$e)} @{$a}' $UNICODE_SCRIPT_NAME |\
  sed 's;^;\\\\x{;;s; ;}-\\\\x{;;;s;$;};'|xargs|tr -d ' ')

UNICODE_SCRIPT_NAME_DEFINE_CNT=$(perl -C -MUnicode::UCD -E '($script_name)=@ARGV;$,="\t";$a=Unicode::UCD::charscript($script_name);map{($s,$e,$k)=@{$_};say $e-$s+1} @{$a}' $UNICODE_SCRIPT_NAME | \
  awk '{a=a+$1}END{print a}')

perl -C -MString::Random -E '($range,$cnt)=@ARGV;$pattern="[$range]{$cnt}";say eval "String::Random->new->randregex("."\"".$pattern."\"".")"' $UNICODE_SCRIPT_RANGE_REGEXP $UNICODE_SCRIPT_NAME_DEFINE_CNT 2>/dev/null
