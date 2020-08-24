"use strict";

exports.__esModule = true;

let emmet = require("emmet");

let fs = require("fs")

let input =fs.readFileSync("/dev/stdin","utf8");

let cmd = ""

function outputController(tobeReplaceString){
    if(!tobeReplaceString){
        //引数の設定がない場合
        // console.log(cmd)
        console.log(emmet["default"](cmd));
    }else{
        //引数の設定がある場合
        // console.log(cmd)
        console.log(emmet["default"](cmd).replace(/unko/g,""));
    }
}

if(/\*/.test(input)){
    //アスタリスクを含む場合
    cmd = "\\" + input.replace(/\n$/,"") + "\\unko"

    outputController("unko")
}else if(/\#/.test(input)){
    //ナンバリングを含む場合
    cmd = input.replace(/\n$/,"") + "\\"

    // console.log(cmd)
    console.log(emmet["default"](cmd));
}else if(/\./.test(input)){
        //ドットを含む場合
    if(/\.[a-zA-Z0-9\-\_]+/.test(input)){
        //単一の場合 .class .title
        cmd = "\\div" + input.replace(/\n$/,"")
        outputController()
    }else{
        //複数の場合
        cmd = "\\" + input.replace(/\n$/,"")
        // console.log(cmd)
        console.log(emmet["default"](cmd));
    }

}else{
    //アスタリスクを含まない場合
    cmd = "\\" + input.replace(/\n$/,"") + "\\unko"
    // console.log(cmd)
    console.log(emmet["default"](cmd));

}
