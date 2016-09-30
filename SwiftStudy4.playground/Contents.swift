//: 新特效 更加便利的用法

import UIKit

let array1 = [1,3,2,3]
let array2 = ["1","3","2","3"] //发现只能用于数的数组
//从第一个数开始找符合条件的便返回
let first = array1.first { (element) -> Bool in element > 1}
first
let first2 = array1.first { $0 > 1 }
first2
// 下面的代码必须在控制器中执行，用于遍历当前view及其父视图 
//for subview in sequence(first: self.view, next: { $0?.superview }){ debugPrint(subview) }
