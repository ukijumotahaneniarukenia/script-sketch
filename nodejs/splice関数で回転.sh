#!/bin/bash

#https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array/join
#https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/String/split
#https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice

usage(){
  cat <<EOF
Usage:
\$echo {a..e} | ./splice関数で回転.sh
ind:1,ele:b,cnt:5,liz:bcdea,init_args:abcde
ind:2,ele:d,cnt:5,liz:cdeab,init_args:abcde
ind:3,ele:a,cnt:5,liz:deabc,init_args:abcde
ind:4,ele:c,cnt:5,liz:eabcd,init_args:abcde
ind:5,ele:e,cnt:5,liz:abcde,init_args:abcde
--------------------------------------------------------------------------------
ind:1,ele:e,cnt:5,liz:eabcd,init_args:abcde
ind:2,ele:e,cnt:5,liz:deabc,init_args:abcde
ind:3,ele:e,cnt:5,liz:cdeab,init_args:abcde
ind:4,ele:e,cnt:5,liz:bcdea,init_args:abcde
ind:5,ele:e,cnt:5,liz:abcde,init_args:abcde
$./splice関数で回転.sh \$(echo -e '\U1f4a'{0..9}) | keta
     ind:1,ele:💡,cnt:10,liz:💡💢💣💤💥💦💧💨💩💠,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:2,ele:💣,cnt:10,liz:💢💣💤💥💦💧💨💩💠💡,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:3,ele:💥,cnt:10,liz:💣💤💥💦💧💨💩💠💡💢,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:4,ele:💧,cnt:10,liz:💤💥💦💧💨💩💠💡💢💣,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:5,ele:💩,cnt:10,liz:💥💦💧💨💩💠💡💢💣💤,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:6,ele:💡,cnt:10,liz:💦💧💨💩💠💡💢💣💤💥,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:7,ele:💣,cnt:10,liz:💧💨💩💠💡💢💣💤💥💦,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:8,ele:💥,cnt:10,liz:💨💩💠💡💢💣💤💥💦💧,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:9,ele:💧,cnt:10,liz:💩💠💡💢💣💤💥💦💧💨,init_args:💠💡💢💣💤💥💦💧💨💩
    ind:10,ele:💩,cnt:10,liz:💠💡💢💣💤💥💦💧💨💩,init_args:💠💡💢💣💤💥💦💧💨💩
--------------------------------------------------------------------------------
     ind:1,ele:💩,cnt:10,liz:💩💠💡💢💣💤💥💦💧💨,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:2,ele:💩,cnt:10,liz:💨💩💠💡💢💣💤💥💦💧,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:3,ele:💩,cnt:10,liz:💧💨💩💠💡💢💣💤💥💦,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:4,ele:💩,cnt:10,liz:💦💧💨💩💠💡💢💣💤💥,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:5,ele:💩,cnt:10,liz:💥💦💧💨💩💠💡💢💣💤,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:6,ele:💩,cnt:10,liz:💤💥💦💧💨💩💠💡💢💣,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:7,ele:💩,cnt:10,liz:💣💤💥💦💧💨💩💠💡💢,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:8,ele:💩,cnt:10,liz:💢💣💤💥💦💧💨💩💠💡,init_args:💠💡💢💣💤💥💦💧💨💩
     ind:9,ele:💩,cnt:10,liz:💡💢💣💤💥💦💧💨💩💠,init_args:💠💡💢💣💤💥💦💧💨💩
    ind:10,ele:💩,cnt:10,liz:💠💡💢💣💤💥💦💧💨💩,init_args:💠💡💢💣💤💥💦💧💨💩
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

circle(){
  echo "$@" | xargs -I@ node -e '
  function mock4(init_args){
    let ary=init_args.split(" ");
    for(let i=1;i<=ary.length;i++){
      let ele=ary.splice(0,1);
      ary.splice(init_args.split(" ").length,0,ele);
      console.log("ind:"+i+",ele:"+ary[i-1]+",cnt:"+init_args.split(" ").length+",liz:"+ary.join("")+",init_args:"+init_args.split(" ").join(""));
    }
  }
  mock4("@");
  console.log("-".repeat(80));
  function mock5(init_args){
    let ary=init_args.split(" ");
    for(let i=1;i<=ary.length;i++){
      let ele=ary.splice(-1,1);
      ary.splice(0,0,ele);
      console.log("ind:"+i+",ele:"+ary[i-1]+",cnt:"+init_args.split(" ").length+",liz:"+ary.join("")+",init_args:"+init_args.split(" ").join(""));
    }
  }
  mock5("@");
  '
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main

