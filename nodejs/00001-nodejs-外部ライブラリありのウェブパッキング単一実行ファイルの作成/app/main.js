"use strict";

exports.__esModule = true;

let emmet = require("emmet");

console.log(emmet["default"]('p>a'));

let fs = require("fs")

let input =fs.readFileSync("/dev/stdin","utf8");

console.log(input);

let cmd = "\\" + input.replace(/\n$/,"") + "\\\0"

console.log(cmd)

console.log(emmet["default"]('ul>li*2'));


console.log(emmet["default"](cmd));
