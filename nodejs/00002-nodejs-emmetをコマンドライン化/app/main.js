"use strict";

exports.__esModule = true;

let emmet = require("emmet");

let fs = require("fs")

let input =fs.readFileSync("/dev/stdin","utf8");

let cmd = ""

if(input.indexOf("*")==-1){
    //アスタリスクを含まない場合
    cmd = "\\" + input.replace(/\n$/,"") + "\\"

}else{
    //アスタリスクを含む場合

    cmd = "\\" + input.replace(/\n$/,"") + "\\unko"

}

// console.log(cmd)

console.log(emmet["default"](cmd));
