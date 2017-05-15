//
//  ViewController.swift
//  TestGeneratedSDK
//
//  Created by Kaushal Elsewhere on 4/04/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func test() {
        let model = NewModel()
        model.a = 20
        model.a = 10
        
    }

}

class NewModel: NSObject {
    var a: Int?
    var b: String?
}
