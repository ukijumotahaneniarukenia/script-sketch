#!/bin/bash

echo ウンコもりもり森鴎外 |perl -C -nE '
  $,=",";
  /(\p{kana}{3})(\p{hira}{4})(\p{han}{3})/ and ($s,$e,$c)=();
  %h=();
  map{
    $s=$-[$_];
    $e=$+[$_];
    $c=$_;
    push(@{$a[$_]},$-[$_]);
    push(@{$a[$_]},$+[$_]);
    $h{$_}=@{$a[$_]};
    map{
       if($_==1){
         printf("%s%s\n",substr(substr($&,$s,$e-$s),$_-1),substr(substr($&,$s,$e-$s),$_-1,0))
       }else{
         printf("%s%s\n",substr(substr($&,$s,$e-$s),$_-1),substr(substr($&,$s,$e-$s),0,$_-1))
       }
    }(1..$+[$_]-$-[$_])
  }(1..$#-);
  #END{
  #  map{
  #    say $_,@{$a[$_]}[0],@{$a[$_]}[1]
  #  }keys %h
  #}
'
