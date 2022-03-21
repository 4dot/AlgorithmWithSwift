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
    for array in matrix {
        
        
        var index = 0
        var dir = dir = array[index] < target ? 1 : -1
        
        while index >= 0 && index < array.count {
            if array[index] == target {
                return true
            }
            
            
            index += dir
            if array[index] < target {
                break
            }
        }
    }
    
    return false
}

print(searchMatrix(matrix, target: 41))


