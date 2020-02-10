//https://qiita.com/tashxii/items/7c86f39fced68ea9903d#node-sqlite3-%E3%81%AEinstall

//関数に与える引数がないときは()
//関数定義でもayncキーワードを付与
const pre_process = async () => new Promise((resolve,reject)=>{
    try{
        resolve();
        console.log('[success]:pre_process.');
    }catch(err){
        reject(new Error('[failed]:pre_process.'));
    }
});

//関数に与える引数がないときは()
//関数定義でもayncキーワードを付与
const main_process = async (rsv_args) => new Promise((resolve, reject) => {
    if(0==rsv_args%2){
        resolve('divided by two.');
    }else{
        reject(new Error('non divided by two.'));
    }
  }
);

//関数に与える引数がないときは()
//関数定義でもayncキーワードを付与
const post_process = async () => new Promise((resolve,reject)=>{
    try{
        resolve();
        console.log('[success]:post_process.');
    }catch(err){
        reject(new Error('[failed]:post_process.'));
    }
});

//エントリポイントの関数定義
//エントリポイントでayncキーワードを付与
const main = async (init_args) =>{
    await pre_process();
    await main_process(init_args)
        .then((rez)=>{
            console.log(`[success]:${rez}`);
        })
        .catch((rez)=>{
            console.log(`[failed]:${rez}`);
        });
    await post_process();
};

//正常終了の場合
// main(10);

//異常終了の場合
main(9);