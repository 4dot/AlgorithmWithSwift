//: Playground - noun: a place where people can play

import Foundation
import UIKit



// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
    var nextVal: Int?
    var iter: IndexingIterator<Array<Int>>
    
    init(_ arr: IndexingIterator<Array<Int>>) {
        iter = arr
        nextVal = iter.next()
    }
    
    func next() -> Int {
        let prev = nextVal
        
        if hasNext() {
            nextVal = iter.next()
        }
        return prev ?? -1
    }
    
    func peek() -> Int {
        return nextVal ?? -1
    }
    
    func hasNext() -> Bool {
        return nextVal != nil
    }
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 */
//let obj = PeekingIterator([1,2,3].makeIterator())
//print(obj.next())
//print(obj.peek())
//print(obj.hasNext())
 

class FBEnumerator : NSEnumerator {
    var subEnumerator: [NSEnumerator]
    
    init(object: NSArray) {
        subEnumerator = [object.objectEnumerator()]
    }
    
    override func nextObject() -> Any? {
        guard let curr = subEnumerator.last else { return nil }
        guard let currObj = curr.nextObject() else {
            subEnumerator.removeLast()
            return nextObject()
        }
        if let arr = currObj as? NSArray {
            subEnumerator.append(arr.objectEnumerator())
            return nextObject()
        }
        return currObj as? Int
    }
    
    override var allObjects: [Any] {
        var tmp = [Any]()
        while let obj = nextObject() {
            tmp.append(obj)
        }
        return tmp
    }
}


//let enumerator = NSArray(array: [1,2,3]).objectEnumerator()
//
//while let value = enumerator.nextObject() {
//    print(value)
//}

//let fbEnumerator = FBEnumerator(object: NSArray(array:[1,[[2]],3]))
//
//while let value = fbEnumerator.nextObject() {
//    print(value)
//}







protocol Iterator {
    associatedtype T
    func next() -> T
    func hasNext() -> Bool
}



//let test = [MyCollection(1.0, 2.0, 3.0), MyCollection(4.0, 5.0, 6.0)]
func longestSubstringTwoDistinct(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    
    let chars = Array(s)
    
    var result = 0
    var charMap = [Character : Int]()
    var firstIdx = 0
    
    for idx in 0..<chars.count {
        charMap[chars[idx], default: 0] += 1
        
        while charMap.count > 2 {
            if charMap[chars[firstIdx]] != nil {
                charMap[chars[firstIdx]]! -= 1
                if charMap[chars[firstIdx]]! == 0 {
                    charMap[chars[firstIdx]] = nil
                }
            }
            
            firstIdx += 1
        }
        result = max(result, idx - firstIdx + 1)
    }
    return result
}
