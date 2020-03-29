import strutils

let n = @[1,2,3,4,5]

let s=n.join("-")

echo n

echo typeof(n)

echo s

echo typeof(s)


let a = s.split("-")

echo a

echo typeof(a)


#@[1, 2, 3, 4, 5]
#seq[int]
#1-2-3-4-5
#string
