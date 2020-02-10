
ポジション気をつけて

```
irb(main):001:0> s=12345
irb(main):002:0> s
=> 12345
irb(main):003:0> s.to_s
=> "12345"
irb(main):004:0> s.to_s.slice(0..1)
=> "12"
irb(main):005:0> s.to_s.slice(0..0)
=> "1"
irb(main):008:0> s.to_s.slice(0..s.to_s.length)
=> "12345"
irb(main):009:0> s.to_s.slice(0..s.to_s.length-1)
=> "12345"
irb(main):010:0> s.to_s.slice(0..s.to_s.length-2)
=> "1234"
irb(main):011:0> s.to_s.slice(1..s.to_s.length-2)
=> "234"
```
