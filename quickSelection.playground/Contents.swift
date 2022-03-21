//: Playground - noun: a place where people can play

import Foundation


func partition(arr: inout [Int], left: Int, right: Int) -> Int {
    let pivot = arr[left]
    var start = left + 1
    var end = right
    
    while start <= end {
        while arr[start] <= pivot && start <= right {
            start += 1
        }
        while arr[end] >= pivot && end >= left + 1 {
            end -= 1
        }
    }
    arr.swapAt(left, end)
    print("\(start): \(left), \(end), \(arr)")
    
    return end
}

func kthSmallest(arr: inout [Int], left: Int, right: Int, k: Int) -> Int {
    let nth = partition(arr: &arr, left: left, right: right)
    
    if nth == k {
        return arr[nth]
    } else if nth > k {
        return kthSmallest(arr: &arr, left: left, right: nth - 1, k: k)
    } else {
        return kthSmallest(arr: &arr, left: nth + 1, right: right, k: k)
    }
}

//var arr = [10, 4, 5, 8, 6, 11, 26]
//print(kthSmallest(arr: &arr, left: 0, right: arr.count - 1, k: 5))

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    struct change {
        var cnt: Int
        var changes: [Int]
        init(_ cnt: Int, _ changes: [Int]) {
            self.cnt = cnt
            self.changes = changes
        }
    }
    
    var cntTbl = Array(repeating: change(amount + 1, []), count: amount + 1)
    cntTbl[0].cnt = 0
    
    for coin in coins {
        for idx in 1...amount {
            if idx - coin >= 0 {
                cntTbl[idx].cnt = min(cntTbl[idx - coin].cnt + 1, cntTbl[idx].cnt)
                
                if cntTbl[idx - coin].cnt + 1 < cntTbl[idx].cnt {
                    cntTbl[idx].changes += cntTbl[idx - coin].changes
                    cntTbl[idx].changes.append(coin)
                } else {
                    cntTbl[idx].changes = [coin]
                }
            }
        }
    }
    
    print(cntTbl)
    
    return cntTbl[amount].cnt == amount - 1 ? -1 : cntTbl[amount].cnt
}

print(coinChange([1,2,5], 11))
