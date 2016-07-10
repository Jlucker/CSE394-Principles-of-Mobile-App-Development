//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  3/22/2016
//  Lab:   Lab 6
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//
//  ViewController.swift
//  Lab6
//
//  Created by Justin Lucker on 3/22/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    var location : String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func findEarthquakesButton(sender: AnyObject) {
        
        location = addressTextField.text! + ", " + cityTextField.text! + ", " + stateTextField.text! + ", " + zipTextField.text!
        
    }
    
    // Autopopulates the text fields with a preset address to make testing easier
    @IBAction func autopopulate(sender: AnyObject) {
        
        //let defaultAddress1 : String = "10051 Old Grove Rd"
        //let defaultCity1 : String = "San Diego"
        //let defaultState1 : String = "CA"
        //let defaultZip1 : String = "92131"
        
        let defaultAddress1 : String = "699 S. Mill Ave"
        let defaultCity1 : String = "Tempe"
        let defaultState1 : String = "AZ"
        let defaultZip1 : String = "85281"
        
        addressTextField.text = defaultAddress1
        cityTextField.text = defaultCity1
        stateTextField.text = defaultState1
        zipTextField.text = defaultZip1
        
    }
    
    // Clears the location information fields
    @IBAction func clear(sender: AnyObject) {
        
        addressTextField.text = ""
        cityTextField.text = ""
        stateTextField.text = ""
        zipTextField.text = ""
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Earthquakes"
        {
            if let earthquakeViewController: EarthquakeViewController = segue.destinationViewController as? EarthquakeViewController {
                
                earthquakeViewController.selectedLocation = location
                
            }
        }
    }
}

