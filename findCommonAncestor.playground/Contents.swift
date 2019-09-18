//: Playground - noun: a place where people can play

import Foundation
import UIKit


func findCommonAncestor(_ A: UIView, _ B: UIView) -> UIView? {
    var Aancestors = [A]
    var aView = A.superview
    while aView != nil {
        Aancestors.append(aView!)
        aView = aView!.superview
    }
    
    var bView: UIView? = B
    for aView in Aancestors {
        while bView != nil {
            if bView == aView {
                return aView
            }
            bView = bView!.superview
        }
    }
    return nil
}
