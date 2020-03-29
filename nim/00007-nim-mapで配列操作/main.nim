import sequtils
import sugar

# Creating a sequence from 1 to 10, multiplying each member by 2,
# keeping only the members which are not divisible by 6.
#let
#  foo = toSeq(1..10).map(x => x*2).filter(x => x mod 6 != 0)
#  bar = toSeq(1..10).mapIt(it*2).filterIt(it mod 6 != 0)

#doAssert foo == bar
#echo foo                  # @[2, 4, 8, 10, 14, 16, 20]
#
#echo foo.any(x => x > 17) # true
#echo bar.allIt(it < 20)   # false
#echo foo.foldl(a + b)     # 74; sum of all members





let u = toSeq(1..10)


echo u.foldl(a+b)

echo u.foldl(a-b)

echo u.foldl(a*b)

echo u.foldr(a+b)

echo u.foldr(a-b)

echo u.map(x=>x*2)

echo u.map(x=>x)


echo u.filter(x => x mod 2 != 0)


let words = @["nim", "is", "cool"]


echo foldl(words, a & b)
echo foldr(words, a & b)
