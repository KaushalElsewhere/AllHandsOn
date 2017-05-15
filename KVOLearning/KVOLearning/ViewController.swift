//
//  ViewController.swift
//  KVOLearning
//
//  Created by Kaushal Elsewhere on 22/03/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let car = Car()
        let obser = Store(car: car)
        //car.miles = 100
        obser.car.miles = 200
    }
}


class Car: NSObject {
    dynamic var miles = 0
    dynamic var name = "Turbo"
}

class Store: NSObject {
    private var kvoContext: UInt8 = 1
    private let car: Car
    
    init(car: Car) {
        self.car = car
        super.init()
        car.addObserver(self, forKeyPath: "miles", options: .New, context: &kvoContext)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if context == &kvoContext {
            print(keyPath)
        }
    }
    
    deinit {
        car.removeObserver(self, forKeyPath: "miles")
    }
}














































