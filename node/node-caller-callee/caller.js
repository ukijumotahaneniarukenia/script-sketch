let add = require('./callee.js');

let calc = require('./callee.js');

console.log(add(10,5));

console.log(calc.add(1,3));
console.log(calc.square(3));
console.log(calc.cube(3));
