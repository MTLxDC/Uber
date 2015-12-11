//
//  UIButton+Extension.swift
//  SinaWeiBo
//
//  Created by dengchen on 15/11/12.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit


extension UIButton {
    
    convenience init(title:String?,bgImge:String?,titleColor:UIColor?,fontSize:CGFloat = 12,image:String = "",round:CGFloat = 5) {
        
        self.init()
        
        setTitle(title, forState: .Normal)
        
        setTitleColor(titleColor, forState: UIControlState.Normal)
        
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        
        if bgImge != nil {
            setBackgroundImage(UIImage(named: bgImge!), forState: UIControlState.Normal)
            setBackgroundImage(UIImage(named: bgImge! + "_highlighted"), forState: UIControlState.Highlighted)
        }
        
        if image != "" {
            setImage(UIImage(named: image), forState: .Normal)
            setImage(UIImage(named: image + "_highlighted"), forState: .Highlighted)
        }
        
        layer.cornerRadius = round
        layer.masksToBounds = true
        
        sizeToFit()
  
    }
    
    
    convenience init(title:String?,bgColor:UIColor?,titleColor:UIColor?,fontSize:CGFloat = 12,round:CGFloat = 2.5) {
        
        self.init()
        
        setTitle(title, forState: .Normal)
        
        setTitleColor(titleColor, forState: UIControlState.Normal)
        
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        
        if bgColor != nil {
            backgroundColor = bgColor
        }
        
        layer.cornerRadius = round
        layer.masksToBounds = true
        
        sizeToFit()
        
    }
    
       
}
