#!/bin/bash

echo ウンコもりもり森鴎外 |perl -C -nE '$,=",";/(\p{kana}{1,})(\p{hira}{1,})(\p{han}{1,})/ and ($s,$e,$c)=();map{$s=$-[$_];$e=$+[$_];$c=$_;map{if($_==1){printf("%s%s\n",substr(substr($&,$s,$e-$s),$_-1),substr(substr($&,$s,$e-$s),$_-1,0))}else{printf("%s%s\n",substr(substr($&,$s,$e-$s),$_-1),substr(substr($&,$s,$e-$s),0,$_-1))}}(1..$+[$_]-$-[$_])}(1..$#-);'
