"use strict";

exports.__esModule = true;

let emmet = require("emmet");

console.log(emmet["default"]('p>a'));

let fs = require("fs")

let input =fs.readFileSync("/dev/stdin","utf8");

console.log(input);
