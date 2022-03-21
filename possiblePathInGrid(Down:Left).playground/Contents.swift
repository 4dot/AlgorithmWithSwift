// Possible Path in Grid (n*n)
//
// Move only Down or Left
// Move LeftTop to RightBottom

import Foundation


let mat = [[1, 2, 3],
           [4, 5, 6],
           [7, 8, 9]]


func possiblePath(_ mat: [[Int]], x: Int, y: Int) {
    if x >= 2 || y >= 2 {
        return
    }
    
    print(mat[x][y])
    
    // print right
    
    
    
}

print(possiblePath(mat, x: 0, y: 0))
