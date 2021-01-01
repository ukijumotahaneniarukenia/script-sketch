```
$ node -p 'l=process.argv.splice(1);function unko(l){return l.reduce((e,a)=>{return e+a})};unko([...unko([...unko(l)])])' {a..e}
abcde

$ node -p 'l=process.argv.splice(1);function u(l){return l.reduce((e,a)=>{return e+a})};function uw(s,i,p){r="";for(n=0;n<i;n++){r=r+(n===0?"":p)+u([...s]);};return r;};r=uw("a b c",3,"A");' {a..e}

a b cAa b cAa b c
```
