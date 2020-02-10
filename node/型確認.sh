#!/bin/bash

[sqlite💖ceacf3fb0808 (日 11月 10 19:31:13) ~/script_scratch/node]$echo {a..c} | xargs -I@ node -e 'a="@";console.log("ele:"+a);console.log("len:"+a.length);console.log(Object.prototype.toString.call(a));'
ele:a b c
len:5
[object String]
[sqlite💖ceacf3fb0808 (日 11月 10 19:31:18) ~/script_scratch/node]$echo {a..c} | xargs -I@ node -e 'a=["@"];console.log("ele:"+a);console.log("len:"+a.length);console.log(Object.prototype.toString.call(a));'
ele:a b c
len:1
[object Array]



echo {a..c} | xargs -I@ node -e 'a="@".split(" ");console.log(a);'

[sqlite💖ceacf3fb0808 (日 11月 10 19:35:41) ~/script_scratch/node]$echo {a..c} | xargs -I@ node -e 'a="@".split(" ");console.log("ele:"+a+",len:"+a.length);console.log(Object.prototype.toString.call(a));'
ele:a,b,c,len:3
[object Array]

[sqlite💖ceacf3fb0808 (日 11月 10 19:38:42) ~/script_scratch/node]$echo {a..c} | xargs -I@ node -e 'let ary="@".split(" ");for(let i=1;i<=ary.length;i++){console.log(i);}'
1
2
3

