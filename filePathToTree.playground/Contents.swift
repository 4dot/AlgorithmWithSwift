//: Playground - noun: a place where people can play

import Foundation



class Path {
    var folder: String = ""
    var children: [Path] = []
    var depth: Int = 0
    
    
    init(_ folder: String, _ depth: Int) {
        self.folder = folder
        self.depth = depth
    }
    
    func printFolder() {
        var desh = ""
        for _ in (0..<self.depth) {
            desh += "    "
        }
        
        print("\(desh) - \(self.folder)")
        self.children.forEach {
            $0.printFolder()
        }
    }
}


func insertPath(root: Path, path: String) {
    var node = root
    
    let splitPath = path.split(separator: "\\")
    
    for (depth, element) in splitPath.enumerated() {
        let folder =  String(element)
        var next = node.children.first { $0.folder == folder }
        
        if next == nil {
            next = Path(folder, depth)
            node.children.append(next!)
        }
        
        node = next!
    }
}

func search(root: Path, path: String) -> Bool {
    var node = root
    
    let splitPath = path.split(separator: "\\")
    for element in splitPath {
        let folder =  String(element)
        let next = node.children.first { $0.folder == folder }
        
        if next == nil {
            return false
        }
        node = next!
    }
    
    return true
}



let paths = [
    "C:\\Music\\Blur\\Leisure",
    "C:\\Music\\KateBush\\WholeStory\\Disc1",
    "C:\\Music\\KateBush\\WholeStory\\Disc2",
    "C:\\Music\\KateBush\\The Kick Inside",
    "C:\\Music\\KateBush\\The Dreaming",
    "C:\\MusicUnprocessed\\Blue\\ParkLife"]


var root = Path("", 0)
for path in paths {
    insertPath(root: root, path: path)
}

print(root.printFolder())
//print(search(root: root, path: "C:\\Music\\Blur\\Leisure1"))

