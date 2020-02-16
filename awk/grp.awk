#!/usr/local/bin/gawk -f
function ceil(numerator,denominator)
{
   return (numerator/denominator == int(numerator/denominator)) ? numerator/denominator : int(numerator/denominator)+1
}

BEGIN{
  FS="\t"

}
{
 print ARGV[0]
 #print $0
}

#BEGIN{
#  sep="\t"
#}
#{
#  denominator=$2
#  key=ceil($1,denominator)
#}
#{
#  grps[key]=grps[key]""sep""$3
#}
#END{
#  for(grp in grps){
#    print grp,grps[grp]
#  }
#}
