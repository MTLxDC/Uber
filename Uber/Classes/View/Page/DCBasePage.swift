//
//  FxBasePage.swift
//  Uber
//
//  Created by dengchen on 15/12/10.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit

class DCBasePage: UIViewController {

    override func viewDidLoad() {
        
    }

    internal func setNavItem(title:String,sel:String,isRight:Bool)->UIBarButtonItem {
        
        var item:UIBarButtonItem
        
        if title .hasSuffix("png") {
            item = UIBarButtonItem(image: title, target: self, action:sel)
        }else {
            item = UIBarButtonItem(title: title, style: .Plain, target: self, action: Selector(sel))

        }
        
        if isRight {
            navigationItem.rightBarButtonItem = item
        }else
        {
            navigationItem.leftBarButtonItem = item
        }
        
        return item
    }
}
