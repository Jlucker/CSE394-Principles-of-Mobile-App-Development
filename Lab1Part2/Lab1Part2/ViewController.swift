//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  1/17/2016
//  Lab:   Lab1 Part 2 - BMI Calculator with Sliders
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//  ViewController.swift
//  Lab1Part2
//
//  Created by Justin Lucker on 1/17/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var bmiOutputLabel: UILabel!
    @IBOutlet weak var bmiValueLabel: UILabel!
    
    var heightSliderValue : Double = 54.0
    var weightSliderValue : Double = 150.0
    var initial : Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.bmiOutputLabel.hidden = true
        calculateBmi(heightSliderValue, weight: weightSliderValue)
    
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func heightSlider(sender: UISlider) {
        
        initial = 1
        heightSliderValue = Double(sender.value)
        calculateBmi(heightSliderValue, weight: weightSliderValue)
    }

    @IBAction func weightSlider(sender: UISlider) {
        
        initial = 1
        weightSliderValue = Double(sender.value)
        calculateBmi(heightSliderValue, weight: weightSliderValue)
        
    }
    
    func calculateBmi(height : Double, weight : Double) -> Bool{
        
        heightValueLabel.text = String(format:"%0.3f", heightSliderValue)
        weightValueLabel.text = String(format:"%0.3f", weightSliderValue)
        let bmiValue = (weight/(height * height)) * 703
        bmiValueLabel.text = String(format:"%0.3f", bmiValue)
        setOutputText(bmiValue)
        return true;
        
    }
    
    func setOutputText(bmi : Double){
        
        
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
        
        if initial == 1{
            
            self.bmiOutputLabel.hidden = false
        }
    }
}

