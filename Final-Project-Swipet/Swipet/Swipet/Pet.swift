//
//  Pet.swift
//  Swipet
//
//  Created by tdzamora on 3/24/16.
//  Copyright © 2016 tdzamora. All rights reserved.
//

import Foundation
import CoreData

class Pet: NSManagedObject {
    
    @NSManaged var desc: String
    @NSManaged var name: String
    @NSManaged var picture: NSData
    @NSManaged var shelter: String
    @NSManaged var type: String
    
}