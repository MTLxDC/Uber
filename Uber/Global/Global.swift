//
//  Global.swift
//  Uber
//
//  Created by dengchen on 15/12/10.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit



func isSystemIO8()->Bool {
    
    let systemVersion = (UIDevice.currentDevice().systemVersion as NSString).floatValue
    
    if systemVersion - IOS8 < -0.001  {
        return true
    }
  
    return false
}