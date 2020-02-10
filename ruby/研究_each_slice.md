

```
$sed -n '27,38p' ./template/unicode_norm_gen.tmpl
    def each_slice(n)
      ary = []
      each do |i|
        ary << i
        if ary.size >= n
          yield ary
          ary = []
        end
      end
      yield ary unless ary.empty?
      self
    end
```
