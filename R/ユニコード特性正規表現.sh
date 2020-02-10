#!/bin/bash

#https://perldoc.jp/docs/perl/5.10.1/perlrecharclass.pod

#https://perldoc.jp/docs/perl/5.12.1/perlunicode.pod#Unicode32Character32Properties

#https://perldoc.jp/docs/perl/5.12.1/perlunicode.pod#Unicode32Encodings

Rscript -e 'library(stringi);str = stri_rand_strings(10, 3,pattern="[あ-ん]");str;stri_detect_regex(str,"\\p{hiragana}");'

Rscript -e 'library(stringi);str = stri_rand_strings(10, 3,pattern="[あ-ん]");'
Rscript -e 'library(stringi);str = stri_rand_strings(10, 3,pattern="[a-z]");'
Rscript -e 'library(stringi);str = stri_rand_strings(10, 3,pattern="[A-Z]");'
Rscript -e 'library(stringi);str = stri_rand_strings(10, 3,pattern="[ア-ン]");'
Rscript -e 'library(stringi);str = stri_rand_strings(10, 3,pattern="[ｱ-ﾝ]");'

#############################################################################
#これだ######################################################################
#############################################################################
#http://www.alanflavell.org.uk/unicode/unidata.html
#############################################################################

#[sqlite💜ceacf3fb0808 (火 11月 05 07:06:50) ~/script_scratch/R]$Rscript -e 'library(stringi);str = stri_rand_strings(10, 3,pattern="[ア-ン]");str;stri_detect_regex(str,"\\p{katakana}");'
# [1] "ブチプ" "ヌチネ" "ッニヂ" "ヌズラ" "シレモ" "ゲツヮ" "テゼヱ" "ウヌソ"
# [9] "ウハケ" "ワラェ"
# [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
#[sqlite💜ceacf3fb0808 (火 11月 05 07:07:00) ~/script_scratch/R]$Rscript -e 'library(stringi);str = stri_rand_strings(10, 3,pattern="[ｱ-ﾝ]");str;stri_detect_regex(str,"\\p{katakana}");'
# [1] "ﾙﾒﾓ" "ﾂﾚｴ" "ﾖｾｱ" "ｴﾆｷ" "ﾈｹﾝ" "ﾊﾈｵ" "ﾋﾓﾏ" "ﾜｿﾂ" "ﾚﾏﾏ" "ﾛﾐｵ"
# [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
#

#[sqlite💜ceacf3fb0808 (火 11月 05 07:10:58) ~/script_scratch/R]$Rscript -e 'library(stringi);str = stri_rand_strings(10, 3,pattern="[゠-ヿ]");str;stri_detect_regex(str,"\\p{katakana}");'
# [1] "ゲニダ" "ズヂノ" "ハコハ" "ビヤリ" "ツコツ" "ペアェ" "ロャュ" "ヴガュ"
# [9] "ジムク" "ッダゾ"
# [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
#
