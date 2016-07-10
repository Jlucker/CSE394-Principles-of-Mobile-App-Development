//************************************************************************
//  Name:  Justin Lucker
//  ASUID: 1205448942
//  Date:  3/22/2016
//  Lab:   Lab 6
//  Course: CSE 394 Principles of Mobile Application Development
//************************************************************************
//
//  EarthquakeViewController.swift
//  Lab6
//
//  Created by Justin Lucker on 3/22/16.
//  Copyright © 2016 Justin Lucker. All rights reserved.
//

import UIKit
import MapKit

class EarthquakeViewController: UIViewController, MKMapViewDelegate {
    
    var selectedLocation : String?;
    var latitude : CLLocationDegrees = 0
    var longitude : CLLocationDegrees = 0
    var annotations: [MKPointAnnotation] = []
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.map.delegate = self
        getDirections()
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    //  Plots the location that was entered onto the map
    func getDirections() {
        
        let address = selectedLocation
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString (address! as String, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            
            if let placemark = placemarks?[0]  {
                
                let span = MKCoordinateSpanMake(20, 20)
                let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                print(placemark.location!.coordinate.latitude)
                print(placemark.location!.coordinate.longitude)
                self.map.setRegion(region, animated: true)
                let location = MKPointAnnotation()
                location.coordinate = placemark.location!.coordinate
                location.title = self.selectedLocation!
                self.latitude = (location.coordinate.latitude)
                self.longitude = (location.coordinate.longitude)
                self.map.addAnnotation(location)
                self.self.getEarthquakeData()
                
            }
        })
    }
    
    //  Calls the Geonames API and converts the JSON it receives into an array
    func getEarthquakeData(){
        
        let north : String = String(latitude + 10)
        let south : String = String(latitude - 10)
        let east : String = String(longitude + 10)
        let west : String = String(longitude - 10)
        
        let urlAsString = "http://api.geonames.org/earthquakesJSON?north=" + north + "&south=" + south + "&east=" + east + "&west=" + west + "&username=jlucker"
        print(urlAsString)
        let url = NSURL(string: urlAsString)!
        let urlSession = NSURLSession.sharedSession()
    
        let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
            
            if (error != nil) {
                
                print(error!.localizedDescription)
                
            }
            
            var err: NSError?
            let jsonResult = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
            
            if (err != nil) {
                
                print("JSON Error \(err!.localizedDescription)")
            }
            
            print(jsonResult)

            let earthquakes:NSArray = jsonResult["earthquakes"] as! NSArray
            
            for quake in earthquakes{
                
                let tempLat : NSNumber = (quake["lat"] as? NSNumber)!
                let tempLon : NSNumber = (quake["lng"] as? NSNumber)!
                let tempMag : NSNumber = (quake["magnitude"] as? NSNumber)!
                let tempDepth : NSNumber = (quake["depth"] as? NSNumber)!
                let tempDate : String = (quake["datetime"] as! String)
                let tempId : String = (quake["eqid"] as! String)
                
                print(tempLat)
                print(tempLon)
                print(tempMag)
                print(tempDepth)
                print(tempDate)
                print(tempId)
                
                self.setEarthquakePins(tempLat, longitude : tempLon, magnitude : tempMag, depth : tempDepth, date : tempDate, id : tempId)
            }
        })
        
        jsonQuery.resume()
        
    }
    
    func setEarthquakePins(latitude : NSNumber, longitude : NSNumber, magnitude : NSNumber, depth : NSNumber, date : String, id : String){
        
        //let lat : CLLocationDegrees = CLLocationDegrees(latitude)
        //let long : CLLocationDegrees = CLLocationDegrees(longitude)
        
        let lat : Double = Double(latitude)
        let long : Double = Double(longitude)

        print()
        print(lat)
        print(long)
        print()
        let location = CLLocationCoordinate2D(
            latitude:  lat,
            longitude: long
        )

        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = id
        annotation.subtitle = date
        self.map.addAnnotation(annotation)
        
    }
}

























