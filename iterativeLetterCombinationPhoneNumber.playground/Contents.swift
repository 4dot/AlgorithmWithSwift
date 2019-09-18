//: Playground - noun: a place where people can play

import Foundation



func letterCombination(_ numbers: [Int]) {
    let letterTable = [
        "",
        "",
        "abc",
        "def",
        "ghi",
        "jkl",
        "mno",
        "pqrs",
        "tuv",
        "wxyz"
    ]
    
    var list: [String] = []
    var queue: [String] = [""]
    
    while !queue.isEmpty {
        print("--------")
        let letter = queue.first!
        print(letter)
        queue = Array(queue.dropFirst())
        print(queue)
        if letter.count == numbers.count {
            print("same count")
            list.append(letter)
            print(list)
        }
        else {
            print(letterTable[numbers[letter.count]])
            letterTable[numbers[letter.count]].forEach {
                queue.append("\(letter)\($0)")
            }
            print(queue)
        }
    }
    print(list)
}

print(letterCombination([2,3]))
