//
//  LocationData.swift
//  Lab6
//
//  Created by Justin Lucker on 3/22/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import Foundation
import MapKit

class LocationData{
    
    var location : NSString
    var latitude : CLLocationDegrees = 0
    var longitude : CLLocationDegrees = 0
    
    init(location: String) {
        
        self.location = location
        
    }
    
    func getLatLon() {
        
        
    }
}
