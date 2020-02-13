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
    process.stdout.write(require('fs').readFileSync('/dev/stdin','utf8'));//non lf
    process.exit(status);

};

main(0);