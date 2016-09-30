//: 9.30 - 错误处理 泛型

import UIKit

//:错误处理 

//先声明一个错误的枚举
enum MyError : Error{
    case aError
    case bError
    case cError
}

//声明一个方法：传一个string 如果为以上错误类型则抛出异常
func tryError(any: String) throws -> String{
    if any == "a" {
        throw MyError.aError
    }else if any == "b"{
        throw MyError.bError
    }else if any == "c"{
        throw MyError.cError
    }
    return "hehe"
}

//获取错误之后程序会继续运行
do{
    try tryError(any: "c")
    try tryError(any: "b")
}catch MyError.aError
{
    print("agg")
}catch{
    print(error)
}

let hehe1 = try? tryError(any: "a") //这里不加？ 程序就会中止
let hehe2 = try? tryError(any: "d")
print(hehe1)

print("aaa")


// defer 关键字 延后执行 上层代码执行结束后再执行的代码 栈的原理

func deferTest(){
    print(1)
    defer {
        defer {
            print(6)
        }
        print(4)
        defer {
            print(5)
        }
    }
    print(2)
    defer {
        print(3)
    }
}
deferTest()

//:泛型 代表某一种类型 Generics 

//生成某一类型的数组
func makeArray<GenericsName>(repating item:GenericsName, numberOfTimes: Int) -> [GenericsName]{
    var result = [GenericsName]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repating: 1, numberOfTimes: 3)
makeArray(repating: "a", numberOfTimes: 3)


//泛型也可用于 枚举和自定义类型

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


//where 用于泛型判断 是否遵守协议 是否相等 是否是另一个类的超类。。
func whereTest<T>(a: T, b :T) -> Bool
    where T:Equatable{
    return true
}

whereTest(a: 1, b: 1)
//whereTest(a: [1], b: [1]) //[1]不遵循Equatable 所以编译错误



























