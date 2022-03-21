//: Playground - noun: a place where people can play

import Foundation

// For a = [3, -1, 9], b = [100, 5, -2], lower = 7, and upper = 99, the output should be boundedSquareSum(a, b, lower, upper) = 4.
func boundedSquareSum(_ a: [Int], _ b: [Int], _ lower: Int, _ upper: Int) -> Int {
    return 0
}

func floorArray(_ sorted: [Int], _ val: Int) -> [Int] {
    var start = 0
    var end = sorted.count
    
    var mid = (start + end) / 2
    
    while start + 1 < end {
        mid = (start + end) / 2
        print("\(start), \(end), \(mid)")
        
        if sorted[mid] == val {
            return [Int](sorted[0...mid])
        }
        if sorted[mid] > val {
            end = mid
        } else {
            start = mid
        }
    }
    
    return [Int](sorted[0...mid])
}

//print(floorArray([1,3,5,6,7,9], 2))

let a = [-9,-8,-6,-4, -3,-2,-1,4,7] // [1,4,9,16,36,49]

func sortSquare(_ a: [Int]) -> [Int] {
    
    var begin = 0
    var end = a.count - 1
    
    var result = [Int]()
    
    while begin < end {
        if a[begin] <= 0 {
            result.insert(a[end] * a[end], at: 0)
            end -= 1
            continue
        }
        
        if a[end] <= 0 {
            result.insert(a[begin] * a[begin], at: 0)
            begin += 1
            continue
        }
        
        let left = a[begin] * a[begin]
        let right = a[end] * a[end]
        
        
        if left > right {
            result.insert(left, at: 0)
            begin += 1
        } else {
            result.insert(right, at: 0)
            end -= 1
        }
        
    }
    
    return result
}

print(sortSquare(a))
