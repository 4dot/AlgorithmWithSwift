//: Playground - noun: a place where people can play

import Foundation


func printAllPath(_ row: Int, _ col: Int) {
    return printPath(row, col, 0, 0, "")
}

func printPath(_ row: Int, _ col: Int, _ x: Int, _ y: Int, _ path: String) {
    var newPath = path
    if x >= col {
        for _ in y..<row { newPath += " |" }
        print(newPath)
        return
    }
    
    if y >= row {
        for _ in x..<col { newPath += " ->" }
        print(newPath)
        return
    }
    
    printPath(row, col, x + 1, y, path + " ->")
    printPath(row, col, x, y + 1, path + " |")
}

printAllPath(3, 3)
