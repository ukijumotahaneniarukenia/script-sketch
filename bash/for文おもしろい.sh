#!/bin/bash
for i in {1..3};do for j in $(eval echo {$i..3});do echo $i":""$j";done;done

#$./for文おもしろい.sh
#1:1
#1:2
#1:3
#2:2
#2:3
#3:3

for i in {1..3};do for j in $(eval echo {$i..3});do echo $i":""$j";done;done

#$for i in {1..3};do for j in $(eval echo {3..$i});do echo $i":""$j";done;done
#1:3
#1:2
#1:1
#2:3
#2:2
#3:3





#$for i in {3..1};do for j in $(eval echo {$i..3});do echo $i":""$j";done;done
#3:3
#2:2
#2:3
#1:1
#1:2
#1:3
#$for i in {3..1};do for j in $(eval echo {3..$i});do echo $i":""$j";done;done
#3:3
#2:3
#2:2
#1:3
#1:2
#1:1

