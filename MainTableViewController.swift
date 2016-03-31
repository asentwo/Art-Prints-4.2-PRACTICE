//
//  MainTableViewController.swift
//  Art Prints 4.2 PRACTICE
//
//  Created by Justin Doo on 8/1/15.
//  Copyright (c) 2015 Justin Doo. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, GalleryAccess, WebAccess, UISearchResultsUpdating {
    

    
    // MARK: -Constants
    
    let data = Data()
    
    var postersShown = [Bool](count: 5, repeatedValue: false)
    //initial count for postersShown is 0, so will animate in
    
    let toImage = UIImage(named:"myname.png")
    
    let posterSearchArray = ["Olly Moss","Ken Taylor","Dan McCarthy","JC Richard","Martin Ansin"]
    
    var filteredSearchArray: [Data.Entry] = [] {
        didSet  {self.tableView.reloadData()}
    }
    //the filtered array is empty now and will only add entries when they are typed in the search bar
    
    
    var resultsSearchController = UISearchController()

    
    //MARK: -ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        searchBarAttributes()
        tableViewAttributes()
      
    }
    
    
    // MARK: -Parallax Effect
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = self.tableView.contentOffset.y
        for cell in self.tableView.visibleCells as! [MainTableViewCell] {
            
            let x = cell.artistMainImage.frame.origin.x
            let w = cell.artistMainImage.bounds.width
            let h = cell.artistMainImage.bounds.height
            let y = ((offsetY - cell.frame.origin.y) / h) * 25
            cell.artistMainImage.frame = CGRectMake(x, y, w, h)
            cell.contentMode = UIViewContentMode.ScaleAspectFill
        }
    }
    
    // MARK: - Protocols
    
    func galleryButtonTapped(artist: Data.Entry) {
        let collectionView = self.storyboard!.instantiateViewControllerWithIdentifier("CollectionViewController") as!
        CollectionViewController
        
        collectionView.entry = artist
        
         dismissSearchBar ()
        
    self.navigationController!.pushViewController(collectionView, animated: true)
        
    }
    

    func webButtonTapped(website: Data.Entry) {
        let websiteView = self.storyboard!.instantiateViewControllerWithIdentifier("WebsiteViewController") as!
        WebsiteViewController
            
        websiteView.entry = website
            
        
        dismissSearchBar ()
        
        
    self.navigationController!.pushViewController(websiteView, animated: true)
       
    }


    
    // MARK: -Table View
    
    func tableViewAttributes () {
        
        self.tableView.allowsSelection = false
        //stops label from disappearing
        self.tableView.rowHeight = 400
        self.tableView.tableHeaderView = self.resultsSearchController.searchBar
        self.tableView.contentOffset = CGPointMake(0, 30)
        //hides search bar, makes it appear on pull down
        
        self.tableView.reloadData()
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultsSearchController.active)
        {
            return self.filteredSearchArray.count
        }
        else
        {
            return data.artPosters.count        }   }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mainTableViewCell", forIndexPath: indexPath) as! MainTableViewCell
        let entry: Data.Entry
        
        if (self.resultsSearchController.active) {
            entry = filteredSearchArray[indexPath.row]
        }
        else {
            entry = data.artPosters[indexPath.row]
        }
        
        let image = UIImage(named: entry.artImage)
        
        
        cell.galleryButton = self
        cell.webButton = self
        
        cell.artistMainImage.image = image
        cell.artistNameLabel.text = entry.artistName
        cell.artistName = entry
        
        return cell
    }
    
    
    
    // MARK: -Search/ Search Bar
    
    
    func searchBarAttributes() {
        
        self.resultsSearchController = UISearchController(searchResultsController: nil)
        self.resultsSearchController.searchResultsUpdater = self
        self.resultsSearchController.dimsBackgroundDuringPresentation = false
        self.resultsSearchController.searchBar.sizeToFit()
        self.resultsSearchController.hidesNavigationBarDuringPresentation = false
        self.resultsSearchController.searchBar.searchBarStyle = .Minimal
        self.resultsSearchController.searchBar.translucent = false
        
    }
    
    

    func dismissSearchBar () {
        resultsSearchController.active = false
        //dismisses search bar after transitioning to next vc
    }
   
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        self.filteredSearchArray.removeAll(keepCapacity: false)
        //delete everything in filteredSearchArray so can add new search results
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS [c] %@", searchController.searchBar.text!)
          //taking everything in search bar and searching for it in self
        
        for entry in data.artPosters {
            if entry.artistName.lowercaseString.rangeOfString(searchController.searchBar.text!.lowercaseString) != nil {
                self.filteredSearchArray.append(entry)
       //if the text in the search bar is not nil, add the entry typed to the filtered array
            }
        }
        self.tableView.reloadData()
        //reload view with new data
    }
    
    
    
    // MARK: -Animation
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if postersShown[indexPath.row] == false {
            
            cell.alpha = 0
            //cells intitial value transparent
            
            
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                cell.alpha = 1
                //cells back from transparency
                
            })
            
            postersShown[indexPath.row] = true
            // marks all posters that have already animated in to true to they won't animate again
        }
        
    }
}