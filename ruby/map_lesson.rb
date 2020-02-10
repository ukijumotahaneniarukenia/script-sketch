#!/usr/local/bin/ruby
#https://techracho.bpsinc.jp/hachi8833/2018_07_20/59639

#http://blog.livedoor.jp/sonots/archives/39380434.html

#https://qiita.com/sonots/items/c14b3e3ca8e6f7dfb651#%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AE%E3%83%A1%E3%83%A2%E3%83%AA%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E7%9F%A5%E3%82%8B

require 'objspace'

#https://ref.xaio.jp/ruby/classes/array/map

#https://stackoverflow.com/questions/37264664/how-do-i-display-an-ascii-art-string-in-ruby
def separate(*rcv_args)
  init_args=rcv_args
  rep=init_args[0]
  str=init_args[1]
  rep.times{eval "print str";}
  puts
end

n=[1,2,3,4,5]
p n.map{|item|item}
p n.class
p ObjectSpace.memsize_of(n)#メモリの割当サイズ
p n.object_id.to_s(16)#メモリの割当位置

separate(80,"=")
nn=n.map!{|item|item+1}
nnn=n.map{|item|item+1}

p nn
p nn.class
p ObjectSpace.memsize_of(nn)#メモリの割当サイズ
p nn.object_id.to_s(16)#メモリの割当位置

separate(80,"=")

p nnn
p nnn.class
p ObjectSpace.memsize_of(nnn)#メモリの割当サイズ
p nnn.object_id.to_s(16)#メモリの割当位置

#
#[1, 2, 3, 4, 5]
#Array
#40
#"cfb5e8"
#================================================================================
#[2, 3, 4, 5, 6]
#Array
#80
#"cfb5e8"
#================================================================================
#[3, 4, 5, 6, 7]
#Array
#80
#"e03418"

