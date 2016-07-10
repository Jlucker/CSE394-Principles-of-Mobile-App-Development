//
//  Shelter.swift
//  Swipet
//
//  Created by tdzamora on 3/24/16.
//  Copyright © 2016 tdzamora. All rights reserved.
//

import Foundation
import CoreData

class Shelter: NSManagedObject {
    
    @NSManaged var address: String
    @NSManaged var email: String
    @NSManaged var name: String
    @NSManaged var phone: String
    @NSManaged var website: String
    
}
