//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  1/17/2016
//  Lab:   Lab1 Part 1 - BMI Calculator
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//
//  ViewController.swift
//  Lab1Part1
//
//  Created by Justin Lucker on 1/17/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiOutputLabel: UILabel!
    @IBOutlet weak var bmiValueLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
        self.bmiOutputLabel.hidden = true
        self.bmiValueLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateBmiButton(sender: UIButton) {
        
        if heightTextField.text == "" && weightTextField.text == ""{
            bmiOutputLabel.text = "Please Enter Height and Weight"
            bmiOutputLabel.textColor = UIColor.redColor()
            self.bmiOutputLabel.hidden = false
            
        }else if heightTextField.text == ""{
            
            bmiOutputLabel.text = "Please Enter Height"
            bmiOutputLabel.textColor = UIColor.redColor()
            self.bmiOutputLabel.hidden = false
            
        }else if weightTextField.text == ""{
            
            bmiOutputLabel.text = "Please Enter Weight"
            bmiOutputLabel.textColor = UIColor.redColor()
            self.bmiOutputLabel.hidden = false
            
        }else{
            
            let height : Double = Double(self.heightTextField.text!)!
            let weight : Double = Double(self.weightTextField.text!)!
            let bmi : Double = (weight/(height * height)) * 703
            
            bmiValueLabel.text = String(format:"%f", bmi)
            
            if bmi < 18{
                
                bmiOutputLabel.text = "You are Underweight"
                bmiOutputLabel.textColor = UIColor.blueColor()
                
            }else if bmi >= 18 && bmi < 25{
                
                bmiOutputLabel.text = "You are Normal"
                bmiOutputLabel.textColor = UIColor.greenColor()
                
            }else if bmi >= 25 && bmi < 30{
                
                bmiOutputLabel.text = "You are Pre-Obese"
                bmiOutputLabel.textColor = UIColor.purpleColor()
                
            }else{
                
                bmiOutputLabel.text = "You are Obese :("
                bmiOutputLabel.textColor = UIColor.redColor()
            }
            
            self.bmiOutputLabel.hidden = false
            self.bmiValueLabel.hidden = false
        }
    }
    
    // Minimizes the keyboard when the Return button is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.heightTextField.resignFirstResponder()
        self.weightTextField.resignFirstResponder()
        return true;
    }
    
    // Minimizes the keyboard when the user touches the screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
}

