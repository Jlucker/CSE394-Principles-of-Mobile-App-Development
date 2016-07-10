//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  2/23/2016
//  Lab:   Lab4 Location Info Storage
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//
//  ViewController.swift
//  Lab4
//
//  Created by Justin Lucker on 2/23/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var placeNameField: UITextField!
    @IBOutlet weak var placeDescriptionField: UITextView!
    @IBOutlet weak var numberOfPlaces: UILabel!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeDescriptionLabel: UITextView!
    var index : Int = 0;
    var totalPlaces : Int = 0;
    var currentPlace : Int = 0;
    var ofText: String = " of ";
    
    // Delegates involved in Core Data
    var insertContext: NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var viewContext: NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var deleteContext: NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        placeDescriptionField!.layer.borderWidth = 1
        placeDescriptionField!.layer.borderColor = UIColor.grayColor().CGColor
        placeDescriptionLabel!.layer.borderWidth = 1
        placeDescriptionLabel!.layer.borderColor = UIColor.grayColor().CGColor
        initializePlace()

    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func AddPlace(sender: UIButton) {
        
        let place = NSEntityDescription.entityForName("PlaceList", inManagedObjectContext: self.insertContext)
        let newPlace = PlaceList(entity: place!, insertIntoManagedObjectContext: self.insertContext)
        newPlace.placeName = placeNameField.text!
        newPlace.placeDescription = placeDescriptionField.text!
        do {
            
            try self.insertContext.save()
            placeNameField.text = "";
            placeDescriptionField.text = "";
            updatePlace()
            
        } catch _ {
            
        }
    }

   
    @IBAction func RightArrow(sender: UIButton) {
        
        let fetchRequest = NSFetchRequest(entityName: "PlaceList")
        if let fetchResults = (try? viewContext.executeFetchRequest(fetchRequest)) as? [PlaceList]{
            
            if fetchResults.count > 0{
                
                totalPlaces = fetchResults.count
                index++
                print(index)
                if index < totalPlaces {
                    currentPlace = index + 1
                    self.numberOfPlaces.text = String(currentPlace) + ofText + String(totalPlaces)
                    let place = fetchResults[index]
                    self.placeNameLabel.text = place.placeName
                    self.placeDescriptionLabel.text = place.placeDescription
                }else{
                    index--
                    currentPlace = index + 1
                    self.numberOfPlaces.text = String(currentPlace) + ofText + String(totalPlaces)
                    let place = fetchResults[index]
                    self.placeNameLabel.text = place.placeName
                    self.placeDescriptionLabel.text = place.placeDescription
                }
            }
        }
    }

    @IBAction func LeftArrow(sender: UIButton) {
        
        let fetchRequest = NSFetchRequest(entityName: "PlaceList")
        if let fetchResults = (try? viewContext.executeFetchRequest(fetchRequest)) as? [PlaceList]{
            index = index - 1
            print(index)
            if fetchResults.count > 0{
                
                totalPlaces = fetchResults.count
                
                
                if index >= 0{
                    currentPlace = index + 1
                    self.numberOfPlaces.text = String(currentPlace) + ofText + String(totalPlaces)
                    let place = fetchResults[index]
                    self.placeNameLabel.text = place.placeName
                    self.placeDescriptionLabel.text = place.placeDescription
                }else{
                    index++
                    currentPlace = index + 1
                    self.numberOfPlaces.text = String(currentPlace) + ofText + String(totalPlaces)
                    let place = fetchResults[index]
                    self.placeNameLabel.text = place.placeName
                    self.placeDescriptionLabel.text = place.placeDescription
                }
            }
        }
    }
    
    @IBAction func ClearAll(sender: UIButton) {
        
        let fetchRequest = NSFetchRequest(entityName: "PlaceList")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
                try deleteContext.executeRequest(deleteRequest)
                try deleteContext.save()
            }
            catch {
                // Do Nothing
            }
        currentPlace = 0;
        totalPlaces = 0;
        self.placeNameLabel.text = ""
        self.placeDescriptionLabel.text = ""
        self.numberOfPlaces.text = ""
        
    }
    
    func initializePlace(){

        let fetchRequest = NSFetchRequest(entityName: "PlaceList")
        if let fetchResults = (try? viewContext.executeFetchRequest(fetchRequest)) as? [PlaceList]{
            
            if fetchResults.count > 0{
                
                totalPlaces = fetchResults.count
                currentPlace = 1;
                self.numberOfPlaces.text = String(currentPlace) + ofText + String(totalPlaces)
                let place = fetchResults[0]
                self.placeNameLabel.text = place.placeName
                self.placeDescriptionLabel.text = place.placeDescription
        
            }else{
                
            totalPlaces = 0
            currentPlace = 0;
            self.numberOfPlaces.text = String(currentPlace) + ofText + String(totalPlaces)
            self.placeNameLabel.text = ""
                
            }
        }
    }
    
    func updatePlace(){
        
        let fetchRequest = NSFetchRequest(entityName: "PlaceList")
        if let fetchResults = (try? viewContext.executeFetchRequest(fetchRequest)) as? [PlaceList]{
            
            if fetchResults.count > 0{
                
                totalPlaces = fetchResults.count
                currentPlace = index + 1;
                self.numberOfPlaces.text = String(currentPlace) + ofText + String(totalPlaces)
                let place = fetchResults[0]
                self.placeNameLabel.text = place.placeName
                self.placeDescriptionLabel.text = place.placeDescription
                
            }else{
                
                totalPlaces = 1
                currentPlace = 0;
                self.numberOfPlaces.text = String(currentPlace) + ofText + String(totalPlaces)
                self.placeNameLabel.text = ""
                
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        view.endEditing(true)
        
    }
}

