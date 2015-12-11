//
//  UILable+Extension.swift
//  SinaWeiBo
//
//  Created by dengchen on 15/11/12.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit


extension UILabel {
    
    convenience init(title:String?,Color:UIColor?,fontSize:CGFloat = 12,textAlignment:NSTextAlignment = NSTextAlignment.Center) {
        
        self.init()
        text = title
        font = UIFont.systemFontOfSize(fontSize)
        textColor = Color
        numberOfLines = 0
        
        sizeToFit()
    }
    
}