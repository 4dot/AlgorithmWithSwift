import Foundation


// "abcdefghij", n = 4

//a d g i
//b e h j
//c f
func lineOut(_ text: String, _ k: Int) {
    let chars: [Character] = Array(text)
    let lines = chars.count/k + (chars.count%k > 0 ? 1 : 0)
    
    var curr = 0
    for idx in 0..<lines {
        var line: [Character] = []
        while curr < chars.count {
            line.append(chars[curr])
            
            curr += k
        }
        print(String(line))
        curr = idx + 1
    }
}

//lineOut("abcdefghij", 4)

// print first chars
// ccbbdddbcccaabbaaeeefff -> cbdaef

func printFirstChars(_ text: String) -> String {
    let chars = Array(text)
    var set = Set<Character>()
    
    var result: [Character] = []
    chars.forEach {
        if set.contains($0) == false {
            set.insert($0)
            result.append($0)
        }
    }
    return String(result)
}

// print(printFirstChars("ccbbdddbcccaabbaaeeefff"))

//    1
//   / \
//  2   3
// /\    \
//4  5    6
// return 124 + 125 + 136



class Node : Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    
    var value: Int
    var left: Node?
    var right: Node?
    
    init(_ val: Int) {
        self.value = val
    }
}

var visited: [Node] = []
func printPossible(_ root: Node?, depth: Int) {
    guard let node = root else {
        return
    }
    var stack: [Node] = [node]
    
    
    
    
    
    
}

let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.right = Node(6)

//1 0 0 0 1
//1 1 1 2 3
//4 5 1 0 0
//-1.4 -5 4 3 -1.5
//3 4 5 6 7

//max path: 11, 12, 13, 23, 33, 34, 35, 45, 55
