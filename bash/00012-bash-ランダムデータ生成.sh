#!/bin/bash

usage(){
cat <<EOS
Usage:
  $0 1 20
EOS
exit 0
}

START_RN=$1;shift
END_RN=$1;shift

[ -z $START_RN ] && usage
[ -z $END_RN ] && usage

for i in $(eval echo {$START_RN..$END_RN});do
  echo $i
  echo {{a..z},{A..Z},{0..9}}|tr ' ' \\n|shuf -rn$(seq 32 | shuf -rn1) |tr -d \\n;echo;
  echo $(($i+$(((RANDOM%10)))))
  date "+%Y-%m-%dT%H:%M:%S" -d "$i day"
done | xargs -n4 >done
