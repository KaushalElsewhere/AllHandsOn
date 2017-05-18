//
//  CheckoutController.swift
//  TryMadhu
//
//  Created by Kaushal Elsewhere on 16/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit
protocol  CheckoutControllerDelegate: class {
    func checkoutControllerDidSelectBack()
}

class CheckoutController: UIViewController {
    weak var delegate: CheckoutControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        self.title = "Checkout"
        view.backgroundColor = .whiteColor()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        let back = UIBarButtonItem(title: "Back", style: .Done, target: self, action: #selector(didSelectBack))
        navigationItem.leftBarButtonItem = back
    }
    
    func didSelectBack() {
        delegate?.checkoutControllerDidSelectBack()
    }
}
