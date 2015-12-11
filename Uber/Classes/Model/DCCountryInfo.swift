//
//  CountryInfo.swift
//  Uber
//
//  Created by dengchen on 15/12/11.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit

class CountryInfo: NSObject {
    var name:String?
    var code:String?
    
    
   init(ne:String?,cd:String?) {
        super.init()
        name = ne
        code = cd
    }
    
}
