//: Playground - noun: a place where people can play

import UIKit
import Foundation

var arr:[Int?] = [10, 20, 30, nil]

func moveElementOfArray(arr: [Int?], fromIndex: Int, toIndex: Int) -> [Int?] {
    var array = arr
    array.insert(array.removeAtIndex(fromIndex), atIndex: toIndex)
    
    
    return array
}





moveElementOfArray(arr, fromIndex: 1, toIndex: 0)
//moveElementOfArray(arr, fromIndex: 1, toIndex: 0)

extension String {
    public var first: String {
        return String(self[startIndex])
    }
    
    public var initialsMax2: String {
        if self == "" || self == " " { return "" }
        let innputString = self.trim
        
        let initials = innputString.componentsSeparatedByString(" ")
            .reduce("") { $0 + $1.first }.uppercaseString
        
        if initials.characters.count > 2 {
            let index = initials.startIndex.advancedBy(2)
            let final = initials.substringToIndex(index)
            return final
        }
        
        return initials
    }
    
    public var trim: String {
        let input = self.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        return input
    }
    
    
}

"Kaushal elsehwere :P".initialsMax2
"kaushal Elsewhere".first.uppercaseString
