//: Playground - noun: a place where people can play

import UIKit

//
// Time Complexity O(nlogn)
// Space Complexity O(n)
//
class MergeSort<T: Comparable> {
    
    typealias item = T
    
    
    func merge(_ array: [item]) -> [item] {
        if array.count <= 1 {
            return array
        }
        
        let center = array.count / 2
        let left = merge(Array(array[array.startIndex..<center]))
        let right = merge(Array(array[center..<array.endIndex]))
        
        return merges(left, right)
    }
    
    private func merges(_ left: [item], _ right: [item]) -> [item] {
        
        var leftIdx = 0
        var rightIdx = 0
        
        var orders = [item]()
        
        print("left:  \(left)")
        print("right: \(right)")
        
        while leftIdx < left.count && rightIdx < right.count {
            let leftValue = left[leftIdx]
            let rightValue = right[rightIdx]
            
            if leftValue < rightValue {
                orders.append(leftValue)
                leftIdx += 1
            }
            else if leftValue > rightValue {
                orders.append(rightValue)
                rightIdx += 1
            }
            else {
                orders.append(leftValue)
                orders.append(rightValue)
                leftIdx += 1
                rightIdx += 1
            }
        }
        
        // append remains
        orders += left[leftIdx..<left.count]
        orders += right[rightIdx..<right.count]
        
        return orders
    }
}

let merge = MergeSort<Int>()
print(merge.merge([0, 7, 6, 5, 4, 3, 2, 1, 9, 10]))


