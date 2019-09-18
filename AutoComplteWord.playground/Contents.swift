//: Playground - noun: a place where people can play

import UIKit

/// Simple Node class
class Node {
    var prefix: String
    var children: [Character : Node]
    var isWord: Bool
    
    init(_ prefix: String) {
        self.prefix = prefix
        children = [:]
        isWord = false
    }
}

class AutoCompleteWord {
    var root: Node = Node("")
    var autoWords: [String] = []
    
    
    init(dic: [String]) {
        dic.forEach { insertWord(word: $0) }
    }
    
    private func insertWord(word: String) {
        var node = root
        let characters = Array(word)
        
        for (idx, char) in characters.enumerated() {
            if node.children[char] == nil {
                node.children[char] = Node(String(characters[0...idx]))
            }
            guard let nextNode = node.children[char] else { continue }
            node = nextNode
        }
        node.isWord = true
    }
    
    private func getWord(from node: Node) {
        if node.isWord {
            autoWords.append(node.prefix)
        }
        for char in node.children.keys {
            getWord(from: node.children[char]!)
        }
    }
    
    func getAutoCompleteWords(word: String)-> [String] {
        autoWords = []
        var currNode = root
        
        for char in Array(word) {
            if let nextNode = currNode.children[char] {
                currNode = nextNode
            } else {
                return [word]
            }
        }
        
        getWord(from: currNode)
        
        
        return autoWords
    }
    
}

let auto = AutoCompleteWord(dic: ["abc", "acd", "bcd", "def", "define", "a", "aba"])
print(auto.getAutoCompleteWords(word: "d"))


