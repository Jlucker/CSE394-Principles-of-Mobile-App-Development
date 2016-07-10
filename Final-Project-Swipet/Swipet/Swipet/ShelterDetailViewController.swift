//
//  ShelterDetailViewController.swift
//  Swipet
//
//  Created by tdzamora on 3/25/16.
//  Copyright © 2016 tdzamora. All rights reserved.
//

import UIKit
import CoreData

class ShelterDetailViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var website: UITextField!
    @IBOutlet weak var email: UITextField!
    
    var context: NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fetchRequest = NSFetchRequest(entityName: "Shelter")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if  let fetchResults = (try? context.executeFetchRequest(fetchRequest)) as? [Shelter]
        {
            let fr = fetchResults[0]
            self.name.text = fr.name
                self.address.text = fr.address
                self.phone.text = fr.phone
                self.website.text = fr.website
                self.email.text = fr.email
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func saveData(sender: UIBarButtonItem) {
        let fetchRequest = NSFetchRequest(entityName: "Shelter")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if  let fetchResults = (try? context.executeFetchRequest(fetchRequest)) as? [Shelter]
        {
            var updated = false
            let x = fetchResults.count
            var i:Int = 0
            while(i < x) {
                let r = fetchResults[i]
                
                if (r.name == self.name.text!){
                    r.address = self.address.text!
                    r.phone = self.phone.text!
                    r.website = self.website.text!
                    r.email = self.email.text!
                    do {
                        try self.context.save()
                    } catch _ {
                    }
                    updated = true
                }
                i = i + 1;
            }
            if (updated == false){
                let ent = NSEntityDescription.entityForName("Shelter", inManagedObjectContext: self.context)
                let newItem = Shelter(entity: ent!, insertIntoManagedObjectContext: self.context)
                newItem.name = self.name.text!
                newItem.address = self.address.text!
                newItem.phone = self.phone.text!
                newItem.website = self.website.text!
                newItem.email = self.email.text!
                do {
                    try self.context.save()
                } catch _ {
                }
            }
        }
        navigationController!.popViewControllerAnimated(true)
    }
    
}