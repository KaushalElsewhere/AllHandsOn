//
//  AppDelegate.swift
//  CleanSwiftTry
//
//  Created by Kaushal Elsewhere on 10/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        let firstController = CreateOrderViewController()
        let navController = UINavigationController(rootViewController: firstController)
        
        //coordinator = AppCoordinator(nav: navController, rootController: firstController)
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }

}

