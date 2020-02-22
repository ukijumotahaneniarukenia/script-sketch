#!/usr/bin/env node

const xml2json=require('xml2json');

const usage = async (status) =>{
    console.log("please stdin via pipe only.");
    console.log("Usage:");
    let file_name=process.argv[1].replace(/.*\//, '');
    console.log("cat test.xml | ./" + file_name + "| jq '.|fromjson' | gron | perl -pe 's; = .*;;g;' | perl -pe 's;json;/root;' | perl -pe 's;\\.;/;g'");
    process.exit(status);
}

const mock = async(args,status) => new Promise((resolve,reject) => {
    try {
        let json=xml2json.toJson(args);
        console.log(JSON.stringify(json));
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
