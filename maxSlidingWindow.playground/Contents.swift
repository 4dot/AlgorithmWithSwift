// BinaryString Sum

import Foundation

/// Using Brute Force
/// Time O(N*K)
func maxSlidingWindow1(arr: [Int], k: Int) {
    
    for idx in 0...arr.count - k {
        var maxVal = arr[idx]
        
        for idx2 in 1..<k {
            maxVal = max(maxVal, arr[idx + idx2])
        }
        print(maxVal)
    }
}

/// Using Dequeue
/// Time O(N), Space O(N)
func maxSlidingWindow2(arr: [Int], k: Int) {
    var queue: [Int] = []
    
    for idx in 0..<k {
        while queue.isEmpty == false && arr[idx] >= arr[queue.last!] {
            queue.removeLast()
        }
        queue.append(idx)
    }
    print(queue)
    
    for idx in k..<arr.count {
        print(arr[queue.first!])
        
        // remove not included indexes
        while queue.isEmpty == false && queue.first! <= idx - k {
            queue.removeFirst()
        }
        
        // remove smaller values then current value
        while queue.isEmpty == false && arr[idx] >= arr[queue.last!] {
            queue.removeLast()
        }
        
        queue.append(idx)
    }
    
    print(arr[queue.first!])
}

let arr = [12, 1, 78, 90, 57, 89, 56]
maxSlidingWindow2(arr: arr, k: 3)


