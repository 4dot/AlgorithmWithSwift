// BinaryString Sum

import Foundation


func sumBinaryString(_ bin1: String, _ bin2: String) -> String {
    var result: String = ""
    let arr1 = Array(bin1)
    let arr2 = Array(bin2)
    
    let s1Idx = bin1.count - 1
    let s2Idx = bin2.count - 1
    let maxIdx = max(s1Idx, s2Idx)
    var carry = 0
    
    
    
    
    
    for idx in (0...maxIdx).reversed() {
        let char1 = idx > s1Idx ? Character("0") : arr1[idx]
        let char2 = idx > s2Idx ? Character("0") : arr2[idx]
        
        let arr1v = String(char1)
        let arr2v = String(char2)
        
        let s1Int = Int(arr1v) ?? 0
        let s2Int = Int(arr2v) ?? 0
        
        var value = (s1Int + s2Int + carry)
        carry = value / 2
        value %= 2
        
        result = "\(value)\(result)"
        print("idx: \(idx), \(s1Int) + \(s2Int) = carry: \(carry), value: \(value), result: \(result)")
    }
    
    result = "\(carry)\(result)"
    
    
    return result
}


print(sumBinaryString("1101", "1110")) // 11011
