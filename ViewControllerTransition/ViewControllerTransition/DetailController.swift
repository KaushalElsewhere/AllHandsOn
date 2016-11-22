//
//  DetailController.swift
//  ViewControllerTransition
//
//  Created by Kaushal Elsewhere on 22/11/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    var imageLitral: String
    
    lazy var imageView: UIImageView  = {
        let imageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.width))
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        view.addSubview(imageView)
        
        
        
        //set data
        imageView.image = UIImage(named: imageLitral)
        
        //setupConstraint()
        
    }
    
    func setupConstraint() {
        let superView = view
        
        imageView.snp_makeConstraints { (make) in
            make.left.equalTo(superView)
            make.right.equalTo(superView)
            make.top.equalTo(superView).offset(64)
            make.height.equalTo(self.view.bounds.width)
        }
    }
    
    
    init(imageName: String) {
        imageLitral = imageName
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
