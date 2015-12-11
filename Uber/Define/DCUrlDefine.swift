//
//  DCUrlDefine.swift
//  Uber
//
//  Created by dengchen on 15/12/10.
//  Copyright © 2015年 name. All rights reserved.
//

import Foundation


func SeverAddress()->String {
    
    var address:String = "http://172.16.19.18"
    
    #if AppStore
        address = "http://www.uber.com"
    #endif
    
    return address
}