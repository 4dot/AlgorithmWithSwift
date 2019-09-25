// String Manuplate
import Foundation

extension Array where Element : Hashable {
    // Time O(n), Space O(1)
     mutating func removeSortedDuplicate() {
        if self.count <= 0 {
           return
        }
        
        var position: Index = 0
        for next in 1..<self.count {
            if self[next] == self[position] {
                continue
            }
            position += 1
            // swap
            self.swapAt(position, next)
        }
        print(self[0...position])
    }
}

// move all '0' to back
func remove0toBack(_ text: String) -> String {
    var numbers = text.map { Int(String($0)) ?? 0 }
    var next: Int = 0
    
    for (idx, number) in numbers.enumerated() {
        if number != 0 {
            numbers.swapAt(next, idx)
            next += 1
        }
    }
    return numbers.reduce("") { text, num in "\(text)\(num)" }
}

var test: Array<Character> = ["a", "a", "a", "b", "b", "c", "d", "e"]
print(test.removeSortedDuplicate()) // ["a", "b", "c", "d", "e"]
print(remove0toBack("10023405"))    // 12345000
