#!/bin/bash

denominator=$1

[ -z $denominator ] && exit 1

#第一列にseq番号
#第二列を集約
#標準入力はタブ区切り
cat - | awk -v FS='\t' -v denominator=$denominator '
function ceil(numerator,denominator)
{
   return (numerator/denominator == int(numerator/denominator)) ? numerator/denominator : int(numerator/denominator)+1
}
BEGIN{
  SEP="\t"
}
{
   key=ceil($1,denominator)
}
{
  GRP[key]=GRP[key]""SEP""$2
}
END{
  for(grp in GRP){
    print grp,GRP[grp]
  }
}
'


#apache@e87790399472 ~/script-sketch/awk$cat test.txt | nl | ./grp.sh 4
#1 	"items"	"0"	"id"	"2tM1DedEr6eqgdqJ8X4sP+CS3BVG/bkK4hS45ZnKnRQ=_170496cd57a:c60cb39:31d4c877"
#2 	"items"	"0"	"title"	"A Canadian Energy Company Bought an Oregon Sheriff’s Unit"
#3 	"items"	"1"	"id"	"kbcnL5XqWJi/iYn/BuKqrf/JSzXEf2szaOaXmzc6oZ4=_170496c85db:c60c640:31d4c877"
#4 	"items"	"1"	"title"	"経験者がいない状態で、戦略的DDDを現場でやってみた話/ OOC2020"

