// Quick Selection
// find k-th Largest number in array

import Foundation

var arr = [5, 4, 8, 10, 6, 11, 26]




func quickSort(_ arr : inout [Int], _ start: Int, _ end: Int) {
    if (end - start) < 2 { return }
    
    let mid = arr[(start + end) / 2]
    var left = 0
    var right = arr.count - 1
    
    while left <= right {
        if arr[left] < mid {
            left += 1
            continue
        }
        
        if arr[right] > mid {
            right -= 1
            continue
        }
        
        arr.swapAt(left, right)
        left += 1
        right -= 1
    }
    
    quickSort(&arr, 0, left)
    quickSort(&arr, right, arr.count - 1)
}

//print(quickSort(&arr, 0, arr.count - 1))



func quick_selection(_ k: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    
    
    while start < end {
        var left = start
        var right = end
        let mid = arr[(left + right) / 2]
        
        print("\n")
        print("arr: \(arr[start..<end]), mid: \(mid)")
        
        while left < right {
            //print("    left: \(left), right: \(right)")
            
            if arr[left] >= mid {
                arr.swapAt(left, right)
                //print("        swap: \(arr[left]) and \(arr[right])")
                print("    swap: \(arr[start..<end])")
                right -= 1
            } else {
                left += 1
            }
            //print("        res: left: \(left), right: \(right)")
        }
        
        if arr[left] > mid {
            print("    \(arr) - left: \(left), right: \(right), mid: \(mid), arr[\(left)] is bigger then \(mid)")
            left -= 1
        }
        
        if k == left {
            //print("found")
            return arr[k]
        }
        
        if k <= left {
            //print("    left is equal or bigger then k")
            end = left
        } else {
            //print("    left is smaller then k")
            start = left + 1
        }
    }
    
    return arr[k]
}

//print(quick_selection(4))


//for idx in 0..<arr.count {
//    print("\n\n\(arr) -> k: \(idx) = \(quick_selection(idx))")
//}




func partition(_ start: Int, end: Int) -> Int {
    let pivot = arr[start]
    
    var startIdx = start
    var endIdx = end
    
    while startIdx < endIdx {
        while startIdx < endIdx, arr[endIdx] >= pivot {
            endIdx -= 1
        }
        while startIdx < endIdx, arr[startIdx] <= pivot {
            startIdx += 1
        }
        
        arr.swapAt(startIdx, endIdx)
        print("\(startIdx), \(endIdx) -> \(arr)")
    }
    arr[startIdx] = pivot
    return startIdx
}

func quickSelection(_ start: Int, _ end: Int, _ k: Int) -> Int {
    if start < end {
        let pivot = partition(start, end: end)
        
        if pivot == arr.count - k {
            return arr[pivot]
        }
        
        quickSelection(start, pivot - 1, k)
        quickSelection(pivot + 1, end, k)
    }
    
    return arr[arr.count - k]
}

print(quickSelection(0, arr.count - 1, 3))


//class Solution {
//public:
//
//  int partition(vector<int>& nums, int l, int r) {
//    int p = nums[l];
//    while(l < r) {
//      while(l < r && nums[r] >= p)
//        r--;
//      nums[l] = nums[r];
//      while(l < r && nums[l] <= p)
//        l++;
//      nums[r] = nums[l];
//    }
//    nums[l] = p;
//    return l;
//  }
//
//  int quickSort(vector<int>& nums, int k, int l, int r) {
//    int N = nums.size();
//    if(l < r) {
//      int pivot = partition(nums, l, r);
//      if(pivot == N - k) return nums[pivot];
//      quickSort(nums, k, l, pivot - 1);
//      quickSort(nums, k, pivot + 1, r);
//    }
//    return nums[N - k];
//  }
//
//  int findKthLargest(vector<int>& nums, int k) {
//    int N = nums.size();
//    if(N == 0) return 0;
//    int l = 0, r = N - 1;
//    return quickSort(nums, k, l, r);
//  }
//};

// Standard partition process of QuickSort().
// It considers the last element as pivot
// and moves all smaller element to left of
// it and greater elements to right
//func partition(_ arr: inout [Int], _ left: Int, _ right: Int) -> Int {
//    let x = arr[right]
//    var i = left
//
//    for j in left..<(right-1) {
//        if arr[j] <= x {
//            arr.swapAt(i, j)
//            i += 1
//        }
//    }
//    arr.swapAt(i, right)
//    return i
//}
//
//
//func kthSmallest(_ arr: inout [Int], left: Int, right: Int, k: Int) -> Int {
//    // if k is smaller than number of element in array
//    if k > 0 && k < (right - left + 1) {
//        // Partition the array around last
//        // element and get position of pivot
//        // element in sorted array
//        let idx = partition(&arr, left, right)
//
//        // If position is same as k
//        if (idx - left) == (k - 1) {
//            return arr[idx]
//        }
//        // If position is more, recur
//        // for left subarray
//        if (idx - left) > (k - 1) {
//            return kthSmallest(&arr, left: left, right: idx - 1, k: k)
//        }
//
//        // Else recur for right subarray
//        return kthSmallest(&arr, left: idx + 1, right: right, k: k - idx + left - 1)
//    }
//    // If k is more than number of
//    // elements in array
//    return Int.max
//}

// var arr = [10, 4, 5, 8, 6, 11, 26]
//print(kthSmallest(&arr, left: 0, right: arr.count - 1, k: 3))

//// Simple version
//func pivot(_ start: Int, _ end: Int) -> Int {
//    // select a middle value
//    let pivotIdx = (start + end) / 2
//    let pivot = arr[pivotIdx]
//
//    var startIdx = start
//    var endIdx = end
//
//    //print("pivot: \(pivot), idx: \(pivotIdx), start: \(startIdx) - end: \(endIdx)")
//
//    while startIdx <= endIdx {
//        // skip smaller values
//        while arr[startIdx] < pivot {
//            //print("skip smaller: \(arr[startIdx])")
//            startIdx += 1
//        }
//        // skip greater values
//        while arr[endIdx] > pivot {
//            //print("skip greater: \(arr[endIdx])")
//            endIdx -= 1
//        }
//
//        if startIdx < endIdx {
//            //print("swap index: \(startIdx)-\(endIdx)")
//            arr.swapAt(startIdx, endIdx)
//
//            //print(arr)
//
//            startIdx += 1
//            endIdx -= 1
//        }
//    }
//    return startIdx
//
//}
//func qSelection(_ start: Int, _ end: Int, _ k: Int) -> Int {
//    let point = pivot(start, end)
//
//    if point-start ==  k-1 {
//        return arr[point]
//    }
//    if point-start > k-1 {
//        return qSelection(start, point-1, k)
//    }
//    else {
//        return qSelection(point + 1, end, k-point+start-1)
//    }
//}
//
//let res = qSelection(0, arr.count - 1, 3)
//print("res: \(res)")
