参考になるソース

- https://github.com/webpack/webpack/blob/master/bin/webpack.js

```
$ node -e 'const r=require("readline");const q=`Output Unko Today?`;const I=r.createInterface({input:process.stdin,output:process.stderr});I.question(q,(a)=>{I.close();if(a==="うんこ"){console.log(a+"モリモリ森鴎外")}else if(a==="モリモリ"){console.log("うんこ"+a+"森鴎外")}else{console.log("うんこモリモリ森鴎外")};});'<<<モリモリ

Output Unko Today?モリモリ
うんこモリモリ森鴎外

$ node -e 'const r=require("readline");const q=`Output Unko Today?`;const I=r.createInterface({input:process.stdin,output:process.stderr});I.question(q,(a)=>{I.close();if(a==="うんこ"){console.log(a+"モリモリ森鴎外")}else if(a==="モリモリ"){console.log("うんこ"+a+"森鴎外")}else{console.log("うんこモリモリ森鴎外")};});'<<<うんこ
Output Unko Today?うんこ
うんこモリモリ森鴎外

$ node -e 'const r=require("readline");const q=`Output Unko Today?`;const I=r.createInterface({input:process.stdin,output:process.stderr});I.question(q,(a)=>{I.close();if(a==="うんこ"){console.log(a+"モリモリ森鴎外")}else if(a==="モリモリ"){console.log("うんこ"+a+"森鴎外")}else{console.log("うんこモリモリ森鴎外")};});'<<<""
Output Unko Today?
うんこモリモリ森鴎外


const readLine = require("readline");

const question = `Output Unko Today?`;

const questionInterface = readLine.createInterface({
  input: process.stdin,
  output: process.stderr,
});

questionInterface.question(question, (answer) => {
  questionInterface.close();

  console.log(answer);

  switch (answer) {
    case value:

      break;

    default:

      break;
  }
});
```
