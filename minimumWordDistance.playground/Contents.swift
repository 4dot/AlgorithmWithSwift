//: Playground - noun: a place where people can play

import Foundation



//Examples:
//Input: arr[] = {1, 2}, x = 1, y = 2
//Output: Minimum distance between 1 and 2 is 1.
//
//Input: arr[] = {3, 4, 5}, x = 3, y = 5
//Output: Minimum distance between 3 and 5 is 2.
//
//Input: arr[] = {3, 5, 4, 2, 6, 5, 6, 6, 5, 4, 8, 3}, x = 3, y = 6
//Output: Minimum distance between 3 and 6 is 4.
//
//Input: arr[] = {2, 5, 3, 5, 4, 4, 2, 3}, x = 3, y = 2
//Output: Minimum distance between 3 and 2 is 1.



func minimumIndexDistance(start: Int, end: Int, arr: [Int]) -> Int {
    var minDistance = Int.max
    
    // find occurence number
    guard let foundIdx = (arr.firstIndex{ $0 == start || $0 == end }) else {
        print("can't find start or end")
        return minDistance
    }
    
    var foundValue = arr[foundIdx]
    
    for idx in foundIdx..<arr.count {
        let nextValue = arr[idx]
        
        // find next occurence number
        if (nextValue == start || nextValue == end), nextValue != foundValue {
            
            // check distance
            minDistance = min(minDistance, (idx - foundIdx))
            foundValue = nextValue
        }
    }
    
    return minDistance
}

func minimumWordDistance(start: String, end: String, arr: [String]) -> Int {
    var minDistance = Int.max
    
    // find occurence number
    guard let foundIdx = (arr.firstIndex{ $0 == start || $0 == end }) else {
        print("can't find start or end")
        return minDistance
    }
    
    var foundValue = arr[foundIdx]
    
    for idx in foundIdx..<arr.count {
        let nextValue = arr[idx]
        
        // find next occurence number
        if (nextValue == start || nextValue == end), nextValue != foundValue {
            
            // check distance
            minDistance = min(minDistance, (idx - foundIdx))
            foundValue = nextValue
        }
    }
    
    return minDistance
}

// C style
func minDist(arr: [Int], n: Int, x: Int, y: Int) -> Int
{
    var idx = 0
    var min_dist: Int = Int.max
    var prev: Int = 0
    
    // Find the first occurence of any of the two numbers (x or y)
    // and store the index of this occurence in prev
    for i in 0..<n
    {
        if (arr[i] == x || arr[i] == y)
        {
            prev = i;
            idx = i
            break;
        }
    }
    
    // Traverse after the first occurence
    for j in idx..<n
    {
        if (arr[j] == x || arr[j] == y)
        {
            // If the current element matches with any of the two then
            // check if current element and prev element are different
            // Also check if this value is smaller than minimm distance so far
            if ( arr[prev] != arr[j] && (j - prev) < min_dist )
            {
                min_dist = j - prev;
                prev = j;
            }
            else {
                prev = j;
            }
        }
    }
    
    return min_dist;
}

class wordDistance {
    var dic: [String : [Int]] = [:]
    
    init(_ words: [String]) {
        words.enumerated().forEach {
            if dic[$1] != nil {
                dic[$1]!.append($0)
            } else {
                dic[$1] = [$0]
            }
        }
    }
    
    func distance(wordOne: String, wordTwo: String) -> Int {
        
        guard let wordOnes = dic[wordOne],
            let wordTwos = dic[wordTwo] else {
                return 0
        }
        
        print(wordOnes)
        print(wordTwos)
        
        var minDist = Int.max
        wordOnes.forEach {
            let one = $0;
            wordTwos.forEach { minDist = min(abs(one - $0), minDist) }
        }
        return minDist
    }
}

//let minDistance1 = minimumIndexDistance(start: 3, end: 6, arr: [3, 5, 4, 2, 6, 5, 6, 6, 5, 4, 8, 3])
//print(minDistance1)
//
//let minDistance2 = minDist(arr: [3, 5, 4, 2, 6, 3, 0, 0, 5, 4, 8, 3], n: 12, x:3, y: 6)
//print(minDistance2)
//
//let minDistance3 = minimumWordDistance(start: "def", end: "jkl", arr: ["abc", "def", "ghi", "jkl", "mno", "pqr"])
//print(minDistance3)
//
//let wordDistance4 = wordDistance(["abc", "def", "aaa", "jkl", "mno", "def", "jkl"])
//print(wordDistance4.distance(wordOne: "def", wordTwo: "jkl"))


func minimumWordDistance3(start: String, end: String, arr: [String]) -> Int {
    // check status
    // 1. exist dup?
    // 2. lower, upper case matter?
    
    var distance = Int.max
    var wordIdx = -1
    var currWord: String?
    
    for (idx, word) in arr.enumerated() {
        if word == start || word == end {
            
            if let prevWord = currWord,
                word != prevWord {
                // update distance
                distance = min(distance, idx - wordIdx)
            }
            currWord = word
            wordIdx = idx
            
            print("curr: \(currWord), idx: \(wordIdx), dist: \(distance)")
        }
    }
    
    return distance
}

print(minimumWordDistance3(start: "def", end: "jkl", arr: ["abc", "def", "jkl", "ghi", "jkl", "mno", "pqr"]))

