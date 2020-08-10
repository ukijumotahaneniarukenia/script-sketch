
//辞書型のコンストラクタの初期化
var m1 = [Int:String]()


print(m1) //[:]


//辞書型のコンストラクタの初期化 その２
var m2:[Int:String]=[:]


print(m2) //[:]


m2[-1]="ポルコ"

print(m2) //[-1: "ポルコ"]


m2[0]="まるこ"
m2[1]="うんこ"
print(m2) //[0: "まるこ", 1: "うんこ", -1: "ポルコ"]


//デフォで値を設定

var m3:[String: String] = ["氏名":"ポルコ","年齢":"23"]


print(m3) //["年齢": "23", "氏名": "ポルコ"]

//型推論
var m4 = ["氏名":"ちびまるこ","年齢":"23"]


print(m4)//["年齢": "23", "氏名": "ちびまるこ"]


//マップinリスト
var m5 = [

  "A" : [1,2,3]

  ,"B" : [2,3,4]

  ,"C" : [3,4,5]
]

print(m5)


let optionalNumber: Int? = 3

print(optionalNumber) //warning
print(optionalNumber as Any) //no warning


print(optionalNumber!) //no warning

print(m5["A"]!.max()) //warning 3
print(m5["A"]!.min()) //warning 1

print(m5["B"]!.max()!) //no warning 4
print(m5["B"]!.min()!) //no warning 2




let numbers = [3, 7, 4, -2, 9, -6, 10, 1]

//最初の負の数
//https://developer.apple.com/documentation/swift/array/1848165-first
print(numbers.first(where: {$0 < 0})!) //-2

//負の数すべて
print(numbers.filter({$0 < 0})) //[-2,-6]


print(numbers.last(where: {$0 < 0})!) //-6



print(numbers.last!) //1


print(m5["C"]!.filter({$0 == 4})) //no warning [4]

m5["C"]!.reverse() //no warning ()

print(m5["C"]) //Optional([5, 4, 3])


print(m5["C"]!) // [5, 4, 3]


m5["C"]?.append(9)

//https://developer.apple.com/documentation/swift/array
print(m5["C"]!) //[5, 4, 3, 9]





























print("Hello, world!")
