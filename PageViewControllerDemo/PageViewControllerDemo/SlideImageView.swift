//
//  SlideImageView.swift
//  PageViewControllerDemo
//
//  Created by Kaushal Elsewhere on 23/08/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit

class SlideImageView: UIImageView {
    
    var dataSource:[UIImage]?
    
    var counter:Int = -1
    
    var transitionTime:Double = 6
    
    var xOffset:CGFloat = -50
    var yOffset:CGFloat = -30
    
    init(images: [UIImage]) {
        super.init(frame: .zero)
        dataSource = images
        image = dataSource?[0]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        animateImage()
        NSTimer.scheduledTimerWithTimeInterval(self.transitionTime, target: self, selector: #selector(animateImage), userInfo: nil, repeats: true)
    }
    
    func animateImage() {
        
        guard let max = self.dataSource?.count else { return }
        
        counter = counter + 1
        let index = counter % max
        self.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        //self.baseBackgroundView.layer.removeAllAnimations()
        
        UIView.transitionWithView(self, duration: 0.6, options: [.TransitionCrossDissolve ], animations: {
            self.image = self.dataSource?[index]
            }, completion: nil)
        
        UIView.animateWithDuration(self.transitionTime, delay: 0, options: [.CurveEaseIn ], animations: {
            self.frame = CGRect(x: self.xOffset, y: self.yOffset, width: self.frame.size.width, height: self.frame.size.height)
            self.image = self.dataSource?[index]
            
            }, completion:nil)
    }
    
}