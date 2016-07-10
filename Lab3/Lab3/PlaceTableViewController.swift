//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  2/16/2016
//  Lab:   Lab 3
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//
//  PlaceTableViewController.swift
//  Lab3
//
//  Created by Justin Lucker on 2/16/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit

class PlaceTableViewController: UITableViewController {
    
    var places = [Place]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()

        loadPlaces()
    }
    
    // Loads the place names and the flag icons and adds them to the places array
    func loadPlaces() {
        
        let flag1  = UIImage(named: "JapanFlag")!
        let place1 = Place(name: "Japan", flag: flag1, description: "Japan is a stratovolcanic archpelago!")!
        
        let flag2  = UIImage(named: "CaliforniaFlag")!
        let place2 = Place(name: "California", flag: flag2, description: "California is the westernmost state in the U.S.")!
        
        let flag3  = UIImage(named: "PhilipinesFlag")!
        let place3 = Place(name: "The Philipines", flag: flag3, description: "The Philipines is composed of islands!")!
        
        let flag4  = UIImage(named: "SouthKoreaFlag")!
        let place4 = Place(name: "South Korea", flag: flag4, description: "South Korea is the best Korea!")!
        
        let flag5  = UIImage(named: "MexicoFlag")!
        let place5 = Place(name: "Mexico", flag: flag5, description: "Mexico is probably Donald Trump's least favorite country!")!

        
        places += [place1, place2, place3, place4, place5]
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PlaceTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PlaceTableViewCell
        
        let place = places[indexPath.row]
        
        cell.placeLabel.text = place.name
        cell.flagImageView.image = place.flag
        
        return cell
        
    }
    
    // Passes data to the detail view in the form of a place object
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "detailView"){
            
            let selectedIndex: NSIndexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            
            if let viewController: ViewController = segue.destinationViewController as? ViewController {
 
                let place = places[selectedIndex.row]
                viewController.selectedPlace = place;
            }
        }
    }
    
    //  Deletes the selected table item from the places array and then updates the table view
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete {
            
            places.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}

