//
//  ViewController.swift
//  PageviewControllerExample
//
//  Created by Kaushal Elsewhere on 31/10/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var pageViewController: UIPageViewController = {
        let controller = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .greenColor()
        
        addChildViewController(pageViewController)
        pageViewController.view.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height-100)
        pageViewController.view.backgroundColor = .redColor()
        
    }

}

