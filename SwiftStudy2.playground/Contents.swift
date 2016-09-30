//: 9.28 - 9.29 方法、闭包、类、枚举、自定义类型 、协议、扩展

import UIKit

//:方法 func

//定义
func add (number1: Int ,number2: Int) -> Int{
    return number1 + number2
}
//省略参数
func del (_ number1: Float ,number2: Float) -> Float{
    return number1 - number2
}
//别名参数
func del2 (a number1: Float ,b number2: Float) -> Float{
    return number1 - number2
}
//调用
let and = add(number1:  5, number2: 5)
let de = del(0, number2: 5.0)
let de2 = del2(a: -3, b: -4.5)

//返回值可以是元组
func insteadLocation (a number1: Float ,b number2: Float) -> (x: Float ,y:Float){
    return (number2 , number1)
}
insteadLocation(a: 100.0, b: 200.0)

//参数可以多个 ...
func sumOf(numbers: Int...) -> Int{
    var sum = 0;
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(numbers: 1,2,3,4,5)

//内嵌方法 和 inout 修改传入的变量
func inHavefun(number: inout Int) -> Int{
    var x = 100
    func add(){
        number = x + number
    }
    add()
    return number
}
var a = 10
inHavefun(number: &a)

//返回方法的方法
func returnAddFunc(number: Int) -> ((Int) -> Int)
{
    func add(number: Int) -> Int {
        return number + 1
    }
    return add
}
var addF = returnAddFunc(number: 0)

addF(1)

//方法作为参数 
//参数是一个数组 和 一个 (Int ,Int) -> Int 类型的方法 返回 一个结果
func hasAnyMatches(numbers: [Int], youFun: (Int ,Int) -> Int) -> Int{
    var result = 0
    for number in numbers {
        result = youFun(number,result)
    }
    return result
}
let myNumbers = [1,2,3]
//方法为加
hasAnyMatches(numbers: myNumbers, youFun: add)

func del (_ number1: Int ,number2: Int) -> Int{
    return number1 - number2
}
//方法为减
hasAnyMatches(numbers: myNumbers, youFun: del)

//:闭包 closures in 前为返回值 后为实现

hasAnyMatches(numbers: myNumbers, youFun: {
    (a: Int, b: Int) -> Int in
    return a * b
})

//map 为遍历从第一个元素一个一个往后获取
//每个元素加1
var addNumber = myNumbers.map { (a: Int) -> Int in
    var result = 1
    return result + a
}
//简单一点
addNumber = myNumbers.map({ a in
    return a + 1
})
//更加简单的写法 $0 代表第一个元素
addNumber = myNumbers.map{$0 + 1}

print(addNumber)

//sort 排序 sort 直接改本身 sorted 会返回一个新数组 不会改变本身
var sortNumbers = [9,1,7,0,2]
sortNumbers.sort{$0 < $1}
print(sortNumbers)
sortNumbers.sorted{$0 > $1}
print(sortNumbers)
print(sortNumbers.sorted{$0 > $1})
sortNumbers.sorted{ (a: Int ,b: Int) -> Bool in
    return a > b
}


print("_______")
//:类 class
class Man{
    dynamic var name = "Louis"
    dynamic func say(something: String) -> Void {
        print("\(name) say \(something)")
    }
    dynamic func say2(something: String) -> Void {
        print("no say!!")
    }

}
//——————————————————————试试用runtime 改变类的方法

//先写一个更换方法的函数
func swizzleMethod(cls:AnyClass!, originMethod:Selector, destinationMethod:Selector){
    // class_getInstanceMethod 获取对象方法
    // class_getClassMethod 获取类方法
    let origin = class_getInstanceMethod(cls, originMethod)
    let swiz = class_getInstanceMethod(cls, destinationMethod)
    
    method_exchangeImplementations(origin, swiz)
}

var man = Man()

swizzleMethod(cls: object_getClass(man), originMethod: #selector(Man.say(something:)), destinationMethod: #selector(Man.say2(something:)))

//—————————————————————— 玩乐玩完了 goon

man.say(something: "Hello")

//init 初始化方法
class Person: NSObject{
    var name :String
    init(name :String) {
        self.name = name
    }
    override init() {
        self.name = "A"
    }
    func sayHi() {
        print("person")
    }
}
//由于 重写了init 方法所有 一下代码报错 若想保留原来的init 方法 可以 加上面的代码
//let person1 = Person()


//继承 没继承的Class 默认 继承 NSObject
class Father : Person{
    var sex :String = "Fale"
    init(name: String , sex :String) {
        //子类init中要调用父类init方法，不然编译不通过
        super.init()
        self.sex = sex
        self.name = name
    }
    override func sayHi() {
        print("\(name)叫你回家吃饭了")
    }
    
}
let father1 = Father(name: "你爸", sex: "♂")
father1.sayHi()

// get set 方法是自带的
father1.name
father1.name = "老王"

father1.sayHi()

//把属性设为只读
class son: Person
{
    var niki: String {
        get{
            return "👶"
        }
    }
    var niki2 : String = "1"
    //必须有 get set可无
    var wife: String?
    
}

let son1 = son(name: "宝强")
son1.niki
//son1.niki = "baba"

//计算属性
class Triangle {
    var length :Double
    
    var perimeter :Double{
        get{
            return length * 3
        }
        set{
            length = newValue/3
        }
    }
    
    init(length: Double) {
        self.length = length
        self.perimeter = 3 * length
    }
}

var triangle1 = Triangle(length: 10)
triangle1.perimeter = 100
print(triangle1.length)

// willSet didSet 用于不需要计算属性 但还是需要在set前后做事情

class someClass {
    var a :Int{
        willSet{
            print("a will set")
        }
        didSet{
            print("a did set")
        }
    }
    init(a :Int) {
        self.a = a
    }
}

let someClass1 = someClass(a: 10)
someClass1.a = 20

//对象的可选类型 如果对象用了? 可避免为nil的奔溃 返回可选类型
let someClass2 :someClass? = nil
let somea = someClass2?.a
type(of: somea)
//let someb = someClass2!.a


//:枚举 enumeration 可以绑定的不止是整数 可以是任意类型
enum Season : String //这里绑定字符串
{
    case spring = "a"
    case summer = "b"
    case autumn = "c"
    case winter = "d"
    func printSeason() {
        switch self {
        case .spring:
            print("春天")
        default:
            print("其他")
        }
    }
}

let spring = Season.spring
//枚举方法
spring.printSeason()
//绑定值
spring.rawValue
//根据绑定值获取枚举内容 注 结果为可选
if let summer = Season.init(rawValue: "b") {
    summer.printSeason()
}

//:自定义类型 struct

struct Location {
    var season : Season
    var x : Float
    var y : Float
    
    func description() -> Void {
        print("\(self.season) in (\(x),\(y))")
    }
}

let location = Location(season: spring, x: 100.2, y: 20.3)
location.description()

//枚举还可以多值绑定 暂时没想到可以做什么 获取官方的例子
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}

//:协议
protocol MyRule{
    var money : Int { get set }
    var time : Int { get }
    mutating func happyToDie() //struct enum 要 遵循协议方法就要加 mutating
}

class Louis : MyRule
{
    internal func happyToDie() {
        time = 0
        money = 0
    }

    var time: Int = 10000

    var money: Int = 99999
    
    func work() {
        time -= 100
        money += 1000
    }
}


struct LouisType : MyRule
{

    mutating func happyToDie() {
        time = 0
        money = 0
    }
    
    var time: Int = 10000
    
    var money: Int = 99999
}

//:扩展
extension Int : MyRule
{
    internal var money: Int {
        get {
            return 0
        }
        set {
            money = newValue/2
        }
    }

    mutating func happyToDie() {
//        time = 0 //这里set 就会报错呢 为什么class/struct没报错呢??
        money = 0
    }
    
    var time :Int {
        
        return 1000
        
    }

}














