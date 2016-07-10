//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  2/23/2016
//  Lab:   Lab4 Location Info Storage
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//
//  PlaceList.swift
//  Lab4
//
//  Created by Justin Lucker on 2/23/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import Foundation
import CoreData

class PlaceList: NSManagedObject {
    
    @NSManaged var placeName: String
    @NSManaged var placeDescription: String
    
}
