//: Playground - noun: a place where people can play

import UIKit

struct Booking {
    var name: String
    var startTime: Int
    var endTime: Int
    
    init(_ name: String, _ start: Int, _ end: Int) {
        self.name = name
        self.startTime = start
        self.endTime = end
    }
}

func maxPossibleBooking(_ bookings: [Booking]) -> [Booking] {
    if bookings.count <= 0 {
        return []
    }
    // using greedy
    
    // 1. sort by endTime
    let sortedBooking = bookings.sorted { $0.endTime < $1.endTime }
    
    var possibleBooking: [Booking] = [sortedBooking.first!]
    
    for nextIdx in 1..<sortedBooking.count {
        if possibleBooking.last!.endTime > sortedBooking[nextIdx].startTime {
            print("continue : \(nextIdx)")
            continue
        }
        possibleBooking.append(sortedBooking[nextIdx])
        print(sortedBooking[nextIdx])
    }
    return possibleBooking
}

let books = [Booking("one", 1, 3), Booking("two", 2, 5), Booking("three", 3, 6), Booking("four", 4, 5), Booking("five", 7, 8)]
print(maxPossibleBooking(books))



