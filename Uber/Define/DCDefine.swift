//
//  DCDefine.swift
//  Uber
//
//  Created by dengchen on 15/12/10.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit

let loadingTip = "加载中..."

let ScreenWidth = UIScreen.mainScreen().bounds.width
let ScreenHeight = UIScreen.mainScreen().bounds.height
let Screenbounds = UIScreen.mainScreen().bounds

let IOS8:Float = 8.0


let isIphone5 = (ScreenHeight == 568)

func DCLog(message:String,fucName:String = __FUNCTION__) {
    
    #if DEBUG
        print("\(fucName) logInfo:\n\(message)")
    #else
        
    #endif
}

