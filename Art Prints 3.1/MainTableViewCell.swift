//
//  MainTableViewCell.swift
//  Art Prints 3.1
//
//  Created by Justin Doo on 8/1/15.
//  Copyright (c) 2015 Justin Doo. All rights reserved.
//

import UIKit


// MARK: -Protocols
protocol WebAccess {
    func webButtonTapped (website: Data.Entry)
}

protocol GalleryAccess {
    func galleryButtonTapped (artist: Data.Entry)
}


class MainTableViewCell: UITableViewCell {
    
 
    
// MARK: -Outlets
    @IBOutlet var artistMainImage: UIImageView!
    
    @IBOutlet var imageWrapper: UIView!
    
    @IBOutlet var artistNameLabel: UILabel!
    
    
// MARK: -Constants
    var galleryButton: GalleryAccess? //Delegate
    
    var webButton: WebAccess? //Delegate

    var artistName: Data.Entry?
   
    
    
    
 // MARK: -Nib
    override func awakeFromNib() {
     super.awakeFromNib()
         self.imageWrapper.clipsToBounds = true
        
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
 
    
 // MARK: -actions
    
    @IBAction func galleryButtonPressed(sender: AnyObject) {
        
        
        
        galleryButton?.galleryButtonTapped(artistName!)
        
    }
    
    @IBAction func websiteButtonPressed(sender: AnyObject) {
        
        webButton?.webButtonTapped(artistName!)
        
    }

}
