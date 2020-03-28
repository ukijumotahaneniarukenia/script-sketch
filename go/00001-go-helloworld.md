- CMD

```
$cat 00001-go-helloworld.go
package main

import(
  "fmt"
)

func main(){
  fmt.Println("HELLO,WORLD!")
}
```

- EXEC

```
$go run 00001-go-helloworld.go
HELLO,WORLD!
```

- COMPILE

```
$ll
total 1984
drwxr-xr-x.  2 kuraine kuraine    4096  3月 28 14:49 ./
drwxr-xr-x. 72 kuraine kuraine    4096  3月 28 14:16 ../
-rwxr-xr-x.  1 kuraine kuraine 2008801  3月 28 14:49 00001-go-helloworld*
-rw-r--r--.  1 kuraine kuraine      78  3月 28 14:46 00001-go-helloworld.go
-rw-r--r--.  1 kuraine kuraine     182  3月 28 14:48 00001-go-helloworld.md
```

- EXEC

```
$./00001-go-helloworld
HELLO,WORLD!
```

- FMT

```
$go fmt 00001-go-helloworld.go
00001-go-helloworld.go
```
