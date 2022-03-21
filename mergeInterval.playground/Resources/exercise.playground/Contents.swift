//: Playground - noun: a place where people can play

import Foundation
import UIKit

class Node {
    var name: String
    var left: Node?
    var right: Node?
    
    init(_ name: String) { self.name = name }
}

let root = Node("root")
let child1 = Node("child1")
let child2 = Node("child2")
let child3 = Node("child3")
let child4 = Node("child4")
let child5 = Node("child5")
root.left = child1
root.right = child2
child1.left = child3
child1.right = child4
child3.right = child5

var cnt = 0
func lca(_ view: Node?, _ node1: Node, _ node2: Node) -> Node? {
    print("cnt: \(cnt)")
    cnt += 1
    guard let view = view else {
        print(" view is nil")
        return nil
    }
    
    if view.name == node1.name || view.name == node2.name {
        print("found view \(view.name)")
        return view
    }
    
    
    let leftLca = lca(view.left, node1, node2)
    let rightLca = lca(view.right, node1, node2)
    
    print("\(leftLca?.name), \(rightLca?.name)")
    if leftLca != nil && rightLca != nil {
        return view
    }
    
    
    return leftLca != nil ? leftLca : rightLca
}

func lca1(_ view: Node?, _ node1: Node, _ node2: Node) -> Node? {
    var parent = view
    
    var left = view?.left
    var right = view?.right
    
    var down = view
    
    while left != nil || right != nil {
        
        if left != nil && right != nil {
            parent = view
        }
        
        left = down?.left
        right = down?.right
        
        down = left != nil ? left : right
        
    }
    
    return parent
}
//print(lca1(root, child5, child4)?.name)

//print(lca(root, child5, child4)?.name)

func isPrime(_ num: Int) -> Bool {
    if num <= 1 { return false }
    if num <= 3 { return true }
    
    if num%2 == 0 || num%3 == 0 {
        return false
    }
    
    var idx = 5
    repeat {
        if num%idx == 0 || num%(idx+2) == 0 {
            return false
        }
        idx += 6
    }
    while (idx * idx <= num)
    
    return true
}
//print(isPrime(17))
func isSquare(_ num: Int) -> Bool {
    let lastDigit = num%10
    
    let lastDigits = [0, 1, 4, 5, 6, 9]
    if lastDigits.contains(lastDigit) {
        return true
    }
    
    var divider = num / 2
    var prevDivider = divider
    
    while divider < num || divider > 1 {
        let val = divider * divider
        print(val)
        
        if val == num {
            return true
        }
        
        let addVal = prevDivider / 2
        if addVal < 1 {
            return false
        }
        prevDivider = addVal
        
        if val > num {
            divider -= addVal
        } else if val < num {
            divider += addVal
        } else if val == num {
            return true
        }
    }
    return false
}
//print(isSquare(16*18))

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let dic = Array(Set(wordDict))
    var queue = [Int]()
    var visited = [Int](repeating: 0, count: s.count)
    
    queue.append(0)
    
    let text = Array(s)
    
    while !queue.isEmpty {
        let start = queue.removeFirst()
        
        if visited[start] == 0 {
            for end in start+1...s.count {
                print(String(text[start..<end]))
                if dic.contains(String(text[start..<end])) {
                    print("--append")
                    queue.append(end)
                    if end == s.count {
                        return true
                    }
                }
            }
            visited[start] = 1
            print(visited)
            print(queue)
        }
    }
    return false
}

let s = "applepenapple", wordDict = ["apple", "pen"]
//print(wordBreak(s, wordDict))

let order = [1,2,3,3,3,4,5,5,6]
//print(Set(order))
//print(Array(NSOrderedSet(array: order)))
let cnt1 = NSCountedSet(array: order)
//print(cnt1.count(for: 3))

func diff(_ a1: [Int], _ a2: [Int], _ k: Int) -> Int {
    var cnt = 0
    
    for a in a1 {
        //cnt += a2.filter { abs(a - $0) <= k }.isEmpty  ? 1 : 0
        var isGreater = true
        for b in a2 {
            if abs(a - b) <= k {
                isGreater = false
                break
            }
        }
        cnt += (isGreater ? 1 : 0)
    }
    return cnt
}

