import UIKit


struct Point {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}
struct Node {
    var pos: Point
    var data: Int
    
    init(_ p: Point, _ data: Int) {
        self.pos = p
        self.data = data
    }
}

class Quad {
    var topLeft: Point
    var botRight: Point
    
    // sqrt(pow(Double(botRight.x - topLeft.x), 2) + pow(Double(topLeft.y - botRight.y), 2))
    var node: Node?
    
    var tl: Quad?
    var tr: Quad?
    var bl: Quad?
    var br: Quad?
    
    init(_ tl: Point, _ br: Point) {
        self.topLeft = tl
        self.botRight = br
    }
}

extension Quad {
    func inBound(_ p: Point) -> Bool {
        if self.topLeft.x <= p.x &&
            self.botRight.x >= p.x &&
            self.topLeft.y >= p.y &&
            self.botRight.y <= p.y {
            return true
        }
        return false
    }
    
    
}
extension Quad {
    func insert(_ node: Node?) {
        guard let node = node else {
            return
        }
        if inBound(node.pos) == false {
            print("out of bounds")
            return
        }
        
        if abs(topLeft.x - botRight.x) <= 1 && abs(topLeft.y - botRight.y) <= 1 {
            print("---reach min range")
            self.node = self.node ?? node
            return
        }
        
        let midx = (botRight.x - topLeft.x) / 2
        let midy = (topLeft.y - botRight.y) / 2
        
        print(" midx: \(midx), midy: \(midy)")
        
        // left
        if node.pos.x <= (self.topLeft.x + midx) {
            // top
            if node.pos.y >= (self.botRight.y + midy) {
                let TL = self.tl ?? Quad(self.topLeft, Point(self.botRight.x - midx, self.botRight.y + midy))
                print("@ insert left top: \(TL.topLeft), \(TL.botRight)")
                self.tl = TL
                TL.insert(node)
            } else {
                let BL = self.bl ?? Quad(Point(self.topLeft.x, self.topLeft.y - midy), Point(self.botRight.x - midx, self.botRight.y))
                print("@ insert left bottom: \(BL.topLeft), \(BL.botRight)")
                self.bl = BL
                BL.insert(node)
            }
        }
        else {
            if node.pos.y >= (self.botRight.y + midy) {
                let TR = self.tr ?? Quad(Point(self.topLeft.x + midx, self.topLeft.y), Point(self.botRight.x, self.botRight.y + midy))
                print("@ insert right top: \(TR.topLeft), \(TR.botRight)")
                self.tr = TR
                TR.insert(node)
            } else {
                let BR = self.br ?? Quad(Point(self.topLeft.x + midx, self.topLeft.y - midy), self.botRight)
                print("@ insert right bottom: \(BR.topLeft), \(BR.botRight)")
                self.br = BR
                BR.insert(node)
            }
        }
    }
    
    func search(_ p: Point) -> Node? {
        if inBound(p) == false {
            print("out of bounds")
            return nil
        }
        
        if self.node != nil {
            print("find \(p)")
            return node
        }
        
        let midx = (botRight.x - topLeft.x) / 2
        let midy = (topLeft.y - botRight.y) / 2
        
        // left
        if p.x <= (self.topLeft.x + midx) {
            if p.y >= (self.botRight.y + midy) {
                print("@ find top left")
                guard let TL = self.tl else {
                    print("@ can't find in top left")
                    return nil }
                return TL.search(p)
            } else {
                print("@ find bottom left")
                guard let BL = self.bl else {
                    print("@ can't find in bottom left")
                    return nil }
                return BL.search(p)
            }
        }
        else {
            if p.y >= (self.botRight.y + midy) {
                print("@ find top right")
                guard let TR = self.tr else {
                    print("@ can't find in top right")
                    return nil }
                return TR.search(p)
            } else {
                guard let BR = self.br else {
                    print("@ find bottom right")
                    print("@ can't find in bottom right")
                    return nil }
                return BR.search(p)
            }
        }
    }
}

let center = Quad(Point(0, 8), Point(8, 0))
let a = Node(Point(1, 1), 1)
let b = Node(Point(2, 5), 2)
let c = Node(Point(7, 6), 3)
center.insert(a)
center.insert(b)
center.insert(c)

let s1 = center.search(Point(1, 1))
print("Node a: \(s1?.data)")
let s2 = center.search(Point(2, 5))
print("Node b: \(s2?.data)")
let s3 = center.search(Point(7, 6))
print("Node c: \(s3?.data)")
let s4 = center.search(Point(5, 5))
print("Node ?: \(s4?.data)")
