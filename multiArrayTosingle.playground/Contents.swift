//: Playground - noun: a place where people can play

import Foundation


// T: O(n), S: O(n)
func flatArray(arr: [Any]) -> [Int] {
    var flat: [Int] = []
    
    for element in arr {
        if let element = element as? Int {
            flat.append(element)
        }
        else if let element = element as? [Any] {
            let result = flatArray(arr: element)
            flat.append(contentsOf: result)
        }
    }
    return flat
}


var arr: [Any] = [1, 2, [[3,4],[5,6,[7]]],8]

print(flatArray(arr: arr))
