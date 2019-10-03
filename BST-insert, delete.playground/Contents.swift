// BST, insert, delete, orders, balanced?

import Foundation

class tNode : NSObject {
    var value: Int
    var left: tNode?
    var right: tNode?
    
    init(_ value: Int) {
        self.value = value
    }
}
//------------------------------------------------------
func inorderRecursion(_ root: tNode?) {
    guard let node = root else {
        return
    }
    inorderRecursion(node.left)
    print("\(node.value)")
    inorderRecursion(node.right)
}
//------------------------------------------------------
func inorderStack(_ root: tNode?) {
    guard let root = root else {
        return
    }
    
    var stack: [tNode] = []
    var next: tNode? = root
    
    while true {
        if let node = next {
            stack.append(node)
            next = node.left
        }
        else {
            if stack.isEmpty {
                break
            }
            let pop = stack.removeLast()
            print(pop.value)
            next = pop.right
        }
    }
}
//------------------------------------------------------
// Time: O(n)
func inorderMorris(_ root: tNode?) {
    guard let node = root else {
        return
    }
    
    var current: tNode? = node
    var prev: tNode?
    
    while current != nil {
        if current?.left == nil {
            print(current!.value)
            current = current?.right
        }
        else {
            prev = current?.left
            
            while prev?.right != nil && prev?.right != current {
                prev = prev?.right
            }
            if prev?.right == nil {
                prev?.right = current
                current = current?.left
            }
            else {
                prev?.right = nil
                print(current?.value)
                current = current?.right
            }
        }
    }
}
//------------------------------------------------------
var lvlResult: [[Int]] = [[]]
func levelOrder(_ root: tNode?, _ lvl: Int) {
    guard let node = root else {
        return
    }
    let level = lvl + 1
    if lvlResult.count <= level {
        lvlResult.append([])
    }
    lvlResult[level].append(node.value)
    levelOrder(node.left, level)
    levelOrder(node.right, level)
}
//------------------------------------------------------
var rightNode: tNode?
func flattern(_ root: tNode?) {
    guard let node = root else {
        return
    }
    
    flattern(node.right)
    flattern(node.left)
    node.right = rightNode
    node.left = nil
    rightNode = node.right
    
    print("right: \(rightNode?.value) root: \(node.value)")
}
//------------------------------------------------------
// using morris (flat Array)
func toLinkedList(_ root: tNode?) -> tNode? {
    var temp = root
    var crawl = root
    
    while temp != nil {
        var right = temp?.right
        temp?.right = temp?.left
        temp?.left = nil
    
    
        crawl = temp
        while crawl?.right != nil {
            crawl = crawl?.right
        }
        crawl?.right = right
        temp = temp?.right
    }
    return nil
    
}
//------------------------------------------------------
func isBalanced(root: tNode?, height: inout Int) -> Bool {
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
//------------------------------------------------------
func insertNode(_ root: tNode?, _ value: Int) -> tNode {
    guard let node = root else {
        return tNode(value)
    }
    
    // insert left
    if value < node.value {
        node.left = insertNode(node.left, value)
    }
    // insert right
    else if value > node.value {
        node.right = insertNode(node.right, value)
    }
    
    return node
}
//------------------------------------------------------
func searchNode(_ root: tNode?, _ value: Int) -> tNode? {
    guard let node = root else {
        return root
    }
    
    if value == node.value {
        return node
    }
    
    if value < node.value {
        return searchNode(node.left, value)
    }
    else if value > node.value {
        return searchNode(node.right, value)
    }
    return nil
}
//------------------------------------------------------
func searchNodeIterative(_ root: tNode?, _ value: Int) -> tNode? {
    
    var node = root
    while node != nil {
        if value == node!.value {
            return node
        }
        else if value < node!.value {
            node = node!.left
        }
        else if value > node!.value {
            node = node!.right
        }
    }
    return nil
}
//------------------------------------------------------
func deleteNode(_ root: tNode?, _ value: Int) -> tNode? {
    guard let node = root else {
        return root
    }
    
    // find node
    if value < node.value {
        node.left = deleteNode(node.left, value)
    }
    else if value > node.value {
        node.right = deleteNode(node.right, value)
    }
    // found
    else {
        // no children
        if node.left == nil {
            return node.right
        }
        else if node.right == nil {
            return node.left
        }
        
        // find min in subtree
        var minNode = node.right
        var successorParent = node
        
        while (minNode != nil && minNode?.left != nil) {
            successorParent = minNode!
            minNode = minNode?.left
        }
        
        successorParent.left = minNode!.right
        node.value = minNode!.value
//        node.value = minNode!.value
//        node.right = deleteNode(node.right, minNode!.value)
    }
    return node
}
//------------------------------------------------------

var root: tNode? = nil
root = insertNode(root, 4)
var _ = insertNode(root, 2)
var _ = insertNode(root, 1)
var _ = insertNode(root, 3)
var _ = insertNode(root, 6)
var _ = insertNode(root, 5)
var _ = insertNode(root, 7)

flattern(root)
inorderRecursion(root)
//inorderNodeRecursion(root)
//inorderStack(root)
//inorderMorris(root)
//levelOrder(root, -1)
//print(lvlResult)
//print("delete 20")
//deleteNode(root, 20)
//inorderNode(root)

//print("delete 30")
//deleteNode(root, 30)
//inorderNode(root)
//
//print("delete 50")
//deleteNode(root, 50)
//inorderNode(root)
