//: Playground - noun: a place where people can play

import Foundation


func intersections(arr1: [Int], arr2: [Int]) -> [Int : Int] {
    var arrDic: [Int : Int] = [:]
    
    let uniq1 = cntOfElement(arr: arr1)
    let uniq2 = cntOfElement(arr: arr2)
    
    print(uniq1)
    
    (Array(uniq1.keys) + Array(uniq2.keys)).forEach {
        if let cnt = arrDic[$0] {
            arrDic[$0] = cnt + 1
        } else {
            arrDic[$0] = 1
        }
    }
    
    var uniqDic = arrDic.filter { $0.value > 1 }
    uniqDic.forEach {
        uniqDic[$0.key] = uniq1[$0.key]! + uniq2[$0.key]!
    }
    
    return uniqDic
}

func cntOfElement(arr: [Int]) -> [Int : Int] {
    return Dictionary(arr.map { ($0, 1) } , uniquingKeysWith: +)
}

var arr1 = [1,2,3,3,4,5,5]
var arr2 = [1,2,3,3,4,5,6]

let uniqDic = intersections(arr1: arr1, arr2: arr2)
uniqDic.forEach {
    print("\($0.key): multiple: \($0.value)X")
}
