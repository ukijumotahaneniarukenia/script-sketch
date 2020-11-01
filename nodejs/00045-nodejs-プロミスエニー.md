CMD

```
$ node -e 'Promise.any([Promise.resolve(1)]).then(r=>{console.log(r)})'
```

OUT

```
[eval]:1
Promise.any([Promise.resolve(1)]).then(r=>{console.log(r)})
        ^

TypeError: Promise.any is not a function
    at [eval]:1:9
    at Script.runInThisContext (vm.js:120:18)
    at Object.runInThisContext (vm.js:309:38)
    at Object.<anonymous> ([eval]-wrapper:10:26)
    at Module._compile (internal/modules/cjs/loader.js:1015:30)
    at evalScript (internal/process/execution.js:94:25)
    at internal/main/eval_string.js:23:3
```


CMD

```
$ node -e 'Promise.any([Promise.reject(1)]).then(r=>{console.log(r)})'
```

OUT

```
[eval]:1
Promise.any([Promise.reject(1)]).then(r=>{console.log(r)})
        ^

TypeError: Promise.any is not a function
    at [eval]:1:9
    at Script.runInThisContext (vm.js:120:18)
    at Object.runInThisContext (vm.js:309:38)
    at Object.<anonymous> ([eval]-wrapper:10:26)
    at Module._compile (internal/modules/cjs/loader.js:1015:30)
    at evalScript (internal/process/execution.js:94:25)
    at internal/main/eval_string.js:23:3
```

CMD

```
$ node -e 'Promise.any([Promise.reject(1),Promise.resolve(9)]).then(r=>{console.log(r)})'
```

OUT

```
[eval]:1
Promise.any([Promise.reject(1),Promise.resolve(9)]).then(r=>{console.log(r)})
        ^

TypeError: Promise.any is not a function
    at [eval]:1:9
    at Script.runInThisContext (vm.js:120:18)
    at Object.runInThisContext (vm.js:309:38)
    at Object.<anonymous> ([eval]-wrapper:10:26)
    at Module._compile (internal/modules/cjs/loader.js:1015:30)
    at evalScript (internal/process/execution.js:94:25)
    at internal/main/eval_string.js:23:3
```
