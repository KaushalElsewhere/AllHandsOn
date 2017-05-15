//
//  ViewController.swift
//  SwaggerAPiConnect
//
//  Created by Kaushal Elsewhere on 15/11/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        login()
    }
    
    let url = "https://api.stage.totsamour.com/auth/login"
    
//    let headers: HTTPHeaders = [
//        "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
//        "Accept": "application/json"
//    ]
    
    let header: HTTPHeaders = [
        "x-socket-api-key" : "7b16afe1aaa3ec502e074ed15c0c020d079a4f9f"
    ]
    
    func login() {
        
        
        Alamofire.request(.POST, url).responseJSON { (response) in
            print(response)
        }
        
//        Alamofire.request(url).responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
    }


}

