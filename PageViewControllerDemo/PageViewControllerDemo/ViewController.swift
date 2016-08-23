//
//  ViewController.swift
//  PageViewControllerDemo
//
//  Created by Kaushal Elsewhere on 23/08/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit

//MARK: Methods
extension ViewController{
//    func animateImage() {
//        counter = counter + 1
//        let index = counter % self.dataSource.count
//        self.baseBackgroundView.frame = CGRect(x: 0, y: 0, width: self.baseBackgroundView.frame.size.width, height: self.baseBackgroundView.frame.size.height)
//        //self.baseBackgroundView.layer.removeAllAnimations()
//        
//        UIView.transitionWithView(self.baseBackgroundView, duration: 0.6, options: [.TransitionCrossDissolve ], animations: {
//            self.baseBackgroundView.image = self.dataSource[index]
//            }, completion: nil)
//        
//        UIView.animateWithDuration(6, delay: 0, options: [.CurveEaseIn ], animations: {
//            self.baseBackgroundView.frame = CGRect(x: -50, y: -30, width: self.baseBackgroundView.frame.size.width, height: self.baseBackgroundView.frame.size.height)
//            self.baseBackgroundView.image = self.dataSource[index]
//
//            
//            }, completion:nil)
//    }
    
}
//MARK: setups
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(baseBackgroundView)
        baseBackgroundView.start()
        
////        let transition = CATransition()
////        transition.duration = 1
////        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut) //[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
////        transition.type = kCATransitionFade;
////        
////        baseBackgroundView.layer.addAnimation(transition, forKey: nil)
//        
//        
//        animateImage()
//        NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: #selector(animateImage), userInfo: nil, repeats: true)

    }
}

class ViewController: UIViewController {

    var counter:Int = -1
    
    let dataSource:[UIImage] = [
        UIImage(named: "onb0")!,
        UIImage(named: "onb1")!,
        UIImage(named: "onb2")!,
        UIImage(named: "onb3")!
    ]
    
    lazy var baseBackgroundView:SlideImageView = {
        let view:SlideImageView = SlideImageView(images: self.dataSource)
        view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width+100, height: self.view.frame.size.height+100)
        view.contentMode = .ScaleAspectFill
        view.image = self.dataSource[0]
        return view
    }()
}

//dispatch_async(dispatch_get_main_queue(),{[unowned self] in
//    let i = (index+1) % self.dataSource.count
//    self.animateImage(i)
//    })