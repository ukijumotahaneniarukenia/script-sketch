'use strict';

let $ = require('jquery');

//https://qiita.com/narikei/items/fb62b543ca386fcee211
//https://qiita.com/KDE_SPACE/items/e21bb31dd4d9c162c4a6
function getXpath(element) {
  if(element && element.parentNode) {
    //elementがundefinedでないかつ親ノードが存在する場合
    //
    //
    //自身のタグ名を末尾に付与し、親ノードを引数に渡して再帰呼び出し
    let xpath = getXpath(element.parentNode) + '/' + element.tagName;
    let s = [];

    for(var i = 0; i < element.parentNode.childNodes.length; i++) {
      var e = element.parentNode.childNodes[i];
      if(e.tagName == element.tagName) {
        s.push(e);
      }
    }

    if(1 < s.length) {
      for(var i = 0; i < s.length; i++) {
        if(s[i] === element) {
          xpath += '[' + (i+1) + ']';
          break;
        }
      }
    }

    return xpath.toLowerCase();
  } else {
    return '';
  }
}

//ロード時に読み込まれる
$(function() {

  $('.cpd-l').on('click', (event) => {
		console.log(getXpath(event.target));
  })


})
