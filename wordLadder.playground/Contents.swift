//: Playground - noun: a place where people can play

import Foundation

var index = 0
func nestedWeight(_ arr: String, _ weight: Int) -> Int {
    var sum = 0
    
    for char in arr {
        if char == Character("{") {
            index += 1
            sum += nestedWeight(arr, weight + 1)
        } else if let num = Int(String(char)) {
            sum += num * weight
        } else if char == Character("}") {
            break
        }
    }
    
    return sum
}

// {1,1,{2}, 1,1} -> 8
print(nestedWeight("{1,1,{2},1,1}", 0))


