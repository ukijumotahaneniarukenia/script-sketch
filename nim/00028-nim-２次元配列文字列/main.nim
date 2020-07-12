import strutils,sequtils

const
     a = @[ "ぽるこ","まるこ","ジーナ"]
     b = @["フィオ", "カーチス"]

var matrix = newSeqWith(a.len, newSeq[string](b.len))

for i, aa in a:
     for j, bb in b:
       matrix[i][j] = aa & "-" & bb
       echo i.intToStr & "," & j.intToStr

echo matrix