//
//  UIBarbuttonItem + Extension.swift
//  SinaWeiBo
//
//  Created by dengchen on 15/11/19.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    convenience init(image:String,target:AnyObject?,action:String?) {
        let btn = UIButton()
        
        if image.hasSuffix("png"){
            btn.setImage(UIImage(named: image), forState: .Normal)
            btn.setImage(UIImage(named: image + "_highlighted"), forState: .Highlighted)
        }else {
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(15)
            btn.setTitle(image, forState: UIControlState.Normal)
            
        }
        
        if action != nil && target != nil {
            btn.addTarget(target, action: Selector(action!), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        btn.sizeToFit()
        
        self.init(customView:btn)
    }

}