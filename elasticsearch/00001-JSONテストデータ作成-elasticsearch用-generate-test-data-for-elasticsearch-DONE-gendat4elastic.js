#!/usr/bin/env node

const faker = require('faker');

const usage = async (status) =>{
    console.log("please stdin via pipe only.");
    console.log("Usage:");
    let file_name=process.argv[1].replace(/.*\//, '');
    console.log("echo 3 | ./" + file_name + "| jq '.[\"items\"]'");
    //echo 3 | ./00005-JSONテストデータ作成-elasticsearch用-generate-test-data-for-elasticsearch-DONE-gendat4elastic.js| jq '.["items"]'| jq -c 'to_entries|map([{index:{"_id":(.key+1)|tostring}},.value])|flatten|.[]'
    process.exit(status);
}

const mock = async(args,status) => new Promise((resolve,reject) => {
    try {
        let db = { items: [] };
        let rcv_args=args.split(" ").map(function(ele,idx,ary){
            return ele.replace('\n','');
        });
        let dtm = new Date();
        //https://www.webprofessional.jp/mock-rest-apis-using-json-server/
        for (let i=1; i<=rcv_args[0]; i++) {
            db.items.push({
              id: i,
              title: faker.random.words(),
              tag: faker.random.words(),
              updated:dtm.getTime()+faker.random.number(1,1000000),
              crawled:dtm.getTime()+faker.random.number(1000001,10000000),
              published:dtm.getTime(),
              url: "https://"+faker.random.words().replace(/\s{1,}/g,'-')
            });
        }
        console.log(JSON.stringify(db));
        resolve();
    } catch (error) {
        reject(new Error(error));
    }
});

const main = async (status) =>{
    if(process.argv[2]){
        usage(0);
    }
    let stdin=require('fs').readFileSync('/dev/stdin','utf8');
    await mock(stdin);
    process.exit(status);
};

main(0);
