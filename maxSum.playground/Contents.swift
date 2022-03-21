//: Playground - noun: a place where people can play

import Foundation

func isExistSquare(_ num: Int) -> Bool {
    
    var idx = 1
    
    while idx * idx <= num {
        if num % idx == 0 && num / idx == idx {
            return true
        }
        idx += 1
    }
    return false
}

print(isExistSquare(8))
