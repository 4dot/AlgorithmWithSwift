//: Playground - noun: a place where people can play

import Foundation



class tNode : NSObject {
    var value: Int
    var left: tNode?
    var right: tNode?
    
    init(_ value: Int) {
        self.value = value
    }
}

func inorderNode(_ root: tNode?) {
    guard let node = root else {
        return
    }
    inorderNode(node.left)
    print("\(node.value)")
    inorderNode(node.right)
}

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
//
//        node.right = deleteNode(node.right, minNode!.value)
    }
    return node
}


var root: tNode? = nil
root = insertNode(root, 50)
root = insertNode(root, 30)
root = insertNode(root, 20)
root = insertNode(root, 40)
root = insertNode(root, 70)
root = insertNode(root, 60)
root = insertNode(root, 80)

inorderNode(root)
print("delete 20")
deleteNode(root, 20)
inorderNode(root)

print("delete 30")
deleteNode(root, 30)
inorderNode(root)

print("delete 50")
deleteNode(root, 50)
inorderNode(root)
