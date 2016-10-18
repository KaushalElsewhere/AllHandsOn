//
//  ViewController.swift
//  PinterestImageDemo
//
//  Created by Kaushal Elsewhere on 19/10/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import PINRemoteImage

let kURL = "https://cdn.stage.totsamour.com/1f09796e-cd9d-41c6-a7bf-b839d43e3e38-large.jpg"
let kURL2 = "http://img.auctiva.com/imgdata/1/9/9/4/9/2/5/webimg/912245615_o.jpg"

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
    }


    @IBAction func didClickOnDownload(sender: AnyObject) {
        let url = NSURL(string: kURL2)
        imageView.pin_updateWithProgress = true
        imageView.pin_setImageFromURL(url)
    }
}

