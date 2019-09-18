//: Playground - noun: a place where people can play

import UIKit

/// Simple Node class
class Node {
    var value: Int = 0
    var left: Node?
    var right: Node?
    
    convenience init(_ value: Int) {
        self.init()
        self.value = value
    }
}

/**
 desc: Print level order from binary tree with grouped same levels.
 param: Tree header
 return: Integer grouped araray
 **/
func printLevelGroup(_ header: Node)-> [[Int]] {
    var queue: [Node] = []
    var childQueue: [Node] = []
    
    // Total Children's groups
    var totalGroups: [[Int]] = []
    var childGroup: [Int] = []
    
    // start
    queue.append(header)
    
    // Loop until queue was empty
    while let node = queue.first {
        
        // collect same level's value
        childGroup.append(node.value)
        
        if let left = node.left {
            childQueue.append(left)
        }
        if let right = node.right {
            childQueue.append(right)
        }
        
        // remove used node
        queue.removeFirst()
        
        // check for next level
        if queue.isEmpty {
            queue.append(contentsOf: childQueue)
            totalGroups.append(childGroup)
          
            // reset child queue, child values group
            childQueue.removeAll()
            childGroup.removeAll()
        }
    }
    
    return totalGroups
}

// Test
//    1
//   /\
//  2  3
// /\  /\
//4 5 6  7
//var header: Node = Node(1)
//header.left = Node(2)
//header.right = Node(3)
//
//header.left?.left = Node(4)
//header.left?.right = Node(5)
//
//header.right?.left = Node(6)
//header.right?.right = Node(7)
//
//printLevelGroup(header)


let one = ["", "one ", "two ", "three ", "four ", "five ", "six ", "seven ", "eight ", "nine ", "ten ",
            "eleven ", "twelve ", "thirteen ", "fourteen ", "fifteen ", "seveenteen ", "eightteen ", "nineteen "]
let ten = ["", "", "twenty ", "thirty ", "forty ", "fifty ", "sixty ", "seventy ", "eighty ", "ninety "]

func numberToWords(number: Int, word: String)-> String {
    var output: String = ""
    if number > 19 {
        output += ten[number / 10] + one[number % 10]
    } else {
        output += one[number]
    }
    
    if number > 0 {
        output += word
    }
    
    return output
}

// max million
func convertToWords(number: Int)-> String {
//    let numbers = number % 1000000
//    let million: Int32 = number / 1000000
//    print("million: \(million)")
    var output: String = ""
    
//    if million > 0 {
//        output += numberToWords(number: (million / 1000) % 100, word: "thousand ")
//        output += numberToWords(number: (million / 100) % 10, word: "hundred ")
//        output += numberToWords(number: numbers % 100, word: "")
//        output += "million "
//    }
    
    
    output += numberToWords(number: number / 10000000, word: "crore ")
    output += numberToWords(number: (number / 100000) % 100, word: "lakh ")
    output += numberToWords(number: (number / 1000) % 100, word: "thousand ")
    output += numberToWords(number: (number / 100) % 10, word: "hundred ")
    
    if number > 100 && (number % 100) > 0 {
        output += "and "
    }
    output += numberToWords(number: number % 100, word: "")
    return output
}


print(convertToWords(number:111111111))


let origin = CGRect(x: 0, y: 0, width: 100, height: 100)
print(origin.intersects(CGRect(x: 0, y: -39, width: 40, height: 40)))




