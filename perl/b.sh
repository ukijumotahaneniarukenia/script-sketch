#!/bin/bash

perl -E '$,="\t";my($i,%rt)=();map{++$i;if(1==$i){$rt{$i}=(1/30)*($i+1)*(2*$i+1)*(3*($i**2)+3*$i+1);say $rt{$i},"(1/30)*($i+1)*(2*$i+1)*(3*($i**2)+3*$i+1)"}else{$rt{$i}+=(1/30)*($i+1)*(2*$i+1)*(3*($i**2)+3*$i+1);say $rt{$i},"(1/30)*($i+1)*(2*$i+1)*(3*($i**2)+3*$i+1)"}}@ARGV' {1..10}
