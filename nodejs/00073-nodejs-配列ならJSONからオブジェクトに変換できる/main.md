```
$ echo '{"name":"うんこ"}' | node -p ''
[stdin]:1
{"name":"うんこ"}
       ^

SyntaxError: Unexpected token ':'
    at new Script (vm.js:101:7)
    at createScript (vm.js:262:10)
    at Object.runInThisContext (vm.js:310:10)
    at internal/process/execution.js:77:19
    at [stdin]-wrapper:6:22
    at evalScript (internal/process/execution.js:76:60)
    at internal/main/eval_stdin.js:29:5
    at Socket.<anonymous> (internal/process/execution.js:205:5)
    at Socket.emit (events.js:327:22)
    at endReadableNT (internal/streams/readable.js:1327:12)
```

便利
```
$ echo '{"name":"うんこ"}' | jq -s '' | node -p ''
[ { name: 'うんこ' } ]
```
