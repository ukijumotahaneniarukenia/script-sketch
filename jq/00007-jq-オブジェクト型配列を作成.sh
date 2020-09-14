#!/usr/bin/env bash


#奇数番目のみ
#for i in {1..10};do echo {A,T,G,C} | tr ' ' \\n |shuf -rn$(seq 5 10|shuf -rn1)|tr -d \\n;echo;done | nl | xargs -n4 | xargs -I@ jq -c -n '"@"|split(" ")|[{id:.[0],value:.[1]}]' | jq -s 'flatten'



#偶数番目のみ
#for i in {1..10};do echo {A,T,G,C} | tr ' ' \\n |shuf -rn$(seq 5 10|shuf -rn1)|tr -d \\n;echo;done | nl | xargs -n4 | xargs -I@ jq -c -n '"@"|split(" ")|[{id:.[2],value:.[3]}]' | jq -s 'flatten'


#ALL
for i in {1..10};do echo {A,T,G,C} | tr ' ' \\n |shuf -rn$(seq 5 10|shuf -rn1)|tr -d \\n;echo;done | nl | xargs -I@ jq -c -n '"@"|split("\t")|{id:.[0],value:.[1]}' | jq -s 'flatten'
