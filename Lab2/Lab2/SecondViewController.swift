//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  2/2/2016
//  Lab:   Lab 2
//  File:  SecondViewController.swift
//  Course: CSE 394 Principles of Mobile Application Development
//  Resource Used:
//  Unsure Face:    https://goo.gl/2SyYu5
//  Sad Face:       http://goo.gl/WTsmvO
//  Surprised Face: https://goo.gl/y5A8DL
//  Flood Image:    https://goo.gl/ycvLbv
//  Rain Cloud:     https://goo.gl/gXutuw
//  Tornado:        http://goo.gl/awpYFM
//************************************************************************
//
//  SecondViewController.swift
//  Lab2
//
//  Created by Justin Lucker on 2/2/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var firstViewLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    var fromFirstView : String?;
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.firstViewLabel.text = self.fromFirstView!;
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "next"
        {
            if let detailviewController: ThirdViewController = segue.destinationViewController as? ThirdViewController {
                detailviewController.fromFirstView = self.firstViewLabel.text!;
                detailviewController.fromSecondView = self.secondLabel.text!;
            }
        }
    }

}

