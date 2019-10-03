// BinaryString Sum

import Foundation


func findTwoSum(_ arr: [Int], _ sum: Int) -> [[Int]] {
    var result: [[Int]] = []
    var dic: [Int : Int] = [:]
    
    arr.forEach {
        let minus = sum - $0
        
        if dic[minus] != nil {
            result.append([dic[minus]!, $0])
        }
        else {
            dic[minus] = $0
        }
    }
    
    return result
}

print(findTwoSum([3,5,2,-4,8,11], 7))



