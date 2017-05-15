//: Playground - noun: a place where people can play

import UIKit

var abc: String? = nil
var pro: String = "asdas"

func testing (a: String?) {
    guard let safe = a else { return }
    
    safe.capitalizedString
    
    //if let safe = abc {
    //    pro = safe
    //
    //}
}



var str = "Hello, playground"



testing(nil)






