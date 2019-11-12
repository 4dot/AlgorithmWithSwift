import Foundation


//    1
//   / \
//  2   3
// /\    \
//4  5    6

// print 4, 2, [1,5], 3, 6]



class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(_ val: Int) {
        self.value = val
    }
}

var minWidth: Int = Int.max
var maxWidth: Int = Int.min
var results: [Int : [Node]] = [:] // level : Nodes


func printVertical(_ root: Node?, _ lvl: Int) {
    guard let node = root else {
        return
    }
    
    if results[lvl] == nil {
        results[lvl] = []
    }
    maxWidth = lvl > maxWidth ? lvl : maxWidth
    minWidth = lvl < minWidth ? lvl : minWidth
    
    print("lvl: \(lvl), node: \(node.value)")
    
    results[lvl]?.append(node)
    
    printVertical(node.left, lvl - 1)
    printVertical(node.right, lvl + 1)
}





let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.right = Node(6)
root.right?.left = Node(7)


printVertical(root, 0)

print("min: \(minWidth), max: \(maxWidth)")
var levels: [String] = []
for key in minWidth...maxWidth {
    if let values = results[key] {
        var lvl = values.reduce("") { "\($0), \($1.value)"}
        if values.count > 1 {
           lvl = "[\(lvl)]"
        }
        levels.append(lvl)
    }
}

print(levels.reduce("") { "\($0), \($1)"})

//1 0 0 0 1
//1 1 1 2 3
//4 5 1 0 0
//-1.4 -5 4 3 -1.5
//3 4 5 6 7

//max path: 11, 12, 13, 23, 33, 34, 35, 45, 55
