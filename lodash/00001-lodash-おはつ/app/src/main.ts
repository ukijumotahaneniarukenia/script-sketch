import _ from 'lodash'

import omikuji from './sub/omikuji';

let mx = 5;

let ary = [];

for (let index = 0; index < mx; index++) {
    let kekka = omikuji()
    ary.push(kekka+"食べたい")
}

console.log(ary)
console.log(_.shuffle(ary))
console.log(ary)
