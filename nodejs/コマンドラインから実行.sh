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
