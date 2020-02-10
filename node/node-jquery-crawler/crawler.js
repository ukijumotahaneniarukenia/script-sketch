//https://qiita.com/ledsun/items/0965a60f9bdff04f2fa0#jsdom
//https://teratail.com/questions/119949
//https://qiita.com/tashxii/items/7c86f39fced68ea9903d
//https://qiita.com/ef81sp/items/29b7b91a3f3e77cf2233


//puppeteerが使えないとだめっぽい
//https://teratail.com/questions/175113

const request=require('request');
const {JSDOM}=require('jsdom');
const jquery = require('jquery');

//関数定義
const get_html=async(url)=>new Promise((resolve,reject)=>{
    try {
        request(url,(error,response,body)=>{
            return resolve(body);
        });
    } catch (error) {
        return reject(error);
    }
});

const querySelectorAll=async(html_str)=>new Promise((resolve,reject)=>{
    try {
        let dom=new JSDOM(html_str);
        let rt=dom.window.document
        console.table(rt);
        return resolve(rt);
    } catch (error) {
        return reject(error);        
    }
});

const main=async(init_args)=>{
    try {
        //URLからHTML文字列を取得
        let rt=await querySelectorAll(get_html(init_args));
        // console.log(rt);
        //HTML文字列からjqueryオブジェクトを生成
        // let rt=await querySelectorAll(html_txt);
        // console.log(jquery_obj);
        // console.log(rt);
    } catch (error) {
        console.error(error);
    }
};

main('https://ukijumotahaneniarukenia.site/');