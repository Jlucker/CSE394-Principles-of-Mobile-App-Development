//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  2/16/2016
//  Lab:   Lab 3
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//
//  ViewController.swift
//  Lab3
//
//  Created by Justin Lucker on 2/16/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var selectedPlace : Place?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.placeLabel.text = selectedPlace!.name
        self.flagImage.image = selectedPlace!.flag
        self.descriptionLabel.text = selectedPlace!.description
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
}

