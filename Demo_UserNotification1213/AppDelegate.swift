//
//  AppDelegate.swift
//  Demo_UserNotification1213
//
//  Created by leslie on 12/13/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var locationManager: LocationManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            var errorInfo = ""
            if let error = error {
                errorInfo = "Error: \(String(describing: error))"
            }
            print("Request for notification allowed? \(granted)\(errorInfo)")
        }
        
        if let options = launchOptions, let _ = options[UIApplication.LaunchOptionsKey.location] {
            print("Launched by location")
        }
        
        locationManager = LocationManager()
        locationManager?.startUpdatingLocation()
        
        return true
    }

    
}

