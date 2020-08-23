'use strict';

var $ = require('jquery');


function confirmCheck(){

    let s = $('[name="fruit"]');

    console.log(s);

}


//ロード時に読み込まれる
$(function() {


    confirmCheck();

    // let s = $('[name="fruit"]');

    // console.log(s);


})


