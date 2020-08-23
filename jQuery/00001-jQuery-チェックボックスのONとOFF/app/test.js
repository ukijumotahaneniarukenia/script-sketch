'use strict';

let $ = require('jquery');

function setUpSingleCheckEvent(){

    let checkboxList = $('.checkbox-grp')

    $('.checkbox-grp').click(function(){

        //クリックされたとき、trueで、再クリックされたとき、falseになる
        //なので、それ以外をアンチェックしておくと単一チェックできる

        let self = $(this);

        let restCheckboxList = checkboxList.not(self);

        restCheckboxList.prop('checked',false);

    });

}

function setUpAllCheckEvent(){

    //結果トグルみたいな動きになる

    let checkboxList = $('.checkbox-grp')

    let allCheckStatus = true;

    $('.allCheck').click(function(){

        if(!allCheckStatus){

            checkboxList.prop('checked',true);

        } else {

            checkboxList.prop('checked',false);

        }

        allCheckStatus = !allCheckStatus; //状態を入れ替えておくのがみそ
    });

}


//ロード時に読み込まれる
$(function() {

    setUpAllCheckEvent();

    setUpSingleCheckEvent();

})


