//
//  DetailViewController.swift
//  ScrollingNavDemo
//
//  Created by Kaushal Elsewhere on 21/10/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        
        setupNav()
    }
    
    func setupNav() {
        navigationController?.navigationBar.barTintColor = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1)
        
        let backButon = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        backButon.backgroundColor = .greenColor()
        backButon.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(didSelectBack)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButon)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "BACK", style: .Plain, target: self, action: #selector(didSelectBack))
    }
    
    func didSelectBack(){
        navigationController?.popViewControllerAnimated(true)
    }
}
