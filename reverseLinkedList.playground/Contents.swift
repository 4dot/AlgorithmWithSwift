//: Playground - noun: a place where people can play

import Foundation
import UIKit
////
//// reverse linked list
////

class Link {
    var next: Link?
    var data: Int
    
    init() {
        next = nil
        data = 0
    }
}

func createLinkedList(cnt: Int) -> Link {
    let head = Link()
    head.data = 1
    
    
    var pos: Link = head
    
    // 10 link
    (2...10).forEach {
        let tail = Link()
        tail.data = $0
        pos.next = tail
        pos = tail
    }
    
    return head
}

func printLinkedList(head: Link) {
    var pos: Link? = head
    var log: String = ""
    
    repeat {
        log +=  " \(pos?.data ?? -1)"
        pos = pos?.next
    } while(pos != nil)
    
    print(log)
}

func reverseLinkedList(head: Link) -> Link? {
    var curr: Link? = head
    var prev: Link? = nil
    var next: Link? = nil
    
    repeat {
        next = curr?.next
        curr?.next = prev
        prev = curr
        curr = next
        
    } while(curr != nil)
    
    var newHead: Link? = head
    newHead = prev
    
    return newHead
}

func reverseLinkedListRecusive(head: Link?) -> Link? {
    if head == nil || head?.next == nil {
        print("nil: \(head?.data ?? -1)")
        return head
    }
    
    let prev = reverseLinkedListRecusive(head: head?.next)
    head?.next?.next = head
    head?.next = nil
    print("\(prev?.data ?? -1)")
    return prev
}



let linkedList = createLinkedList(cnt: 10)
print(printLinkedList(head: linkedList))

let reverse = reverseLinkedList(head: linkedList)
print(printLinkedList(head: reverse!))

let recurse = reverseLinkedListRecusive(head: reverse)
print(printLinkedList(head: recurse!))

