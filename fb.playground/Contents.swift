//: Playground - noun: a place where people can play

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Enumerator {
   var pos = 0
    var subEnum: Enumerator?
    let array: [Any]

    init(_ arr: [Any]) {
        self.array = arr
    }
    func next() -> Int? {
        if subEnum != nil {
            if let n = subEnum!.next() {
                return n
            } else {
                subEnum = nil
                pos += 1
            }
        }

        if pos == array.count {
            return nil
        }

        let n = array[pos]

        if n is [Any] {
            subEnum = Enumerator(n as! [Any])
            return subEnum!.next()
        }
        pos += 1
        return n as? Int
    }

    func all() -> [Int] {
        var result = [Int]()
        let e = Enumerator(array)
        var n = e.next()
        while n != nil {
            result.append(n!)
            n = e.next()
        }
        return result
    }
}


func findCloneView(_ oriView: UIView, in clonedView: UIView) {
    var path = [Int]()
    var view: UIView? = oriView
    
    while view != nil {
        let tmp = view!
        view = view!.superview
        if let idx = view?.subviews.firstIndex(of:tmp) {
            path.append(idx)
        }
    }

    view = clonedView
    for idx in path.reversed() {
        view = view?.subviews[idx]
    }
    print("cloned view is: \(view!.tag)")
}


//-------------------------------------------

var dismissnotificationTask: DispatchWorkItem?

dismissnotificationTask = DispatchWorkItem {
    print("hell")
}

if let dTask = dismissnotificationTask {
    let delay = DispatchTime.now() + .seconds(8)
    DispatchQueue.main.asyncAfter(deadline: delay, execute: dTask)
}

dismissnotificationTask?.cancel()
//-------------------------------------------

//let a: [Any] = [1,2,[3,4,[5],6],7]
//let e = Enumerator(a)
//print(e.next())
//print(e.next())
//print(e.all())

var result = [String]()
var rows: Int = 0
var cols: Int = 0

func possiblePath(_ row: Int, _ col: Int) -> [String] {
    rows = row
    cols = col
    generatePath("", 0, 0)
    return result
}

func generatePath(_ path: String, _ row: Int, _ col: Int) {
    if row >= rows - 1 && col >= cols - 1 {
        result.append(path)
        return
    }

    if row < rows - 1 {
        generatePath(path + " |", row + 1, col)
    }

    if col < cols - 1 {
        generatePath(path + " --", row, col + 1)
    }
}

//possiblePath(3, 3)
//for res in result { print(res)}

func hitTest(_ view: UIView?, _ point: CGPoint, _ clipToBounds: Bool) -> UIView? {
    guard let view = view else { return nil }
    
    if clipToBounds && !view.bounds.contains(point) {
        return nil
    }
    
    for child in view.subviews.reversed() {
        let convertedPoint = child.convert(point, from: view)
        
        if let hit = hitTest(child, convertedPoint, clipToBounds) {
            return hit
        }
    }
    return view
}

var root = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
root.accessibilityIdentifier = "root"
var child1 = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
child1.accessibilityIdentifier = "child1"
var child2 = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
child2.accessibilityIdentifier = "child2"
root.addSubview(child1)
child1.addSubview(child2)

//print(hitTest(root, CGPoint(x: 15, y: 15), true)?.accessibilityIdentifier)
//print(hitTest(root, CGPoint(x: 60, y: 60), true)?.accessibilityIdentifier)
//print(hitTest(root, CGPoint(x: 130, y: 130), true)?.accessibilityIdentifier)

func commonParent(_ view1: UIView?, _ view2: UIView?) -> UIView? {
    var v1 = view1
    var v2 = view2
    
    while v1 != v2 {
        v1 = v1?.superview != nil ? v1?.superview : v2
        v2 = v2?.superview != nil ? v2?.superview : v1
    }
    return v1
}
//print(commonParent(child1, root)?.accessibilityIdentifier)

func sumDepth(_ arr: [Any], _ depth: Int) -> Int {
    var result = 0
    
    for ar in arr {
        if ar as? [Any] != nil {
            result += sumDepth(ar as! [Any], depth + 1)
        } else {
            result += ar as! Int * depth
        }
    }
    return result
}


//let depth: [Any] = [2,3,[9,[1,2]],4]
//print(sumDepth(depth, 1))

func toLeaf(_ node: TreeNode?, _ path: String) -> [String] {
    var paths = [String]()
    
    guard let node = node else {
        return paths
    }
    
    let curr = path + "\(node.val)"
    
    if node.left == nil && node.right == nil {
        paths.append(curr)
    } else {
        paths += toLeaf(node.left, curr + "->")
        paths += toLeaf(node.right, curr + "->")
    }
    return paths
}

// T: (NLogN * N)
func anagrams1(_ arr: [String]) -> [String] {
    var sets = Set<String>()
    var result = [String]()
    
    for str in arr {
        if !sets.contains(String(str.sorted())) {
            result.append(str)
        }
        sets.insert(String(str.sorted()))
    }
    return result
}

// T: O(N * max(element size)), O(N)
func findAnagrams(_ arr: [String]) -> [String] {
    var sets = Set<[Character : Int]>()
    var result = [String]()
    
    for str in arr {
        var map = [Character : Int]()
        str.forEach { map[$0, default: 0] += 1 }
        
        if !sets.contains(map) {
            result.append(str)
            sets.insert(map)
        }
    }
    return result
}
func getcntMap(_ str: String) -> [Character : Int] {
    var map = [Character : Int]()
    str.forEach { map[$0, default: 0] += 1 }
    return map
}

let an = ["school", "hell", "lleh", "lschoo", "test"]
print(findAnagrams(an))
