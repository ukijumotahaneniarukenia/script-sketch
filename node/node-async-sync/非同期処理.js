//関数に与える引数がないときは()
const pre_process = () => new Promise((resolve,reject)=>{
    try{
        resolve();
        console.log('[success]:pre_process.');
    }catch(err){
        reject(new Error('[failed]:pre_process.'));
    }
});

//関数に与える引数がないときは()
const main_process = (rsv_args) => new Promise((resolve, reject) => {
    if(0==rsv_args%2){
        resolve('divided by two.');
    }else{
        reject(new Error('non divided by two.'));
    }
  }
);

//関数に与える引数がないときは()
const post_process = () => new Promise((resolve,reject)=>{
    try{
        resolve();
        console.log('[success]:post_process.');
    }catch(err){
        reject(new Error('[failed]:post_process.'));
    }
});

//エントリポイントの関数定義
const main = (init_args) =>{
    pre_process();
    main_process(init_args)
        .then((rez)=>{
            console.log(`[success]:${rez}`);
        })
        .catch((rez)=>{
            console.log(`[failed]:${rez}`);
        });
    post_process();
};

//正常終了の場合
main(10);

//異常終了の場合
// main(9);

//標準出力には以下のように出力されている
//正常終了の場合
// [success]:pre_process.
// [success]:post_process.
// [success]:divided by two.

//異常終了の場合
// [success]:pre_process.
// [success]:post_process.
// [failed]:Error: non divided by two.

//上記のログは以下のように出力したい
//正常終了の場合
// [success]:pre_process.
// [success]:divided by two.
// [success]:post_process.

//異常終了の場合
// [success]:pre_process.
// [failed]:Error: non divided by two.
// [success]:post_process.

//https://qiita.com/ef81sp/items/29b7b91a3f3e77cf2233#%E3%81%BE%E3%81%A8%E3%82%81

//ジャバスクリプトは言語仕様として非同期機構なんだ
//メインプロセスのログが最後に出力されてしまっている
//ということで、awaitとasyncキーワードで同期処理を可能にする