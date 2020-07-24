#!/bin/bash

jikan=0

function prog() {
    suji=`echo ${1%.*}`
    sinko=`echo $((suji / 5))`
    if ! test $sinko -eq 0; then
        bar=''
        for INT in `seq $sinko`
        do
            bar=$bar'#'
        done
        echo -en " $bar $suji%\r"
    fi
}

while [ $jikan -le 20 ]
do
    Count=`echo "scale=1; $jikan * 100 / 20" | bc`
    prog $Count
    sleep 1
    jikan=`echo $((jikan + 1))`
done
echo $bar
