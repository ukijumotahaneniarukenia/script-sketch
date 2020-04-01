- IN
  - 3ページぐらい
```
$echo {a..c} | xargs -n1 | nl | while read rn out;do echo "curl -sSL https://qiita.com/ukijumotahaneniarukenia/lgtms?page=$rn>$out";done | bash
```


- CMD

```
$./main {a..c}
```

doneファイルできる

```
$ls -l
total 852
drwxr-xr-x.  2 kuraine kuraine   4096  4月  1 21:16 ./
drwxr-xr-x. 27 kuraine kuraine   4096  4月  1 19:36 ../
-rw-r--r--.  1 kuraine kuraine      6  4月  1 19:35 .gitignore
-rw-r--r--.  1 kuraine kuraine 144151  4月  1 21:15 a
-rw-r--r--.  1 kuraine kuraine  34102  4月  1 21:16 a.done
-rw-r--r--.  1 kuraine kuraine 144373  4月  1 21:15 b
-rw-r--r--.  1 kuraine kuraine  68183  4月  1 21:16 b.done
-rw-r--r--.  1 kuraine kuraine 145721  4月  1 21:15 c
-rw-r--r--.  1 kuraine kuraine 102848  4月  1 21:16 c.done
-rwxr-xr-x.  1 kuraine kuraine 195624  4月  1 21:04 main*
-rw-r--r--.  1 kuraine kuraine   2111  4月  1 19:35 main.md
-rw-r--r--.  1 kuraine kuraine   1637  4月  1 21:06 main.nim
```

- CMD
  - あとはjqに任せる
  - tagは可変であることに気をつける

```
$cat {a..c}.done | jq -c 'paths' | grep article
[3,"user","paginatedArticleLikes","items",0,"article"]
[3,"user","paginatedArticleLikes","items",0,"article","id"]
[3,"user","paginatedArticleLikes","items",0,"article","uuid"]
[3,"user","paginatedArticleLikes","items",0,"article","title"]
[3,"user","paginatedArticleLikes","items",0,"article","likesCount"]
[3,"user","paginatedArticleLikes","items",0,"article","tags"]
[3,"user","paginatedArticleLikes","items",0,"article","tags",0]
[3,"user","paginatedArticleLikes","items",0,"article","tags",0,"name"]
[3,"user","paginatedArticleLikes","items",0,"article","tags",0,"urlName"]
[3,"user","paginatedArticleLikes","items",0,"article","author"]
[3,"user","paginatedArticleLikes","items",0,"article","author","urlName"]
[3,"user","paginatedArticleLikes","items",0,"article","author","profileImageUrl"]
[3,"user","paginatedArticleLikes","items",1,"article"]
[3,"user","paginatedArticleLikes","items",1,"article","id"]
[3,"user","paginatedArticleLikes","items",1,"article","uuid"]
[3,"user","paginatedArticleLikes","items",1,"article","title"]
[3,"user","paginatedArticleLikes","items",1,"article","likesCount"]
[3,"user","paginatedArticleLikes","items",1,"article","tags"]
[3,"user","paginatedArticleLikes","items",1,"article","tags",0]
[3,"user","paginatedArticleLikes","items",1,"article","tags",0,"name"]
[3,"user","paginatedArticleLikes","items",1,"article","tags",0,"urlName"]
[3,"user","paginatedArticleLikes","items",1,"article","author"]
[3,"user","paginatedArticleLikes","items",1,"article","author","urlName"]
[3,"user","paginatedArticleLikes","items",1,"article","author","profileImageUrl"]
[3,"user","paginatedArticleLikes","items",2,"article"]
[3,"user","paginatedArticleLikes","items",2,"article","id"]
[3,"user","paginatedArticleLikes","items",2,"article","uuid"]
[3,"user","paginatedArticleLikes","items",2,"article","title"]
[3,"user","paginatedArticleLikes","items",2,"article","likesCount"]
[3,"user","paginatedArticleLikes","items",2,"article","tags"]
```
