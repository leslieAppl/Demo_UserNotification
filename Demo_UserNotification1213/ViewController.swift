//
//  ViewController.swift
//  Demo_UserNotification1213
//
//  Created by leslie on 12/13/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var timer = Timer()
    var time = 5
    var lastUpdate = Date.distantPast
    
    @IBOutlet weak var notificationLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // receiving notification center
        NotificationCenter.default.addObserver(self, selector: #selector(updateUserLocation), name: NSNotification.Name("locationUpdated"), object: nil)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.decreaseTimer), userInfo: nil, repeats: true)

    }
    
    // receiving data from notification center
    @objc func updateUserLocation(notification: NSNotification) {
        let loc = notification.object as? CLLocation
        
        locationLbl.text = "\(String(describing: loc))"

    }
    
    @objc func decreaseTimer() {
        if time > 0 {
            time -= 1
        }
        else {
            time = 5
        }
        notificationLbl.text = "Updating and notifying User Location at every \(time) seconds."

    }
}

