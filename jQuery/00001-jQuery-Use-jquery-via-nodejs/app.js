'use strict';

var $ = require('jquery');


//ロード時に読み込まれる
$(function() {
  $('h1').css('color', 'red');

  var targetDivList = $(".wrapper div")

  var preDivList = Array.from(targetDivList);

  var postDivList = Array.from(targetDivList);

  console.log(preDivList)

  var n = postDivList.shift(); //先頭要素を取得し、

  postDivList.push(n); //末尾に追加

  console.log(postDivList)


  console.log(targetDivList)


  //targetDivList.innerHTML="" //domを初期化して

  //targetDivList.append(postDivList) // 構築したdomを追加



})
