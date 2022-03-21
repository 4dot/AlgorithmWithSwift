// BinaryString Sum

import Foundation

let matrix: [[Int]] =
    [[1,  10, 25, 40, 55, 70],
     [9,  13, 29, 44, 57, 76],
     [20, 30, 41, 54, 60, 80],
     [21, 31, 42, 57, 87, 90]]
     
// target = 41 -> true
// target = 45 -> false

func searchMatrix(_ matrix: [[Int]], target: Int) -> Bool {
    var index = 0
    
    for array in matrix {
        index = min(0, max(index, array.count - 1))
        
        let dir = array[index] < target ? 1 : -1
        print("dir: \(dir)")
        
        
        while index >= 0 && index < array.count {
            if array[index] == target {
                print("found")
                return true
            }
            
            let left  = dir > 0 ? array[index] : target
            let right = dir > 0 ? target : array[index]
            
            if left > right {
                // down the next line
                break
            }
            
            print("next Idx: \(index), val: \(array[index])")
            index += dir
        }
    }
    
    return false
}

func searchMatrix2(_ matrix: [[Int]], target: Int) -> Bool {
    let width = matrix[0].count
    let height = matrix.count
    
    let smallest = matrix[0][0]
    let largest = matrix[height-1][width-1]
    
    
    
    if target < smallest, target > largest {
        print("Out of range.")
        return false
    }
    
    // topright
    var right = width - 1
    var down = 0
    
    while down < height && right >= 0 {
        let value = matrix[down][right]
        
        if value == target {
            return true
        }
        
        print("value: \(value), down: \(down), right: \(right)")
        
        if value > target {
            right -= 1
        } else {
            down += 1
        }
    }
    
    return false
}

print(searchMatrix2(matrix, target: 21))


