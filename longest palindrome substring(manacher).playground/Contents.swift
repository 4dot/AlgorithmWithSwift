//: Playground - noun: a place where people can play
// http://www.jay.fyi/2016/03/longest-palindrome-manacher-part-ii.html

import Foundation


// result[i] = (i<R)? Math.min(R-i, result[mirror_i]) : 0;

// manacher's algorithm
func longestPalindrome(string: String) -> [Int] {
    // insert '|' between all of characters for made odd count
    let joined = "|\(String(string.map { "\($0)|" }.joined()))"
    
    // init
    var center = 1
    var rBound = 2
    var result: [Int] = Array(repeating: 0, count: joined.count)
    let text = Array(joined)
    
    for idx in 1..<joined.count {
        // find mirror idx
        let mirror = center * 2 - idx
        
        // This main logic here is to reduce the complexity - trying to skip the expansion if possible
        // First checking is the current index i within the boundary,
        // if so then return smaller value from either (right boundary - current index ) or result of the mirror i
        result[idx] = (idx < rBound) ? min(rBound - idx, result[mirror]) : 0
        
        print("\(idx), \(result[idx])")
        
        // Check the array is not out of bound and attempt to expand the palindrome centered at i
        while (idx - result[idx] - 1 >= 0 &&
               idx + result[idx] + 1 < joined.count) &&
               (text[idx + result[idx] + 1] == text[idx - result[idx] - 1]) {
                result[idx] += 1
        }
        
        // check is palindrome centered at i expand past the right boundary
        if idx + result[idx] > rBound {
            // then adjust center based on expanded palindrome.
            center = idx
            rBound = idx + result[idx]
        }
    }
    
    // remove '|'
    result.removeAll(where: { $0 == 0 })
    return result
}

print("longest: \(longestPalindrome(string: "banana"))")
// result longest: [1, 1, 3, 5, 3, 1]

