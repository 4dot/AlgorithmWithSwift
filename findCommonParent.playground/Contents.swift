//: Playground - noun: a place where people can play

import UIKit

//let root = UIView(frame: CGRect(x: 10,y: 10,width: 100,height: 100))
//root.accessibilityIdentifier = "root"
//let child1 = UIView(frame: CGRect(x: 20, y: 20, width: 120, height: 120))
//child1.accessibilityIdentifier = "child1"
//let child2 = UIView(frame: CGRect(x: 50,y: 50,width: 20,height: 20))
//child2.accessibilityIdentifier = "child2"
//let child3 = UIView(frame: CGRect(x: 30,y: 80,width: 20,height: 70))
//child3.accessibilityIdentifier = "child3"
//
//root.addSubview(child1)
//child1.addSubview(child2)
//root.addSubview(child3)


func findCommonParent(_ a: UIView, _ b: UIView) -> UIView? {
    var descendant: UIView? = b
    
    while descendant != nil {
        if a.isDescendant(of: descendant!) {
            return descendant
        }
        descendant = b.superview
    }
    return nil
}

func findCommonParent1(_ a: UIView, _ b: UIView) -> UIView? {
    var view1: UIView? = a
    var view2: UIView? = b
    
    while view1 != view2 {
        view1 = (view1 == nil) ? b : view1?.superview
        view2 = (view2 == nil) ? a : view2?.superview
    }
    return view1
}

func touchInside(_ view: UIView?, _ point: CGPoint, _ clipToBounds: Bool) -> UIView? {
    guard let view = view else { return nil }
    
    let touched = view.bounds.contains(point) ? view : nil
    if clipToBounds && touched == nil {
        return nil
    }
    
    for child in view.subviews.reversed() {
        let converted = child.convert(point, from: view)
        
        if let childTouched = touchInside(child, converted, clipToBounds) {
            return childTouched
        }
    }
    
    return touched
}

func printChild(_ view: UIView?, _ depth: String) {
    guard let view = view else { return }
    
    print("\(depth) \(view.accessibilityIdentifier!)")
    
    for child in view.subviews.reversed() {
        printChild(child, depth + "-")
    }
}

//print(findCommonParent1(root, child3)?.accessibilityIdentifier)
//print(touchInside(root, CGPoint(x: 11,y: 11), true)?.accessibilityIdentifier ?? "nil")
//print(touchInside(root, CGPoint(x: 30,y: 30), true)?.accessibilityIdentifier ?? "nil")
//print(touchInside(root, CGPoint(x: 80,y: 80), true)?.accessibilityIdentifier ?? "nil")
//print(touchInside(root, CGPoint(x: 110,y: 110), true)?.accessibilityIdentifier ?? "nil")
//print(touchInside(root, CGPoint(x: 40,y: 80), true)?.accessibilityIdentifier ?? "nil")

let root = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height:100)))
root.accessibilityIdentifier = "Root"
let child1 = UIView(frame: CGRect(origin: CGPoint(x: 20, y: 20), size: CGSize(width: 100, height:100)))
child1.accessibilityIdentifier = "child1"
let child2 = UIView(frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 100, height:100)))
child2.accessibilityIdentifier = "child2"
root.addSubview(child1)
child1.addSubview(child2)

let child3 = UIView(frame: CGRect(origin: CGPoint(x: 20, y: 20), size: CGSize(width: 100, height:100)))
child3.accessibilityIdentifier = "child3"
root.addSubview(child3)


//print(touchInside(root, CGPoint(x:30, y: 30), false)?.accessibilityIdentifier)
//print(touchInside(root, CGPoint(x:80, y: 110), false)?.accessibilityIdentifier)
//print(touchInside(root, CGPoint(x:80, y: 110), true)?.accessibilityIdentifier)
//printChild(root, "")

var a: [Character] = ["a", "b", "c", "d"]
let b: [Character] = ["d", "e"]

func mergeTwo(_ a: [Character], _ b: [Character]) -> [Character] {
    var sum = b
    var map = [Character : Int]()
    b.forEach { map[$0, default: 0] += 1 }
    
    for item in a {
        if map[item] == nil {
            sum.append(item)
        }
    }
    return sum
}

class MyEnumerator {
    var flat: [Int] = []
    
    
    init(_ values: [Any]) {
        toFlat(values)
    }
    
    func toFlat(_ values: [Any]) {
        for value in values {
            if let value = value as? Int {
                flat.append(value)
            } else if let arr = value as? [Any] {
                toFlat(arr)
            }
        }
    }
    
    func next() -> Int? {
        return flat.removeFirst()
    }
    
    func nextAll() -> [Int] {
        return flat
    }
}

let en: [Any] = [1, 2, [3,4,[5]], 6, 7]
let m = MyEnumerator(en)

print(m.flat)
print(m.next())
print(m.next())
print(m.nextAll())


