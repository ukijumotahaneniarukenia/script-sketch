#!/bin/bash

#featureライブらいrが-Eオプションで使用可能。
#xargsの-tオプションはデバッグ。
#-nは引数の数。
#デバッグ情報は標準エラー出力にはくから向き先標準出力にしておいて一緒に拾えるようにする。

#seq -f %03g 1 100 | xargs -n10 -t perl -E '($first, $last) = (shift, pop); say "$first .. $last";' 2>&1

perl -E '($first, $last) = (shift, pop); say "$first $last";' 001 002 003 004 005 006 007 008 009 010 
perl -E '($first, $last) = (shift, pop); say "$first $last";' 011 012 013 014 015 016 017 018 019 020 
perl -E '($first, $last) = (shift, pop); say "$first $last";' 021 022 023 024 025 026 027 028 029 030 
perl -E '($first, $last) = (shift, pop); say "$first $last";' 031 032 033 034 035 036 037 038 039 040 
perl -E '($first, $last) = (shift, pop); say "$first $last";' 041 042 043 044 045 046 047 048 049 050 
perl -E '($first, $last) = (shift, pop); say "$first $last";' 051 052 053 054 055 056 057 058 059 060 
perl -E '($first, $last) = (shift, pop); say "$first $last";' 061 062 063 064 065 066 067 068 069 070 
perl -E '($first, $last) = (shift, pop); say "$first $last";' 071 072 073 074 075 076 077 078 079 080 
perl -E '($first, $last) = (shift, pop); say "$first $last";' 081 082 083 084 085 086 087 088 089 090 
perl -E '($first, $last) = (shift, pop); say "$first $last";' 091 092 093 094 095 096 097 098 099 100 
