//: Playground - noun: a place where people can play

import Foundation



func isPalindrome(_ s: String) -> Bool {
    let S = Array(s)
    var start = 0
    var end = S.count - 1

    while (start < end) {
        if !S[start].isLetter || !S[start].isNumber {
            start += 1
            continue
        }
        if !S[end].isLetter || !S[end].isNumber {
            end -= 1
            continue
        }
        if S[start].lowercased() != S[end].lowercased() {
            return false
        }
        
        start += 1
        end -= 1
    }
    return true
}

func isPalindromeNoExtraSpace(_ S: String) -> Bool {
    if S.isEmpty {
        return true
    }
    
    var start = S.startIndex
    var end = S.index(S.endIndex, offsetBy: -1)
    
    while (start < end) {
        if !S[start].isLetter && !S[start].isNumber {
            start = S.index(start, offsetBy: 1)
            continue
        }
        if !S[end].isLetter && !S[end].isNumber {
            end = S.index(end, offsetBy: -1)
            continue
        }
        print(S[start])
        print(S[end])
        if S[start].lowercased() != S[end].lowercased() {
            return false
        }
        
        start = S.index(start, offsetBy: 1)
        end = S.index(end, offsetBy: -1)
    }
    return true
    
}

print(isPalindromeNoExtraSpace("race a car"))

func isPalindrome2(_ s: String) -> Bool {
    let filtered = s.replacingOccurrences(of: "[^A-Za-z0-9]+", with: "", options: .regularExpression).lowercased()
    if filtered.count <= 1 {
        return true
    }
    
    let offset = filtered.count % 2
    let halfIdx = filtered.count / 2
    
    var left = filtered.index(filtered.startIndex, offsetBy: halfIdx)
    let leftSide = filtered[filtered.startIndex..<left]
    
    print(leftSide)
    
    left = filtered.index(filtered.startIndex, offsetBy: halfIdx + offset)
    let rightSide = Substring(filtered[left..<filtered.endIndex].reversed())
    
    print(rightSide)
    
    return leftSide == rightSide
}

//print(isPalindrome2("0P"))

func validPalindrome(_ s: String) -> Bool {
    return valid(s, checked: false)
}

func valid(_ s: String, checked: Bool) -> Bool {
    // No extra space
    var start = s.startIndex
    var end = s.index(s.endIndex, offsetBy: -1)
    
    while (start < end) {
        if s[start] != s[end] {
            if checked {
                return false
            }
            
            return valid(String(s[s.index(start, offsetBy: 1)...end]), checked: true) || valid(String(s[start...s.index(end, offsetBy: -1)]), checked: true)
        }
        start = s.index(start, offsetBy: 1)
        end = s.index(end, offsetBy: -1)
    }
    return true
}

print(validPalindrome("deeeeeeeeeeeeeee"))
