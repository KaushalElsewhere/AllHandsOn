//
//  Coordinator.swift
//  TryMadhu
//
//  Created by Kaushal Elsewhere on 16/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit

extension AppCoordinator: CheckoutControllerDelegate {
    func checkoutControllerDidSelectBack() {
        navigationController.popViewControllerAnimated(true)
    }
}

extension AppCoordinator: DetailControllerDelegate {
    func detailControllerDidSelectNext() {
        checkoutController = CheckoutController()
        checkoutController?.delegate = self
        navigationController.pushViewController(checkoutController!, animated: true)
    }
    
    func detailControllerDidSelectBack() {
        navigationController.popViewControllerAnimated(true)
    }
}

extension AppCoordinator: FirstControllerDelegate {
    func firstControllerDidSelectNext() {
        detailController = DetailController()
        detailController?.delegate = self
        navigationController.pushViewController(detailController!, animated: true)
    }
}

class AppCoordinator: NSObject {
    var navigationController: UINavigationController
    var firstController: FirstController
    
    var detailController: DetailController?
    var checkoutController: CheckoutController?
    
    init(nav: UINavigationController, rootController root: FirstController) {
        self.navigationController = nav
        self.firstController = root
        
        super.init()
        
        self.firstController.delegate = self
    }
}
