#!/bin/bash

#前回行を参照する

seq 10 | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}'

seq 10 | tac | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}'

seq 10 | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}' | keta

seq 10 | tac | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}' | keta

seq 10 | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}' | tee >(tac)

seq 10 | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}' | tee >(rev)

seq 10 | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}' | tee >(rev|tac)

seq 10 | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}' | tee >(tac|rev)

seq 10 | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}' | tee >(tee >(tee >(tee))) | cat - | keta

seq 10 | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}' | tee >(tee >(tee >(tee))) | cat - | keta | rev

seq 10 | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}' | tee >(tee >(tee >(tee))) | cat - | keta | paste - - - -

echo {{A..F},{0..9}} | tr ' ' '\n' | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}'
echo {0..9} | tr ' ' '\n' | awk '{a[NR]=a[NR-1]","$1;}{print a[NR]}'

