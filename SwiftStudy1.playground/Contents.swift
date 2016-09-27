//: 2016-9-27 过一遍基本变量常量、基本数据量类型、分支结构、集合

import UIKit

//:输出
print("Hello World")

//:变量 var
var number = 1;

//:常量 let
let name = "Louis"

//:基本数据类型
let int : Int = 1
let float : Float = 1.0
let double : Double = 1.0
let string : String = "你好，加油！"

//:类型转换
let string1 = String(int)
let int1 = Int(string1)

//:字符串拼接 \()
let appendStr = "\(string)我叫\(name)."


//:可选类型
var optionStr : String? = nil
optionStr = "hi"

//:数组
var arr = [String]()
var array : [String] = ["a","b","c"]
array[1]

//确定类型的数组可以这样初始化
array = []

//:字典
var dic = [String :String]()
var dict : [String : String] = ["a":"1","b":"2"]
dict["a"]

//确定类型的字典可以这样初始化
dict = [:]

//:条件结构 if...else
var numbers : [Int] = [1,2,3,4,5]
for number in numbers {
    if number <= 3 {
        print("小于等于三\(number)")
    }else
    {
        print("否则\(number)")
    }
    
    
}

//while
var i = 5
while i > 0 {
    i -= 1
    print("\(i)")
}

//repeat...while
repeat {
    i += 1
    print("\(i)")
}while i < 5

//:可以选类型判断不为空
var myName : String? = nil

if let name = myName {
    
}else{
    print("名字为空")
}

//可选类型设置默认值

var theName = myName ?? name

//:swith

let something = "redcolor"
switch something {
case "son":
    print("son")
case "ccc","bbb":
    print("ccc bbb")
case let x where x.hasPrefix("red"):
    print("red")
default:
    print("I don't known.")
}

//: forin 中的元组
let interestintNumbers = [
    "ball" : ["1","2","3"],
    "eat" : ["4","5","6"]
]
for (key , valus) in interestintNumbers {
    print("key:\(key),valus:\(valus)")
}

//:forin 的新特性

for i in 0..<4 {
    print("\(i)")
}
for i in 0...4 {
    print("\(i)")
}

//:集合
//:有序集合 数组
var fiveInts = [1,3,2,4,5]

//增加
fiveInts.append(6)
fiveInts.insert(7, at: 0)
//减少
fiveInts.remove(at: 0)
fiveInts.removeLast()

//替换
fiveInts[0...0] = [4,2]

fiveInts

//枚举器

for (index,valus) in fiveInts.enumerated() {
    print("index:\(index),valus:\(valus)")
}


//:无序集合 set
var set = [8,0,1,2,3,4]
//只能包含被hash的基本数据类型
let int2 :Int = 1
int2.hashValue
let str2 : String = "a"
str2.hashValue

for numbers in set {
    print("\(numbers)")
}

for number in set.sorted() {
    print("\(number)")
}

//Set的交补并 子集
var va : Set = [1,2,3,4]
var vb : Set = [4,5,6]

//交集
var vc = va.intersection(vb)

//并
var vd = va.union(vb)

//异或
var ve = va.symmetricDifference(vb)

//补
let vf = va.subtracting(vb)

//子
var child = va.isSubset(of: vb)
var child2 = va.isSubset(of: vd)

var set2 : Set = [5,4,6]
var child3 = vb.isStrictSubset(of: set2)

var diff = vc.isDisjoint(with: vf)

//:字典
dict = ["1":"a","2":"b"]

//组数
dict.count

//判断空
dict.isEmpty

//赋值
dict["1"] = "c"
dict.updateValue("2", forKey: "2")

//移除
dict["1"] = nil
dict.removeValue(forKey: "2")

dict

var dict2 = [1:"a",2:"b"]

//取key value 为数组

var keys = [Int](dict2.keys)
var valus = [String](dict2.values)



































