//
//  CollectionViewController.swift
//  Art Prints 4.2 PRACTICE 
//
//  Created by Justin Doo on 8/12/15.
//  Copyright (c) 2015 Justin Doo. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    
    //MARK: -IBOutlets
    
    @IBOutlet var collectBackgroundImage: UIImageView!
    
    
    // MARK: -Constants
    
    var tappedImage : UIImage!
    
    var passImage : UIImage!

    var entry : Data.Entry?

   
    
    // MARK: -ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
              }
    
    
    //MARK: -Collection View
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entry!.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! CollectionViewCell
        
        let image = UIImage(named: entry!.images[indexPath.row])
        
        cell.contentView.layer.cornerRadius = 2.0;
        cell.contentView.layer.borderWidth = 1.0;
        cell.contentView.layer.borderColor = UIColor.clearColor().CGColor
        cell.contentView.layer.masksToBounds = true
        
       
      
        cell.layer.shadowOffset = CGSizeMake(2,2);
        cell.layer.shadowColor = UIColor.blackColor().CGColor;
        cell.layer.shadowRadius = 3;
        cell.layer.shadowOpacity = 0.25
        cell.layer.masksToBounds = false
        cell.layer.backgroundColor = UIColor.clearColor().CGColor
        
        cell.layer.shadowPath = UIBezierPath(rect: CGRectMake(5, 25, 380, 460)).CGPath
        //creates shadow effect
        
        cell.collectImage.image = image
        
        collectBackgroundImage.image = image
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        let currentCell = collectionView.cellForItemAtIndexPath(indexPath) as!
        CollectionViewCell;
        
        passImage = currentCell.collectImage.image
        
        self.performSegueWithIdentifier("collectToSolo", sender: self)
        
    }
    
    
    
    //MARK: -Segue
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "collectToSolo" {
            let soloVC = segue.destinationViewController as! SoloViewController
            
            
            soloVC.soloImage = self.passImage
        }

    }

}