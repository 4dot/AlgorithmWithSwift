//: Playground - noun: a place where people can play

import Foundation


//
// Time complexity: O(n) + O(nLogn) = O(nLogn)
//
func findFirstUniqueChar(text: String) -> String {
    var charDoc: [Character : Int] = [:]
    
    for (idx, char) in text.enumerated() {
        if let _ = charDoc[char] {
            charDoc.removeValue(forKey: char)
        } else {
            charDoc[char] = idx
        }
    }
    
    print(charDoc)

    if let minIdx = charDoc.values.sorted().first {
        let idx = text.index(text.startIndex, offsetBy: minIdx)
        return String(text[idx])
    }
    
    return "Can't find unique char."
}

//
// Time complexity: O(n) + O(n) = O(n)
//
func findFirstUniqueChar2(text: String) -> String {
    var charDoc: [Character : Int] = [:]
    var chars: [Character] = []
    
    for (idx, char) in text.enumerated() {
        if let _ = charDoc[char] {
            charDoc.removeValue(forKey: char)
        } else {
            charDoc[char] = idx
            chars.append(char)
        }
    }
    
    print(charDoc)
    print(chars)
    
    for char in chars {
        if charDoc[char] != nil {
            return String(char)
        }
    }
    
    return "Can't find unique char."
}

let text = "ccabdeea"
print("findFirstUniqueChar: \(findFirstUniqueChar2(text: text))")
