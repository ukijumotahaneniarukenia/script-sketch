'use strict';

var $ = require('jquery');


//ステップ１が複数件の処理
//ステップ２と３が単一件数の処理
function getXpath(element) {

  if(element && element.parentNode) {

    //ステップ１-クリックされた要素の親要素をすべてリストアップし、コールスタックに積む
    //クリックされた要素のタグ名を末尾にスラッシュとともに追加して、クリックされた要素の親要素を引数に渡して再帰処理を実施
    //終了条件は親要素がundefinedでないかつ親要素が存在しなくなるまで
    //コールスタックを意識、呼び元にもどるのをスタック数分繰り返す ひとつずつ行けるところまでいってひとつずつ戻ってくるイメージ
    let xpath = getXpath(element.parentNode) + '/' + element.tagName;
    let s = [];

    //ステップ２-子要素が複数件の場合、ステップ３で子要素の先頭から何番目の要素かを特定するため、配列に格納する
    //この時点での親要素はスタックに格納されたカレント要素の親要素を示している
    //この親要素自身を含み、配下のテキスト要素を除いた子要素をすべての件数を取得
    for(let i = 0; i < element.parentNode.childNodes.length; i++) {

      let e = element.parentNode.childNodes[i];

      if(e.tagName == element.tagName) {
        //スタックに格納されたカレント要素のタグ名と同一の場合に限り、配列に格納

        s.push(e);

      }

    }

    //ステップ３-子要素が複数件の場合、子要素の先頭から何番目の要素かを特定するため、XPATHを構築する
    if(1 < s.length) {

      for(let i = 0; i < s.length; i++) {

        if(s[i] === element) {

          xpath += '[' + (i+1) + ']';

          break;

        }
      }
    }

    //子要素を複数件持たない場合ないしは子要素を複数件持つ場合、DOMへのjavascriptの関数がタグ名を大文字で返却する仕様なので、小文字化
    return xpath.toLowerCase();

  } else {

    //クリックされたDOMがundefinedであれば、空文字を返却する

    return '';

  }
}

//ロード時に読み込まれる
$(function() {

  $('.cpd-l').on('click', (event) => {
    console.log(getXpath(event.target));
  })

})
