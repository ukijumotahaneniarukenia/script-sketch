//https://techblog.gmo-ap.jp/2018/12/28/puppeteer%E3%81%A7%E3%81%A7%E3%81%8D%E3%82%8B%E3%81%93%E3%81%A8%E3%81%BE%E3%81%A8%E3%82%81/
//https://teratail.com/questions/175113

// puppeteerが起動できないときにトラシュー
// https://github.com/puppeteer/puppeteer/blob/master/docs/troubleshooting.md
// いくつかパッケージいれる

//便利そう
//https://qiita.com/go_sagawa/items/85f97deab7ccfdce53ea

//便利そう
//https://dackdive.hateblo.jp/entry/2015/09/10/100117

//Web Storage
//https://riotz.works/articles/lopburny/2019/09/06/introduction-and-use-of-web-storage/


//... XXX more items
//https://qiita.com/yusukeito58/items/a972af9f1322fe7a4dbb

const puppeteer = require('puppeteer');
const util = require('util');

const main=(async(url,selector)=>{
    const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
    const page = await browser.newPage();
    await page.goto(url, { waitUntil: 'domcontentloaded' });

    //仮引数が_selectorで、実引数がselector
    //ライブラリの関数に引数を与えるときはこの形式で記載する
    let rt_map_liz_done = await page.evaluate((_selector) => {
        let XXX=Array.from(document.querySelectorAll(_selector));
        let rt_map_liz=[];
        for(let i=0;i<XXX.length;i++){
            let rt_map={
                href:XXX[i].href
                ,textContent:XXX[i].textContent
                ,innerHTML:XXX[i].innerHTML
            };
            rt_map_liz.push(rt_map);
        }
        return rt_map_liz;
    },selector);
    await browser.close();

    console.log(util.inspect(rt_map_liz_done, { maxArrayLength: null }));
});

let url='https://ukijumotahaneniarukenia.site/';
let selector="a";

main(url,selector);