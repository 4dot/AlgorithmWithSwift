//: Playground - noun: a place where people can play

import Foundation
import UIKit

//Implement a multi hash map with keys having more than 1 value
//k1 -> {v1, v2, v3}
//k2 -> {v3, v5}
//k3 -> {v5, v7}
//
//API should be
//
//1. void put(K k, V v)    // put(k1, v1) --> no-op. put(k1, v4) --> do something.
//2. void delete(K k, V v) // delete(k4, v8) --> no-op. delete(k3, v5) --> do something.
//3. Collection<V> get(K k) // if key does not exist, return an empty collection.
//4. boolean containsValue(V v) // containsValue(v5) return true; containsValue(v6) return false;
//
//all 4 methods run in O(1) time.
//keys are strings, values are longs.

class MultiHashMap {
    var multiMap = [String : Set<Int>]()
    //var reference = [Int : Int]()
    var ref2 = NSCountedSet()
    
    func put(_ key: String, _ val: Int) {
        multiMap[key, default: Set<Int>()].insert(val)
        ref2.add(val)
        //reference[val, default: 0] += 1
    }
    
    func delete(_ key: String, val: Int) {
        multiMap[key]?.remove(val)
        ref2.remove(val)
//        if let ref = reference[val], ref > 0 {
//            reference[val]! -= 1
//        }
    }
    
    func get(_ key: String) -> [Int] {
        return Array(multiMap[key] ?? [])
    }
    
    func contains(_ val: Int) -> Bool {
        //return reference[val] != nil && reference[val]! > 0
        return ref2.contains(val)
    }
}

let multiMap = MultiHashMap()
multiMap.put("1", 1)
multiMap.put("1", 2)
multiMap.put("1", 3)
multiMap.put("3", 3)
multiMap.put("3", 5)
multiMap.put("5", 7)

print(multiMap.multiMap)
multiMap.delete("1", val: 3)
//multiMap.delete("3", val: 3)
print(multiMap.multiMap)
print(multiMap.get("1"))
print(multiMap.contains(3))
