//
//  DetailController.swift
//  TryMadhu
//
//  Created by Kaushal Elsewhere on 15/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit
import Foundation

protocol DetailControllerDelegate: class {
    func detailControllerDidSelectNext()
    func detailControllerDidSelectBack()
}


//MARK:- Actions
extension DetailController {
    func didSelectButton() {
        delegate?.detailControllerDidSelectNext()
    }
    
    func didSelectBack() {
        delegate?.detailControllerDidSelectBack()
    }
}

//MARK:- Network Manager Delegate
extension DetailController: NetworkManagerDelegate {
    func networkManagerDidRecieveData(items: [Product]) {
        //
    }
}

//MARK:- Base
class DetailController: UIViewController {
    weak var delegate: DetailControllerDelegate?
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Goto next", forState: .Normal)
        button.setTitleColor(.grayColor(), forState: .Normal)
        button.setTitleColor(.lightGrayColor(), forState: .Highlighted)
        button.addTarget(self, action: #selector(didSelectButton), forControlEvents: .TouchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        requestData()
        
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = .whiteColor()
        self.title = "Detail"
        view.addSubview(button)
        
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        let back = UIBarButtonItem(title: "Back", style: .Done, target: self, action: #selector(didSelectBack))
        navigationItem.leftBarButtonItem = back
        
        setupConstraints()
    }
    
    func setupConstraints() {
        button.snp_makeConstraints { (make) in
            make.center.equalTo(view.snp_center)
        }
    }
    
    
    func requestData() {
        let manager = NetworkManager()
        manager.delegate = self
        manager.getItems()
    }
    

}
