#!/bin/bash

node -e 'let ary=["a","b","c"];console.log(ary);console.log(Object.prototype.toString.call(ary));'


echo "$@" | xargs -I@ node -e '
function mock4(init_args){
  let ary=init_args.split(" ");
  for(let i=1;i<=ary.length;i++){
    let ele=ary.splice(0,1);
    ary.splice(init_args.split(" ").length,0,ele);
    console.log(ary.join(""));
  }
}
mock4("@");
'

echo "$@" | xargs -I@ node -e '
function mock5(init_args){
  let ary=init_args.split(" ");
  for(let i=1;i<=ary.length;i++){
    let ele=ary.splice(-1,1);
    ary.splice(0,0,ele);
    console.log(ary.join(""));
  }
}
mock5("@");
'


echo {う,ん,こ,💩} | xargs -I@ node -e 'function f(a){b=a.split(" ");for(let i=1;i<=b.length;i++){let f=b.splice(0,1);b.splice(a.split(" ").length,0,f);console.log("ind:"+i+",f:"+b[i-1]+",cnt:"+a.split(" ").length+",liz:"+b.join("")+",a:"+a.split(" ").join(""));}}f("@");'
