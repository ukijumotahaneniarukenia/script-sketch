require 'uconv'

#apt install -y ruby-uconv

#https://magazine.rubyist.net/articles/0009/0009-BundledLibraries.html

s="うんこ"

p Uconv.u8tou16(s).bytes
p Uconv.u8tou4(s).bytes
