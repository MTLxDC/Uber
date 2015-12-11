//
//  DCSelectCountryPage.swift
//  Uber
//
//  Created by dengchen on 15/12/11.
//  Copyright © 2015年 name. All rights reserved.
//

import UIKit

class DCSelectCountryPage: DCBasePage {

    
    
    override func loadView() {
        super.loadView()
        setUpUI()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCountry()
        
    }
    
    
    private func setUpUI() {
        
        tableView = UITableView(frame:view.bounds, style: UITableViewStyle.Grouped)
        
        view.addSubview(tableView!)

        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CountryCell")
        
    }

    
    private var tableView:UITableView?
    
    private var CountryData = [CountryInfo]()
    
    private func setCountry() {
        
        let arrCode = NSLocale.ISOCountryCodes()
        let local = NSLocale.currentLocale()
        
        
        for code in arrCode {
            CountryData.append(CountryInfo(
                ne: local.displayNameForKey(NSLocaleCountryCode,value: code),
                cd:code))
        }
        
        self.tableView?.reloadData()
    }

}

extension DCSelectCountryPage : UITableViewDataSource,UITableViewDelegate {
    
    

    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
        return self.CountryData.count ?? 0
     }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
     {
        let cell = tableView.dequeueReusableCellWithIdentifier("CountryCell")
        
        
        let info = self.CountryData[indexPath.row]
        
        cell?.textLabel?.text = info.name
        
        return cell!
     }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
