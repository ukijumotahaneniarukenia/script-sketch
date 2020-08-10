
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


m5["C"]?.removeFirst()


print(m5["C"]!) //[4, 3, 9]





var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


print(airports) //["DUB": "Dublin", "YYZ": "Toronto Pearson"]




print(airports.keys)//["DUB", "YYZ"]


print(airports.values)//["Dublin", "Toronto Pearson"]


print(airports.first) //Optional((key: "DUB", value: "Dublin"))


print(airports.count) //2


print("空港は\(airports.count)つです") //空港は2つです



if airports.isEmpty {

  print("none")

}else{

  print("a")

}

airports.removeAll()

if airports.isEmpty {

  print("none")

}else{

  print("a")

}



//エントリの追加
airports["LHR"] = "London"



print(airports)//["LHR": "London"]

//エントリの上書き
airports["YVR"] = "Vancouver"


print(airports) //["LHR": "London", "YVR": "Vancouver"]

//エントリが存在している場合

if airports["YVR"] != nil {

  airports["YVR"] = "Vancouver"

}else{

  airports["UNK"] = "うんこ"

}


print(airports)//["YVR": "Vancouver", "LHR": "London"]

//エントリが存在していない場合

if airports["NIL"] != nil {

  airports["YVR"] = "Vancouver"

}else{

  airports["UNK"] = "うんこ"

}

print(airports) //["YVR": "Vancouver", "UNK": "うんこ", "LHR": "London"]


for (k,v) in airports {

  print(k,v)
//YVR Vancouver
//UNK うんこ
//LHR London


}

if airports.values.contains("うんこ") {

  print("UNKOがいます")

}

//自身のクラスで定義したメソッドを呼び出す
//戻り値がオプショナル
func f1(value:Int ,dict:[String:[Int]]) ->String?{

  for (k,v) in dict{

    if(v.contains(value)){

       return k

    }


  }


    return nil

}


let m6 = ["apple":[0,1,2]
,"banana":[2,3,4]
]


print(f1(value:1,dict: m6)) //waring //Optional("apple")

print(f1(value:1,dict: m6)!) //non waring "apple"



var companies = ["AAPL" : "Apple Inc", "GOOG" : "Google Inc", "AMZN" : "Amazon.com, Inc", "FB" : "Facebook Inc"]


//文字列の変数展開 bbみたい

for (key, value) in companies {
    print("\(key) -> \(value)")
//AMZN -> Amazon.com, Inc
//FB -> Facebook Inc
//AAPL -> Apple Inc
//GOOG -> Google Inc

}



let m7 = [
   "A" : 9, "Z" : 3, "D" : 6, "O" : 12
]



//["Z": 3, "D": 6, "O": 12, "A": 9]
print(m7)



//キーソート
let sortedM7 = m7.sorted(){$0.0<$1.0}


print(sortedM7)
//[(key: "A", value: 9), (key: "D", value: 6), (key: "O", value: 12), (key: "Z", value: 3)]


//キーソート 逆順
let revsortedM7 = m7.sorted(){$0.0>$1.0}


print(revsortedM7) //[(key: "Z", value: 3), (key: "O", value: 12), (key: "D", value: 6), (key: "A", value: 9)]







//なぞ
let revValsortedM7 = m7.sorted(){$1.0<$1.0}



print(revValsortedM7)

//バリューソート
let fruitsDict = ["apple": 5, "pear": 9, "grape": 1]
let fruitsValueSortDict = fruitsDict.sorted{ $0.value > $1.value }

print(fruitsValueSortDict) //[(key: "pear", value: 9), (key: "apple", value: 5), (key: "grape", value: 1)]

let fruitsValueRevSortDict = fruitsDict.sorted{ $0.value < $1.value }


print(fruitsValueRevSortDict) //[(key: "grape", value: 1), (key: "apple", value: 5), (key: "pear", value: 9)]


var items = [Int: [String]]()

items[0] = ["Apple","/image/apple.png","29"]
items[1] = ["AAA","/image/aaa.png","29"]
items[2] = ["Banana","/image/banana.png","29"]

print(items) //[1: ["AAA", "/image/aaa.png", "29"], 0: ["Apple", "/image/apple.png", "29"], 2: ["Banana", "/image/banana.png", "29"]]


//マップinリストの場合

//このケースはリストの最初の要素を辞書順に並べる
//比較する際はアンラップしているのも注意
let itemResult = items.sorted { (first: (key: Int, value: [String]), second: (key: Int, value: [String])) -> Bool in
            return first.value.first! < second.value.first!
        }

print (itemResult) //[(key: 1, value: ["AAA", "/image/aaa.png", "29"]), (key: 0, value: ["Apple", "/image/apple.png", "29"]), (key: 2, value: ["Banana", "/image/banana.png", "29"])]


let itemRevResult = items.sorted {(first : (key:Int,value:[String]),second:(key:Int,value:[String])) -> Bool in return first.value.first! > second.value.first!}


print(itemRevResult)//[(key: 2, value: ["Banana", "/image/banana.png", "29"]), (key: 0, value: ["Apple", "/image/apple.png", "29"]), (key: 1, value: ["AAA", "/image/aaa.png", "29"])]



//https://qiita.com/Saayaman/items/e82a09f93bb91409e446

print("Hello, world!")





