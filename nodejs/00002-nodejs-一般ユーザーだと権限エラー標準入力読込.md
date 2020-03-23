- CMD

```
$node -e 'let stdin=require("fs").readFileSync("/dev/stdin","utf8");'
```


- OUT

```
internal/fs/utils.js:230
    throw err;
    ^

Error: EACCES: permission denied, open '/dev/stdin'
    at Object.openSync (fs.js:457:3)
    at Object.readFileSync (fs.js:359:35)
    at [eval]:1:25
    at Script.runInThisContext (vm.js:120:20)
    at Object.runInThisContext (vm.js:311:38)
    at Object.<anonymous> ([eval]-wrapper:10:26)
    at Module._compile (internal/modules/cjs/loader.js:1158:30)
    at evalScript (internal/process/execution.js:94:25)
    at internal/main/eval_string.js:23:3 {
  errno: -13,
  syscall: 'open',
  code: 'EACCES',
  path: '/dev/stdin'
}
```
