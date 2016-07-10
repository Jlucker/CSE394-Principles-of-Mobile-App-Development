//
//  PetDetailViewController.swift
//  Swipet
//
//  Created by tdzamora on 3/24/16.
//  Copyright © 2016 tdzamora. All rights reserved.
//

import UIKit
import CoreData

class PetDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var selectedImage: UIImageView!
    
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var nItem:Pet? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if nItem != nil {
            type.text = nItem?.type
            name.text = nItem?.name
            desc.text = nItem?.desc
            selectedImage.image = UIImage(data: (nItem?.picture)! as NSData)
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveData(sender: UIBarButtonItem) {
        let fetchRequest = NSFetchRequest(entityName: "Shelter")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if  let fetchResults = (try? context.executeFetchRequest(fetchRequest)) as? [Shelter]
        {
            if nItem == nil
            {
                let context = self.context
                let ent = NSEntityDescription.entityForName("Pet", inManagedObjectContext: context)
                
                let nItem = Pet(entity: ent!, insertIntoManagedObjectContext: context)
                nItem.type = type.text!
                nItem.name = name.text!
                nItem.desc = desc.text!
                nItem.shelter = fetchResults[0].name
            
                let imageData = UIImagePNGRepresentation(selectedImage.image!)
                nItem.picture = imageData!
            
                do {
                    try context.save()
                } catch _ {
                }
            }else
            {
                nItem!.type = type.text!
                nItem!.name = name.text!
                nItem!.desc = desc.text!
                nItem!.shelter = fetchResults[0].name
                let imageData = UIImagePNGRepresentation(selectedImage.image!)
                nItem!.picture = imageData!
                do {
                    try context.save()
                } catch _ {
                }
            }
        }
        navigationController!.popViewControllerAnimated(true)
        
    }
    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func selectImage(sender: UIButton) {
        let photoPicker = UIImagePickerController ()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        // display image selection view
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        
        picker .dismissViewControllerAnimated(true, completion: nil)
        selectedImage.image=info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
}
