//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  2/16/2016
//  Lab:   Lab 3
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//
//  Place.swift
//  Lab3
//
//  Created by Justin Lucker on 2/16/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit

class Place {
    
    var name : String
    var flag : UIImage?
    var description : String
    
    
    init?(name: String, flag: UIImage?, description : String) {

        self.name = name
        self.flag = flag
        self.description = description
        
    }
}
