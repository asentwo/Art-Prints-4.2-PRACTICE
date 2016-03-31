//
//  SoloViewController.swift
//  Art Prints 4.2 PRACTICE
//
//  Created by Justin Doo on 8/5/15.
//  Copyright (c) 2015 Justin Doo. All rights reserved.
//

import UIKit

class SoloViewController: UIViewController {

    //MARK -IBOutlets/ Constants
    
    @IBOutlet var imageView: UIImageView!

    var soloImage: UIImage!
  
    
    
    //MARK -viewDidLoad

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor()
        
        self.imageView.image = self.soloImage!
        
        definesPresentationContext = true
    }
    
    
  override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    // Sets background to a blank/empty image
    UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: .Default)
    // Sets shadow (line below the bar) to a blank image
    UINavigationBar.appearance().shadowImage = UIImage()
    // Sets the translucent background color
    UINavigationBar.appearance().backgroundColor = UIColor.clearColor()
    // Set translucent. (Default value is already true, so this can be removed if desired.)
    UINavigationBar.appearance().translucent = true
    
    
    }
    
    override func viewWillDisappear(animated: Bool) {
        
    UINavigationBar.appearance().setBackgroundImage(nil, forBarMetrics: .Default)
    UINavigationBar.appearance().backgroundColor = UIColor.blackColor()
    UINavigationBar.appearance().translucent = false
    UINavigationBar.appearance().shadowImage = nil
    
    }
    
    
    //MARK -IBActions / Share
    
    @IBAction func sharePressed(sender: AnyObject) {
        
        let shareImage = self.imageView.image!
 
        
            let activityVC : UIActivityViewController = UIActivityViewController(activityItems: [shareImage], applicationActivities: nil)
        
        
        self.presentViewController(activityVC, animated: true, completion: nil)
        
    }

    @IBAction func xPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
}


