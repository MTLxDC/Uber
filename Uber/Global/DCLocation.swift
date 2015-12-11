//
//  DCLocation.swift
//  Uber
//
//  Created by dengchen on 15/12/11.
//  Copyright © 2015年 name. All rights reserved.
//

import CoreLocation

class DCLocation: NSObject,CLLocationManagerDelegate {

   private var manager:CLLocationManager?
    
    internal func startLocation() {
        
        if CLLocationManager.locationServicesEnabled(){
            manager = CLLocationManager()
            
            manager?.delegate = self
            manager?.desiredAccuracy = kCLLocationAccuracyBest
            manager?.distanceFilter = 100.0
            
            manager?.requestAlwaysAuthorization()
            manager?.startUpdatingLocation()
        }
        
    }
    
    
    
    
    
    internal func searchAddress(Location:CLLocation) {
        let coder = CLGeocoder()
        
        coder.reverseGeocodeLocation(Location) { (marks:[CLPlacemark]?, error:NSError?) -> Void in
            if marks != nil && error == nil {
                for mark in marks! {
                    DCLog(mark.name!)
                }
            }else {
                print(error)
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print(status)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        searchAddress(newLocation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        searchAddress(locations.first!)
        
        manager.stopUpdatingLocation()
    }
    
    
    
}
