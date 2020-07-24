#!/usr/bin/env bash


function prog() {
    echo $1
    suji=${1%.*}
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

prog 100.0
