//
//  DCRegisterPage.swift
//  Uber
//
//  Created by dengchen on 15/12/10.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit

class DCRegisterPage: DCBasePage {
    
    
    @objc private func cancal() {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    @objc private func nextStep() {
        
    }
    
    @IBOutlet weak var Country: UIButton!
    
    @IBAction func SelectCountry(sender: UIButton) {
        navigationController?.pushViewController(DCSelectCountryPage(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpUI()
        
    }
  
    private func setUpUI() {
        
        title = "创建账户"
        
        setNavItem("取消", sel:"cancal", isRight: false)
        let rightItem:UIBarButtonItem = setNavItem("下一步", sel: "nextStep", isRight: true)
        
        rightItem.enabled = false
    }
    
    
    
    
    
}
