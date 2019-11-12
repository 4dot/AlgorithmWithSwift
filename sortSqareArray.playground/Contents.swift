import Foundation


// eg. [-6, -4, -2, -1, 3, 5, 8] -> [1, 4, 9, 16, 25, 36, 64]
// T: O(n), S: O(n)
func sortToSquareArray(_ arr: [Int]) {
    // 1. divide -, + values
    // 2. traverse all values to end or to start and insert to new array
    
    var result: [Int] = []
    
    var positiveQueue: [Int] = []
    var negativeStack: [Int] = []
    
    arr.forEach {
        if $0 >= 0 {
            positiveQueue.append($0 * $0)           // [9, 25, 64]
        } else {
            negativeStack.insert($0 * $0, at: 0)    // [1, 4, 16, 36]
        }
    }
    
    while let lval = positiveQueue.first,
        let rval = negativeStack.first {
        if lval > rval {
            negativeStack.removeFirst()
        } else {
            positiveQueue.removeFirst()
        }
        result.append(min(lval, rval))
    }
    
    result += positiveQueue
    result += negativeStack
    
    print(result)
}

func sortToSquareArray2(_ arr: [Int]) {
    // 1. divide -, + values
    // 2. traverse all values to end or to start and insert to new array
    
    var result: [Int] = []
    
    var toRightIdx: Int = arr.count
    var toLeftIdx: Int = toRightIdx - 1
    
    for (idx, value) in arr.enumerated() {
        if value >= 0 {
            toRightIdx = idx
            toLeftIdx = toRightIdx - 1
            break
        }
    }
    while toRightIdx < arr.count, toLeftIdx >= 0 {
        let rval = arr[toRightIdx] * arr[toRightIdx]
        let lval = arr[toLeftIdx] * arr[toLeftIdx]
        
        if rval > lval {
            toLeftIdx -= 1
        } else {
            toRightIdx += 1
        }
        result.append(min(rval, lval))
    }
    
    while toRightIdx < arr.count {
        result.append(arr[toRightIdx] * arr[toRightIdx])
        toRightIdx += 1
    }
    while toLeftIdx >= 0 {
        result.append(arr[toLeftIdx] * arr[toLeftIdx])
        toLeftIdx -= 1
    }
    print(result)
}

//sortToSquareArray2([-6, -4, -2, -1, 3, 5, 8])
sortToSquareArray([-6, -4, -2, -1])
