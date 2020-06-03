#!/usr/bin/env bash

s="うんこ"
echo $s | xargs -I@ bash -c 'jshell -s < <(cat <<E
String s = "@";String t = "\033[38;5;"+"tobe"+"m"+s+"\033[0m";IntStream.rangeClosed(1,255).boxed().forEach(i->System.out.println(t.replace("tobe",String.valueOf(i))));
/exit
E
)
' | tail -n+2 | sed '$d'|xargs -n16
