//: Playground - noun: a place where people can play

import Foundation


func printSpiralMatrix(mat: [[Int]], w: Int, h: Int) {
    // [0,0],[0,1],[0,2],[0,3]   [1,3],[2,3],[3,3],   [3,2],[3,1][3,0]    [2,0][1,0]   [1,1],[1,2]    [2,2],[2,1]
    
    var startRow = 0
    var endRow = w - 1
    var startCol = 0
    var endCol = h - 1
    
    while (startRow <= endRow && startCol <= endCol) {
        for idx in startCol...endCol {
            print("[\(startRow), \(idx)] = \(mat[startRow][idx])")
        }
        startRow += 1
        
        for idx in startRow...endRow {
            print("[\(idx), \(endCol)] = \(mat[idx][endCol])")
        }
        endCol -= 1
        
        if startCol <= endCol {
            for idx in (startCol...endCol).reversed() {
                print("[\(endRow), \(idx)] = \(mat[endRow][idx])")
            }
        }
        endRow -= 1

        if startRow <= endRow {
            for idx in (startRow...endRow).reversed() {
                print("[\(idx), \(startCol)] = \(mat[idx][startCol])")
            }
        }
        startCol += 1
    }
}

let mat = [
    [1,   2,  3, 4],
    [12, 13, 14, 5],
    [11, 16, 15, 6],
    [10,  9,  8, 7]
]

print(printSpiralMatrix(mat: mat, w: 4, h: 4))
