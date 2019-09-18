//: Playground - noun: a place where people can play

import Foundation


class tNode : NSObject {
    var data: Int
    var left: tNode?
    var right: tNode?
    
    init(_ data: Int, left: tNode? = nil, right: tNode? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}


func morrisTraversal(root: tNode?) {
    if root == nil {
        return
    }
    
    var current = root
    var pre: tNode?
    
    while (current != nil) {
        
        if current?.left == nil {
            print("\(current?.data) ")
            current = current?.right
        }
        else {
            pre = current?.left
            
            while (pre?.right != nil && pre?.right != current) {
                pre = pre?.right
            }
            
            if pre?.right == nil {
                pre?.right = current
                current = current?.left
            }
            else {
                pre?.right = nil
                print("\(current?.data) ")
                current = current?.right
            }
        }
    }
}

let root = tNode(1)
root.left = tNode(2)
root.right = tNode(3)
root.left?.left = tNode(4)
root.left?.right = tNode(5)

morrisTraversal(root: root)
