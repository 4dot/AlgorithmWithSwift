//: Playground - noun: a place where people can play

import Foundation
import UIKit



// Trie
class WordDic {
    var isEnd = false
    var trie: [Character : WordDic] = [:]
}

struct Trie {
    var wordDic = WordDic()
    
    func add(_ word: String) {
        var dic = wordDic
        
        for ch in word {
            if dic.trie[ch] == nil {
                dic.trie[ch] = WordDic()
            }
            dic = dic.trie[ch]!
        }
        dic.isEnd = true
    }
    
    func suggest(_ word: String) -> [String] {
        var dic = wordDic
        let chars = Array(word)
        
        var idx = 0
        while idx < word.count {
            if dic.trie[chars[idx]] == nil {
                return []
            }
            dic = dic.trie[chars[idx]]!
            idx += 1
        }
        
        return findSuggest(word, dic)
    }
    
    func findSuggest(_ word: String, _ dic: WordDic?) -> [String] {
        guard let dic = dic else { return [] }
        
        var result = [String]()
        
        for key in dic.trie.keys {
            if dic.trie[key]!.isEnd {
                result.append(word + "\(key)")
                result += findSuggest(word + "\(key)", dic.trie[key])
            }
        }
        return result
    }
}

let dic = ["car", "cat", "cow", "dog"]
let trie = Trie()
dic.forEach { trie.add($0) }
print(trie)

print(trie.suggest("c"))

