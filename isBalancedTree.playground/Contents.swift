// IsBalanced Tree

import Foundation

class node {
    var data: Int?
    var left: node?
    var right: node?
}

func isBalanced(root: node?, height: inout Int) -> Bool {
    guard let node = root else {
        height = 0
        return true
    }
    
    var lHeight = 0
    var rHeight = 0
    
    let isLBalanced = isBalanced(root: node.left, height: &lHeight)
    let isRBalanced = isBalanced(root: node.right, height: &rHeight)
    
    height = max(lHeight, rHeight) + 1
    
    if abs(lHeight - rHeight) >= 2 {
        return false
    } else {
        return isLBalanced && isRBalanced
    }
}

func newNode(data: Int) -> node {
    let newNode = node()
    newNode.data = data
    return newNode
}

/* Constructed binary tree is
      1
     / \
     2  3
    / \ /
   4  5 6
  /
 7
 */
let root = newNode(data: 1)
root.left = newNode(data: 2)
root.right = newNode(data: 3)
root.left?.left = newNode(data: 4)
root.left?.right = newNode(data: 5)
root.right?.left = newNode(data: 6)
root.left?.left?.left = newNode(data: 7)
// root.left?.left?.left?.left = newNode(data: 8)

var height = 0
let isBalance = isBalanced(root: root, height: &height)
print("\(isBalance), \(height)")
