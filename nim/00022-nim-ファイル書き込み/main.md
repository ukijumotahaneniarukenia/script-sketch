- IN

```
$ls test* | grep -v done
test-nlp.txt
test.csv
test.tsv
```

- CMD

```
$ls test* | grep -v done | ./main
```

- OUT

```
$ll
total 220
drwxr-xr-x.  2 kuraine kuraine   4096  4月  1 15:40 ./
drwxr-xr-x. 26 kuraine kuraine   4096  4月  1 15:39 ../
-rw-r--r--.  1 kuraine kuraine      6  4月  1 14:47 .gitignore
-rwxr-xr-x.  1 kuraine kuraine 182080  4月  1 15:37 main*
-rw-r--r--.  1 kuraine kuraine      0  4月  1 15:39 main.md
-rw-r--r--.  1 kuraine kuraine   1306  4月  1 15:38 main.nim
-rw-r--r--.  1 kuraine kuraine    535  4月  1 14:47 test-nlp.txt
-rw-r--r--.  1 kuraine kuraine    535  4月  1 15:40 test-nlp.txt.done
-rw-r--r--.  1 kuraine kuraine    198  4月  1 14:47 test.csv
-rw-r--r--.  1 kuraine kuraine    307  4月  1 15:40 test.csv.done
-rw-r--r--.  1 kuraine kuraine    198  4月  1 14:47 test.tsv
-rw-r--r--.  1 kuraine kuraine    307  4月  1 15:40 test.tsv.done
```

- CMD

```
$ls test* | grep -v done | ./main
```

- OUT
  - 同じコマンドを打って時刻だけが変わった
  - それが大事
```
$ll
total 220
drwxr-xr-x.  2 kuraine kuraine   4096  4月  1 15:41 ./
drwxr-xr-x. 26 kuraine kuraine   4096  4月  1 15:39 ../
-rw-r--r--.  1 kuraine kuraine      6  4月  1 14:47 .gitignore
-rwxr-xr-x.  1 kuraine kuraine 182080  4月  1 15:37 main*
-rw-r--r--.  1 kuraine kuraine      0  4月  1 15:39 main.md
-rw-r--r--.  1 kuraine kuraine   1306  4月  1 15:38 main.nim
-rw-r--r--.  1 kuraine kuraine    535  4月  1 14:47 test-nlp.txt
-rw-r--r--.  1 kuraine kuraine    535  4月  1 15:41 test-nlp.txt.done
-rw-r--r--.  1 kuraine kuraine    198  4月  1 14:47 test.csv
-rw-r--r--.  1 kuraine kuraine    307  4月  1 15:41 test.csv.done
-rw-r--r--.  1 kuraine kuraine    198  4月  1 14:47 test.tsv
-rw-r--r--.  1 kuraine kuraine    307  4月  1 15:41 test.tsv.done
```
