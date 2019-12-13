//
//  LocationManager.swift
//  Demo_UserNotification1213
//
//  Created by leslie on 12/13/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    private let notificationManager = NotificationManager()
    
    private let locationManager = CLLocationManager()
    private let secondBetweenRecordingUpdates: TimeInterval = 5
    private var lastUpdate = Date.distantPast

    // MARK: - Lifecycle Methods
    
    override init() {
        super.init()
        
        print("Initializing a Location Manager: \(self)")
        // configuring the Core Location Services.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.showsBackgroundLocationIndicator = true
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        // TODO: Also use a timer?
    }
    
    deinit {
        print("Location Manager de-initialized: \(self)")
        locationManager.delegate = nil
    }
    
    // MARK: - Process Methods
    
    func startUpdatingLocation() {
        let auth = CLLocationManager.authorizationStatus()
        if auth == .denied {
            print("Location Service Permissions are disabled")
        } else {
            print("Starting to monitor location updates")
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - Location Delegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let loc = locations.last else { return }
        
        // Throttle
        // 5.0 == 5.0
        let hasNotBeenLongEnough = lastUpdate.addingTimeInterval(5.0).compare(loc.timestamp) == ComparisonResult.orderedDescending
        
        if hasNotBeenLongEnough {
            return
        }
        
        lastUpdate = loc.timestamp
        
        notificationManager.postUserNotification(loc: loc)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Error! \(error)")
    }
}
