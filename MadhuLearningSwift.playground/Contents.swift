//: Playground - noun: a place where people can play

import UIKit
import Foundation

typealias Completion = (_ result: [String], _ error: String?) -> Void

func getData(userid: String, completion: Completion) {
    //asdas
    
    
    completion(["hello", "world"], nil)
}

getData(userid: "001") { (result, error) in
    if let err = error {
        print(err)
        return
    }

    print(result)
}


//let result = getData { (result, error) in
//    if let err = error {
//        print(err)
//        return
//    }
//    
//    print(result)
//}






