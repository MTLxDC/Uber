//
//  DCDefine.swift
//  Uber
//
//  Created by dengchen on 15/12/10.
//  Copyright © 2015年 name. All rights reserved.
//

import Foundation

let loadingTip = "加载中..."


func DCLog(message:String,fucName:String = __FUNCTION__) {
    
    #if DEBUG
        print("\(fucName) logInfo:\n\(message)")
    #else
        
    #endif
}