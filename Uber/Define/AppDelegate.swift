//
//  AppDelegate.swift
//  Uber
//
//  Created by dengchen on 15/12/10.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let nav = UINavigationController(rootViewController: DCRegisterPage())
        self.window?.rootViewController = GuidePage()
        
        self.window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().tintColor = UIColor.lightGrayColor()
        return true;
    }

}

