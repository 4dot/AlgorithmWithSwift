import UIKit



func moveAllZeroToBack(array: [Int]) -> [Int] {
    var values = array
    var nonZeroIdx = 0
    
    for (idx, value) in array.enumerated() {
        if value != 0 {
            // swap
            values.swapAt(idx, nonZeroIdx)
            nonZeroIdx += 1
        }
    }
    return values
}

//print(moveAllZeroToBack(array: [1, 2, 3, 0, 4, 0, 5, 0]))

func mergeTwoArray(_ a1: [Int], _ a2: [Int]) -> [Int] {
    var merge: [Int] = []
    
    var aIdx = 0
    var bIdx = 0
    
    for _ in 0..<a1.count + a2.count {
        let a1Val = aIdx >= a1.count ? a2[bIdx] : a1[aIdx]
        let a2Val = bIdx >= a2.count ? a1[aIdx] : a2[bIdx]
        
        if a1Val < a2Val {
            merge.append(a1Val)
            aIdx += 1
        } else {
            merge.append(a2Val)
            bIdx += 1
        }
    }
    return merge
}

//print(mergeTwoArray([1, 2, 5, 9], [3, 4, 6, 7, 8]))

func designerPdfViewer(h: [Int], word: String) -> Int {
    let heights = word.map { h[Int($0.asciiValue!) - 97] }
    print(heights)
    let max = heights.lazy.sorted(by: >).first!
    
    return word.count * max
}
print(designerPdfViewer(h: [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7], word: "zaba"))
