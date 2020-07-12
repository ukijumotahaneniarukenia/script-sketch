import strutils,sequtils

const
     a = @[ 0,  1,  2,  3,  4,  5]
     b = @[10, 11, 12, 13, 14, 15]

var matrix = newSeqWith(a.len, newSeq[int](b.len))

for i, aa in a:
     for j, bb in b:
       matrix[i][j] = aa + bb
       echo i.intToStr & "," & j.intToStr

echo matrix
