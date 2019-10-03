// Possible Path in Grid (n*n)
//
// Move only Down or Left
// Move LeftTop to RightBottom

import Foundation


// "abcdefghij", n = 3

//a d g j
//b e h
//c f i
func lineOut(_ text: String, _ k: Int) {
    let chars: [Character] = Array(text)
    var curr = 0
    
    while curr < chars.count {
        var line: [Character] = []
        for idx in 0..<k {
            line.append(chars[idx])
        }
        print(String(line))
        
        curr += (k-1)
    }
}

lineOut("abcdefghij", 3)
