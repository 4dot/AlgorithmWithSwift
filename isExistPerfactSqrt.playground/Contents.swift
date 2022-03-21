//: Playground - noun: a place where people can play

import Foundation

//
// https://teus.me/9
// https://codingdog.tistory.com/entry/%EB%B0%94%EB%B9%8C%EB%A1%9C%EB%8B%88%EC%95%84-%EB%B2%95-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-%EC%96%B4%EB%96%BB%EA%B2%8C-sqrt-%ED%95%A8%EC%88%98%EB%A5%BC-%EA%B5%AC%ED%98%84%ED%95%A0%EA%B9%8C%EC%9A%94
//

func isExistPefectSqrt(_ num: Int) -> Bool {
    // create table
    let baseNum = 16
    var tbl = Array(repeating: false, count: baseNum)
    for idx in 0..<baseNum {
        tbl[idx * idx % baseNum] = true
    }
    
    //if tbl[num & (baseNum - 1)] {
        let sq = Int(mySqrt(Double(num) + 0.5))
        print("sq: \(sq), sq^2: \(sq * sq)")
        return sq * sq == num
    //}
    
    return false
}

func mySqrt(_ sq: Double) -> Double {
    var x: Double = 2
    
    for _ in 0..<10 {
        x = (x + (sq / x)) / 2
     
    }
    return x
}

for idx in 0..<10 {
    print("\(idx): \(isExistPefectSqrt(idx))")
}

