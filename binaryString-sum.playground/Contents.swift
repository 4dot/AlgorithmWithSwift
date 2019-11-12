// BinaryString Sum

import Foundation


func maxSlidingWindow(arr: [Int], k: Int) {
    var queue: [Int] = []
    
    for idx in 0..<k {
        while queue.isEmpty == false && arr[idx] >= arr[queue.last!] {
            queue.removeLast()
        }
        queue.append(idx)
    }
    
    for idx in 0..<arr.count {
        print(arr[queue.first!])
        
        while queue.isEmpty == false && queue.first! <= idx - k {
            queue.removeFirst()
        }
        
        while queue.isEmpty == false && arr[idx] >= arr[queue.last!] {
            queue.removeLast()
        }
        
        queue.append(idx)
    }
    
    print(arr[queue.first!])
}

let arr = [12, 1, 78, 90, 57, 89, 56]
maxSlidingWindow(arr: arr, k: 3)


