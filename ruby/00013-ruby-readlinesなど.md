- CMD
  - かならずしもanleが便利というわけでもなさそうだ。使い分けていきたい。
```
$seq 10 | xargs -n3 | ruby -e 'p readlines.map{|e|e.chomp.split(" ")}'
[["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10"]]
$seq 10 | xargs -n3 | ruby -e 'p readlines.map(&:chomp)'
["1 2 3", "4 5 6", "7 8 9", "10"]
$seq 10 | xargs -n3 | ruby -e 'p readlines.map{|e|e.chomp.split(" ")}'
[["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10"]]
$seq 2 | ruby -e 'p readlines.map(&:chomp)'
["1", "2"]
$seq 2 | ruby -e 'p readlines'
["1\n", "2\n"]
```
