//
//  PetTableViewController.swift
//  Swipet
//
//  Created by tdzamora on 3/24/16.
//  Copyright © 2016 tdzamora. All rights reserved.
//

import UIKit
import CoreData

class PetTableViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var petTable: UITableView!
    var pet:Pet? = nil
    var context: NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var dataViewController: NSFetchedResultsController = NSFetchedResultsController()
    
    func getFetchResultsController() -> NSFetchedResultsController {
        
        dataViewController = NSFetchedResultsController(fetchRequest: listFetchRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        return dataViewController
        
    }
    
    func listFetchRequest() -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: "Pet")
        let sortDescripter = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescripter]
        return fetchRequest
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dataViewController = getFetchResultsController()
        
        dataViewController.delegate = self
        do {
            try dataViewController.performFetch()
        } catch _ {
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.petTable.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSections  = dataViewController.sections?.count
        return numberOfSections!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = dataViewController.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.petTable.dequeueReusableCellWithIdentifier("dataCell", forIndexPath: indexPath) as! PetTableViewCell
        let petInfo = dataViewController.objectAtIndexPath(indexPath) as! Pet
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.blackColor().CGColor
        
        cell.name.text = petInfo.name
        cell.picture.image = UIImage(data: petInfo.picture as NSData)
        cell.picture.layer.cornerRadius = 33;
        
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle:   UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let record = dataViewController.objectAtIndexPath(indexPath) as! Pet
            context.deleteObject(record)
            do {
                try context.save()
            } catch _ {
            }
            
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "edit"
        {
            let cell = sender as! UITableViewCell
            let indexPath = self.petTable.indexPathForCell(cell)
            let dest: PetDetailViewController =  segue.destinationViewController as! PetDetailViewController
            let row = dataViewController.objectAtIndexPath(indexPath!) as! Pet
            dest.nItem = row
            
        }
        
    }
    
    
}
