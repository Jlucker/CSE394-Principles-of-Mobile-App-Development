//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  2/16/2016
//  Lab:   Lab 3
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//
//  PlaceTableViewCell.swift
//  Lab3
//
//  Created by Justin Lucker on 2/16/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit

class PlaceTableViewCell : UITableViewCell {
    
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!

    
    override func awakeFromNib() {
        
        super.awakeFromNib()
 
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
    }
}
