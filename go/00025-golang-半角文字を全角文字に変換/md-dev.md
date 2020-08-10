
```
$ export GOPATH=$(pwd)

$ time go get -u golang.org/x/text/widt

real	0m16.400s
user	0m3.543s
sys	0m0.863s




$ ( export GOPATH=$(pwd) && cd src/main && go install )


$ ./bin/main


半角: 123XYZ
全角: １２３ＸＹＺ
```
