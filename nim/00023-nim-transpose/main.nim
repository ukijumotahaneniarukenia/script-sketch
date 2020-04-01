#5行3列
let a = @[@[0, 5, 1], @[1, 6, 0], @[2, 7, 0], @[3, 8, 0], @[4, 9, 42]]

#3行5列
let b = @[@[ 0, 1, 2, 3, 4],
          @[ 5, 6, 7, 8, 9],
          @[ 1, 0, 0, 0,42]]

func transpose[T](s:seq[seq[T]]):seq[seq[T]] =
  var rt = newSeq[seq[T]]()
  for i in 0 .. len(s[0])-1:
    var tmp = newSeq[T]()
    for j in 0 .. len(s)-1:
      tmp.add(s[j][i])
    rt.add(tmp)
  return rt

echo a
echo transpose(a)

echo b
echo transpose(b)
