//: Playground - noun: a place where people can play

import Foundation

/*
// This function adds two binary strings and return
// result as a third string
string addBinary(string a, string b)
{
    string result = ""; // Initialize result
    int s = 0;          // Initialize digit sum
    
    // Traverse both strings starting from last
    // characters
    int i = a.size() - 1, j = b.size() - 1;
    while (i >= 0 || j >= 0 || s == 1)
    {
        // Comput sum of last digits and carry
        s += ((i >= 0)? a[i] - '0': 0);
        s += ((j >= 0)? b[j] - '0': 0);
        
        // If current digit sum is 1 or 3, add 1 to result
        result = char(s % 2 + '0') + result;
        
        // Compute carry
        s /= 2;
        
        // Move to next digits
        i--; j--;
    }
    return result;
}
*/
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


print(sumBinaryString("1101", "1110"))
