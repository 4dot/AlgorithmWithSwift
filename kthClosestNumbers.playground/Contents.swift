//: Playground - noun: a place where people can play

import Foundation


func findKthCloestNumbers(arr: [Int], number: Int,  kth: Int) -> [Int] {
    var arrDic: [Int : Int] = [:]
    
    arr.forEach {
        arrDic[$0] = abs($0 - number)
    }
    let sortedValue = arrDic.sorted { $0.value < $1.value }.compactMap { $0.key }
    
    print(sortedValue)
    
    return Array(sortedValue.prefix(kth))
}

let arr = [10, 2, 14, 4, 7, 6]
print(findKthCloestNumbers(arr: arr, number: 5, kth: 3))
