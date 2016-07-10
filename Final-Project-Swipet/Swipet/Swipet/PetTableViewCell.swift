//
//  PetTableViewCell.swift
//  Swipet
//
//  Created by tdzamora on 3/24/16.
//  Copyright © 2016 tdzamora. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}