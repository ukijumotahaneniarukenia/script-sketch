#!/usr/bin/env node

const faker = require('faker');

const usage = async (status) =>{
    console.log("please stdin via pipe only.");
    console.log("Usage:");
    let file_name=process.argv[1].replace(/.*\//, '');
    console.log("echo 3 | ./" + file_name + "| jq ");
    process.exit(status);
}

const mock = async(args,status) => new Promise((resolve,reject) => {
    try {
        let db = { dat: [] };
        //console.log(Object.prototype.toString.call(args));//confirm type

        //console.log(args.split(" "));
        let rcv_args=args.split(" ").map(function(ele,idx,ary){
            return ele.replace('\n','');
        });

        // console.log(tmp);
        
        for (let i=1; i<=rcv_args[0]; i++) {
            db.dat.push({
              id: i,
              name: faker.random.words(),
              director: faker.name.firstName() + ' ' + faker.name.lastName(),
              rating: Math.floor(Math.random()*100+1)/10
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