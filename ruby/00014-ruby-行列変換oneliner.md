- CMD
  - 行列欠損ありもなしも同じでOK
```

$seq 10 | xargs -n2 | ruby -e 'a=readlines.map{|e|e.chomp.split(" ")};m=a[0].size;a.map{|e|e.fill("NA",e.size,m-1) if m!=e.size};p a.transpose'
[["1", "3", "5", "7", "9"], ["2", "4", "6", "8", "10"]]
$seq 10 | xargs -n2 | ruby -e 'a=readlines.map{|e|e.chomp.split(" ")};m=a[0].size;a.map{|e|e.fill("NA",e.size,m-1) if m!=e.size};p a'
[["1", "2"], ["3", "4"], ["5", "6"], ["7", "8"], ["9", "10"]]


$seq 10 | xargs -n3 | ruby -e 'a=readlines.map{|e|e.chomp.split(" ")};m=a[0].size;a.map{|e|e.fill("NA",e.size,m-1) if m!=e.size};p a'
[["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10", "NA", "NA"]]
$seq 10 | xargs -n3 | ruby -e 'a=readlines.map{|e|e.chomp.split(" ")};m=a[0].size;a.map{|e|e.fill("NA",e.size,m-1) if m!=e.size};p a.transpose'
[["1", "4", "7", "10"], ["2", "5", "8", "NA"], ["3", "6", "9", "NA"]]

```
