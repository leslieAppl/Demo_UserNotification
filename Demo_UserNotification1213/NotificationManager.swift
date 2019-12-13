//
//  NotificationManager.swift
//  Demo_UserNotification1213
//
//  Created by leslie on 12/13/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

class NotificationManager {
    func postUserNotification(loc: CLLocation) {
        let content = UNMutableNotificationContent()
        content.title = "Location Updated"
        content.subtitle = "again"
        content.body = "\(loc)"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: "\(loc)", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error requesting user notification: \(error)")
            }
        }
    }
}
