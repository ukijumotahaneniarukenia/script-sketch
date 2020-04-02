- CMD

```
$ruby -e 'a=[1, 2, 3, nil, ""];b=a.select{|e|true != e.nil?}.map{|e|e.to_s}.select{|e|true != e.empty?}.map{|e|e.to_i};p b'
[1, 2, 3]
```
