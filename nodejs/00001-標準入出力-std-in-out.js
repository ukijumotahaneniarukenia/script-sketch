#!/usr/bin/env node

const usage = async (status) =>{
    console.log("please stdin via pipe only.");
    console.log("Usage:");
    process.exit(status);
}

const main = async (status) =>{
    if(process.argv[2]){
        usage(1);
    }
    process.exit(status);

};

main(0);