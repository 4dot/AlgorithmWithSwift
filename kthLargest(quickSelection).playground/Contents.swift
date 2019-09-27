// Quick Selection
// find k-th Largest number in array

import Foundation

// Standard partition process of QuickSort().
// It considers the last element as pivot
// and moves all smaller element to left of
// it and greater elements to right
func partition(_ arr: inout [Int], _ left: Int, _ right: Int) -> Int {
    let x = arr[right]
    var i = left
    
    for j in left..<(right-1) {
        if arr[j] <= x {
            arr.swapAt(i, j)
            i += 1
        }
    }
    arr.swapAt(i, right)
    return i
}


func kthSmallest(_ arr: inout [Int], left: Int, right: Int, k: Int) -> Int {
    // if k is smaller than number of element in array
    if k > 0 && k < (right - left + 1) {
        // Partition the array around last
        // element and get position of pivot
        // element in sorted array
        let idx = partition(&arr, left, right)
        
        // If position is same as k
        if (idx - left) == (k - 1) {
            return arr[idx]
        }
        // If position is more, recur
        // for left subarray
        if (idx - left) > (k - 1) {
            return kthSmallest(&arr, left: left, right: idx - 1, k: k)
        }
        
        // Else recur for right subarray
        return kthSmallest(&arr, left: idx + 1, right: right, k: k - idx + left - 1)
    }
    // If k is more than number of
    // elements in array
    return Int.max
}

var arr = [10, 4, 5, 8, 6, 11, 26]
print(kthSmallest(&arr, left: 0, right: arr.count - 1, k: 3))
