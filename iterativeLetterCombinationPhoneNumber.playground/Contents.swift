// Combine possible letters on a Keypad
// iterative letters
// Time complexity: O(4^N)

import Foundation

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

func letterCombination(_ numbers: [Int]) -> [String] {
    if numbers.isEmpty {
        return []
    }
    
    var result: [String] = []
    var queue: [String] = [""]
    
    while !queue.isEmpty {
        let letter = queue.removeFirst()
        
        if letter.count == numbers.count {
            result.append(letter)
        }
        else {
            letterTable[numbers[letter.count]].forEach {
                queue.append("\(letter)\($0)")
            }
        }
    }
    return result
}

func letterCombination2(_ numbers: String) -> [String] {
    let keys = numbers.map { Int(String($0)) ?? 0 }
    return letterCombination(keys)
}


//print(letterCombination([2,3]))
print(letterCombination2("234"))
