#!/bin/bash
#最後のパターンスペースの出力を抑止 -n
#seq 4 | xargs -I@ printf %x @ | sed --debug -ne '
seq 4 | xargs -I@ printf %x @ | sed -ne '

s;$;=============;

:outerloop

h;#ほるすぺにたいひ

p;

#s;\(.\)\(.*=============\);\2\1;

:innerloop
{
  s;\(^[^=]*\)\(.*\);\1;g
  s;$;=============;
  s;\(.\)\(.*=============\);\2\1;
  p;
  /^=============/!binnerloop
}

x;#たいひしておいたパタスペをもどす

s;\(.\)\(.*=============\);\2\1;#ひとつ左にシフト

/^=============/!bouterloop
'
echo 

#https://qiita.com/satzz/items/2fbefff07df3cb052240

#echo 123============4= | sed --debug 's;\(^[^=]*\)\(.*\);\1;g'
