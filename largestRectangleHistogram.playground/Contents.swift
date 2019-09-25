//: Playground - noun: a place where people can play

import UIKit



struct Histogram {
    var w: Int
    var h: Int
    
    init(_ w: Int, _ h: Int) {
        self.w = w
        self.h = h
    }
}

// Time Complexity O(n^3)
func largestRect(_ histograms: [Histogram]) -> Int {
    var maxArea: Int = 0
    
    for i in 0..<histograms.count {
        var minH = 0
        
        for j in i..<histograms.count {
            minH = min(histograms[i].h, histograms[j].h)
            
            for k in i..<j {
                minH = min(minH, histograms[k].h)
            }
            
            maxArea = max(maxArea, minH * ((j - i) + 1))
            //print("minH: \(minH), \(maxArea)")
        }
    }
    
    return maxArea
}

// Time Complexity O(n^2)
func largestRect2(_ histograms: [Histogram]) -> Int {
    var maxArea: Int = 0
    
    for i in 0..<histograms.count {
        var minH = histograms[i].h
        
        for j in i..<histograms.count {
            minH = min(minH, histograms[j].h)
            maxArea = max(maxArea, minH * ((j - i) + 1))
        }
    }
    return maxArea
}

// Time Complexity O(n)
func largestRect3(_ histograms: [Histogram]) -> Int {
    var stack = [Int]() // index stack
    var maxArea: Int = 0
    
    for i in 0..<histograms.count {
        
        while let pop = stack.last, histograms[pop].h >= histograms[i].h {
            stack.removeLast()
            
            let width = stack.last == nil ? i : (i - stack.last! - 1)
            maxArea = max(maxArea, histograms[pop].h * width)
        }
        stack.append(i)
        
        print("max: \(maxArea), \(stack)")
    }
    
// remove below code if append a dummy data (0, 0)
    
    while let pop = stack.last {
        stack.removeLast()

        let stackLast = stack.last ?? 0
        maxArea = max(maxArea, histograms[pop].h * (histograms.count - stackLast - 1))
        //print("--max: \(maxArea), \(stack)")
    }
    
    return maxArea
}


//let histograms = [Histogram(1, 2), Histogram(1, 1), Histogram(1, 5), Histogram(1, 6), Histogram(1, 2), Histogram(1, 3), Histogram(1, 0)]
let histograms = [Histogram(1, 1), Histogram(1, 2), Histogram(1, 3), Histogram(1, 0)]//, Histogram(1, 6), Histogram(1, 2), Histogram(1, 3), Histogram(1, 0)]

print(largestRect(histograms))
print(largestRect2(histograms))
print(largestRect3(histograms))



func large(_ array: [Histogram]) -> Int {
    
    var maxArea = 0
    var stack: [Int] = [0]
    
    for i in 1..<array.count {
        while let pop = stack.last, array[pop].h >= array[i].h {
            stack.removeLast()
            
            let width = stack.last == nil ? i : (i - stack.last! - 1)
            maxArea = max(maxArea, histograms[pop].h * width)
        }
        stack.append(i)
    }
    
    return maxArea
}

print(large(histograms))

