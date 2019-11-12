import Foundation


// integer to string without convert to string
func itoa(_ val: Int) {
    var stack: [Int] = []
    
    var remain = val
    
    while remain > 0 {
        let no = remain % 10
        stack.insert(no, at: 0)
        remain /= 10
    }
    
    var newVal = 0
    for (idx, digit) in stack.enumerated() {
        newVal += (digit * Int(pow(10, Double(idx))) )
    }
    
    print(newVal)
}

itoa(103)


