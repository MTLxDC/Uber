//
//  UIView+Extension.swift
//  SinaWeiBo
//
//  Created by dengchen on 15/11/17.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit

extension UIView {
    
    func navigationController() ->UINavigationController? {
        
        var next = self.nextResponder()
        
        repeat {
          
        if next is UINavigationController {
            return next as? UINavigationController
        }
            
         next = next?.nextResponder()
        
        }while(next != nil)
        
        return nil
    }
    
    
 
}