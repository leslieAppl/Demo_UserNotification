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
    
    @IBOutlet weak var locationLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // receiving notification center
        NotificationCenter.default.addObserver(self, selector: #selector(updateUserLocation), name: NSNotification.Name("locationUpdated"), object: nil)
    }
    
    // receiving data from notification center
    @objc func updateUserLocation(notification: NSNotification) {
        let loc = notification.object as? CLLocation
        
        locationLbl.text = "\(String(describing: loc))"
    }
    
    
}

