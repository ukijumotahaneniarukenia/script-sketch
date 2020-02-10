#!/bin/bash

a='aaaうんこ\n'
echo ${a@Q}
echo ${a@E}
echo ${a@P}
echo ${a@A}
echo ${a@a}



a=aaa
echo ${a@Q}


a="うんこ ううんこ 💩"
echo ${a@Q} | xargs -n 1 
echo ${a@E} | xargs -n 1
echo $a | xargs -n 1 


