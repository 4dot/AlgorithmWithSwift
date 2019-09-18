//: Playground - noun: a place where people can play

import Foundation



//func findWordLadder(start: String, end: String, arr: [String]) -> [String] {
//    // find one diffent word
//    var firstWord = start
//    var filteredArr = arr
//
//    var findNextWords: [String] {
//        return filteredArr.filter { (word) -> Bool in
//            var diffCnt = 0
//            for idx in 0..<word.count {
//                diffCnt += (Array(firstWord)[idx] != Array(word)[idx]) ? 1 : 0
//            }
//            return diffCnt <= 1
//        }
//    }
//
//    var ladders: [String] = [start]
//    var idx = 0
//
//    while idx < ladders.count {
//        if let nextword = findNextWords.first {
//            if findNextWords.contains(end) {
//                ladders.append(end)
//                return ladders
//            } else {
//                ladders.append(nextword)
//                firstWord = nextword
//                filteredArr.removeAll { $0 == nextword }
//            }
//        }
//        idx += 1
//    }
//
//    return ladders
//}
//
//// hit hot dot dog cog
//// hit hot lot log cog
//
//print(findWordLadder(start: "hit", end: "cog", arr: ["hot","dot","dog","lot","log", "cog"]))


//func checkValidCard(cardNo: String) -> Bool {
//    var sum = 0
//    var idx = 0
//
//    cardNo.reversed().forEach {
//        guard let number = Int(String($0)) else {
//            return
//        }
//
//        let value = (idx % 2) > 0 ? (number * 2) : number
//        sum += value % 10
//        sum += value / 10
//
//        idx += 1
//    }
//
//    return sum % 10 == 0
//}
//
//let cardNo = "67737854355"//"79927398713"
//print(checkValidCard(cardNo: cardNo))
//
//func createCardNo(size: Int) -> String {
//    var idx = 0
//    var sum = 0
//    var cardNo: String = ""
//
//    (0..<size-1).reversed().forEach { pos in
//        let number = Int.random(in: 0..<10)
//        let value = (idx % 2) > 0 ? (number * 2) : number
//        sum += value % 10
//        sum += value / 10
//
//        cardNo = "\(number)\(cardNo)"
//
//        idx += 1
//    }
//
//    print(sum)
//    var lastNumber = 10 - (sum % 10)
//    if lastNumber > 0 {
//        lastNumber = (idx % 2) > 0 && lastNumber > 5 ? lastNumber - 1 : lastNumber
//    }
//    cardNo = "\(lastNumber)\(cardNo)"
//
//    return cardNo
//
//}
//
//print(createCardNo(size: 11))


////
//// reverse linked list
////

class Link {
    var next: Link?
    var data: Int
    
    init() {
        next = nil
        data = 0
    }
}

func createLinkedList(cnt: Int) -> Link {
    let head = Link()
    head.data = 1
    
    
    var pos: Link = head
    
    // 10 link
    (2...10).forEach {
        let tail = Link()
        tail.data = $0
        pos.next = tail
        pos = tail
    }
    
    return head
}

func printLinkedList(head: Link) {
    var pos: Link? = head
    
    repeat {
        print("\(pos?.data ?? -1)")
        pos = pos?.next
    } while(pos != nil)
}

func reverseLinkedList(head: Link) -> Link? {
    var curr: Link? = head
    var prev: Link? = nil
    var next: Link? = nil
    
    repeat {
        next = curr?.next
        curr?.next = prev
        prev = curr
        curr = next
        
    } while(curr != nil)
    
    var newHead: Link? = head
    newHead = prev
    
    return newHead
}

func reverseLinkedListRecusive(head: Link?) -> Link? {
    var prev: Link? = nil
    
    if head?.next != nil {
        prev = reverseLinkedListRecusive(head: head?.next)
    } else {
        return head
    }
    
    head?.next = prev
    print("\(head?.data ?? -1)")
    
    return head
}



let linkedList = createLinkedList(cnt: 10)
//print(printLinkedList(head: linkedList))

let reverse = reverseLinkedList(head: linkedList)
//print(printLinkedList(head: reverse!))

reverseLinkedListRecusive(head: linkedList)
