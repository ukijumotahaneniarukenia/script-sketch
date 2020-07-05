```
node -e 'a="a";if(a){console.log(true)}else{console.log(false)}'
true

node -e 'a="a";if(!a){console.log(true)}else{console.log(false)}'
false

node -e 'a=undefined;if(!a){console.log(true)}else{console.log(false)}'
true

node -e 'a=undefined;if(a){console.log(true)}else{console.log(false)}'
false


node -e 'a="";if(!a){console.log(true)}else{console.log(false)}'
true


node -e 'a="";if(a){console.log(true)}else{console.log(false)}'
false

node -e 'a=0;if(!a){console.log(true)}else{console.log(false)}'
true

node -e 'a=0;if(a){console.log(true)}else{console.log(false)}'
false

node -e 'a={};if(a){console.log(true)}else{console.log(false)}'
true


node -e 'a={};if(!a){console.log(true)}else{console.log(false)}'
false

node -e 'a=[];if(a){console.log(true)}else{console.log(false)}'
true

node -e 'a=[];if(!a){console.log(true)}else{console.log(false)}'
false

node -e 'a={};console.log(a.length)'
undefined

node -e 'a=[];console.log(a.length)'
0

node -e 'a="";console.log(a.length)'
0
```
