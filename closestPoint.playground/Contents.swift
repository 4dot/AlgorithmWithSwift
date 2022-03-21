//: Playground - noun: a place where people can play

import Foundation

func kClosest(_ points: [Int], _ k: Int) -> [Int] {
    var left = 0
    var right = points.count - 1
    var array = points

    while left <= right {
        let p = partition(&array, left, right, right)
        if p == k { return Array(array[0 ..< k ]) }
        if p < k { left = p + 1 }
        else { right = p - 1 }
    }

    return Array(array[0 ..< left])
}


func partition(_ array: inout [Int], _ left: Int, _ right: Int,_ pivot: Int ) -> Int {
    let pivot = array[pivot]
    var i = left
    for j in left ..< right {

        print("pivot: \(pivot), target: \(array[j]), res: \(array)")
        if array[j] < pivot {
            (array[i], array[j]) = (array[j], array[i])
            print(" swap res: \(array)")
            
            i += 1
        }

    }

    (array[i], array[right]) = (array[right], array[i])
    print(" last swap res: \(array)")

    return i
}

extension Array where Element == Int {
    var x: Element { return self[0] }
    var y: Element { return self[1] }
    
    var distance: Int {
        x * x + y * y
    }
}

print(kClosest([1,2,3,4,5], 2))


