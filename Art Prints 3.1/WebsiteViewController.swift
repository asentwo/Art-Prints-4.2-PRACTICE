//
//  WebsiteViewController.swift
//  Art Prints 4.1 TEST Practice
//
//  Created by Justin Doo on 8/24/15.
//  Copyright (c) 2015 Justin Doo. All rights reserved.
//

import UIKit

class WebsiteViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    var entry : Data.Entry?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startRequest()
     
    
    self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()

    }

    
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        NSLog("The web view is starting to load")
    }
    
    func webViewDidFinishLoad(webView: UIWebView){
       activityIndicator.hidden = true
        activityIndicator.stopAnimating()
        NSLog ("The web view has finished loading")
        
    }
    
  func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        self.handleError()
    }
    
    func handleError() {
        let alert = UIAlertController(title: "Network Error", message: "Failed getting information", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func startRequest() {
        let myWeb = webView
        let url = NSURL(string: entry!.website)!
        let myReq = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) {(data, response, error) in
            dispatch_async(dispatch_get_main_queue()) {
                if (error == nil) {
                     myWeb.loadRequest(myReq)
                }
                else {
                    self.handleError()
                }
            }
        }
        task.resume()
        
    }



}