//[7, 6, 9] B = [13, 1, 4] and d = 3 return 1
//print(diff([7, 6, 9], [13, 1, 4], 3))


func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    if nums.isEmpty || nums.count < k {
        return []
    }
    
    var result: [Int] = []
    
    // queue for saved index
    var queue: [Int] = []
    
    for idx in 0..<nums.count {
        if idx >= k {
            result.append(nums[queue.first!])
        }
        
        // remove index of outside of range
        if queue.isEmpty == false && queue.first! <= (idx - k) {
            print("- removed first: \(queue.first!) <= \((idx - k))")
            queue.removeFirst()
        }
        
        while queue.isEmpty == false && nums[queue.last!] <= nums[idx] {
            print("- removed last : \(nums[queue.last!]) <= \(nums[idx])")
            queue.removeLast()
        }
        
        queue.append(idx)
        print("\(idx), q: \(queue), result: \(result)")
    }
    
    // append last max
    result.append(nums[queue.first!])
    
    return result
}


//print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))

func diffVal(_ num: Int) -> Int {
    let chars = Array(String(num))
    
    var mul = Int(chars[0].asciiValue! - Character("0").asciiValue!)
    var sum = mul
    
    for idx in 1..<chars.count {
        let val = Int(chars[idx].asciiValue! - Character("0").asciiValue!)
        mul *= val
        sum += val
        
    }
    return mul - sum
}
//print(diffVal(123456))

func maxSeq(_ a: [Int], _ b: [Int]) -> Int {
    let arr = (a + b).sorted()
    
    var result = 0
    var map = [Int: [Int : Int]]()
    for idx in 0..<arr.count {
        map[idx] = [Int : Int]()
    }
    
    for i in 1..<arr.count {
        for j in 0..<i {
            let diff = arr[i] - arr[j]
            
            var len = 2
            
            if map[j]?[diff] != nil {
                len = map[j]![diff]! + 1
            }
            
            map[i]![diff] = len
            result = max(result, map[i]![diff]!)
        }
        print(map)
    }
    
    return result
}

//print(maxSeq([2,4,8], [1,6,10,12]))

func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    if nums.count < 2 { return false }
    
    var map = [Int : Int]()
    map[0] = -1
    var curSum = 0
    
    for idx in 0..<nums.count {
        curSum += nums[idx]
        
        if k != 0 {
            curSum = curSum % k
        }
        if let sum = map[curSum] {
            if idx - sum > 1 {
                return true
            }
        } else {
            map[curSum] = idx
        }
        print(map)
    }
    
    return false
}
//print(checkSubarraySum([23,2,4,6,7], 6))

let rootView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
rootView.accessibilityIdentifier = "rootView"
let child01 = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
child01.accessibilityIdentifier = "child01"
let child11 = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
child11.accessibilityIdentifier = "child11"
let child12 = UIView(frame: CGRect(x: 15, y: 10, width: 10, height: 10))
child12.accessibilityIdentifier = "child12"

rootView.addSubview(child01)
child01.addSubview(child11)
child01.addSubview(child12)

let child02 = UIView(frame: CGRect(x: 10, y: 60, width: 30, height: 30))
child02.accessibilityIdentifier = "child02"
rootView.addSubview(child02)

func touchedView(_ root: UIView?, _ pos: CGPoint) -> UIView? {
    return getTouchedView(rootView, pos)
}

func getTouchedView(_ root: UIView?, _ pos: CGPoint) -> UIView? {
    guard let root = root else {
        return nil
    }
    
    for child in root.subviews.reversed() {
        let covPos = child.convert(pos, from: root)
        
        print("\(child.accessibilityIdentifier), \(covPos)")
        
        if child.bounds.contains(covPos) {
            print(" contains true")
            if let touched = getTouchedView(child, covPos) {
                return touched
            }
            return child
        }
    }
    return root.bounds.contains(pos) ? root : nil
}

let touched = touchedView(rootView, CGPoint(x: 26, y: 23))
let touchedName = touched != nil ? touched!.accessibilityIdentifier : "none"
print(touchedName)
