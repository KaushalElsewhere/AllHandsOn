//
//  AppDelegate.swift
//  IGListDemo
//
//  Created by Kaushal Elsewhere on 20/01/2017.
//  Copyright © 2017 Kaushal Elsewhere. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = UINavigationController(rootViewController: FeedController()) 
        window?.makeKeyAndVisible()
        
        
        return true
    }

}

