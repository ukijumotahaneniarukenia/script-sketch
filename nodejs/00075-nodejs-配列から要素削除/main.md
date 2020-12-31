```
$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)'  {a..c}
[]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' {b..c}
[ 'a' ]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' {a..c}
[]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' {a..b}
[ 'c' ]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' {b..b}
[ 'a', 'c' ]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' {c..c}
[ 'a', 'b' ]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' {a..a}
[ 'b', 'c' ]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' a
[ 'b', 'c' ]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' b
[ 'a', 'c' ]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' c
[ 'a', 'b' ]

$ node -e 'let l=["a","b","c"];ll=process.argv.splice(1);ll.map(e=>{l.splice(l.indexOf(e)===-1?l.length:l.indexOf(e),1);});console.log(l)' {a..d}
[]
```
