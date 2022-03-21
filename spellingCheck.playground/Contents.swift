//: Playground - noun: a place where people can play

import UIKit



class TrieNode {
    var trie: [TrieNode?] = Array(repeating: nil, count: 256)
    var isEnd: Bool = false
}

func insertTrie(_ root: TrieNode, _ s: String) {
    var tmp = root
    
    for ch in s {
        if tmp.trie[Int(ch.asciiValue!)] == nil {
            tmp.trie[Int(ch.asciiValue!)] = TrieNode()
        }
        tmp = tmp.trie[Int(ch.asciiValue!)]!
    }
    tmp.isEnd = true
}

func checkSpell(_ root: TrieNode, _ word: String) -> Bool {
    var node = root
    
    for ch in word {
        if node.trie[Int(ch.asciiValue!)] == nil {
            return false
        }
        node = node.trie[Int(ch.asciiValue!)]!
    }
    return node.isEnd
}

func spellCheck(_ words: [String], _ dic: [String]) -> [String] {
    
    // Create Trie
    let trie = TrieNode()
    
    for word in dic {
        insertTrie(trie, word)
    }
    
    // Check Spell
    var result = [String]()
    for word in words {
        if !checkSpell(trie, word) {
            result.append(word)
        }
    }
    
    return result
}

print(spellCheck(["apple", "bnana", "applepie"], ["apple", "banana", "applepie"]))
