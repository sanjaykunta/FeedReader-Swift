//
//  DetailViewController.swift
//  FeedReader-Swift
//
//  Created by Sanjay Kumar Kunta on 7/11/14.
//  Copyright (c) 2014 Kent State University. All rights reserved.
//

import Foundation

class DetailViewController:UIViewController
{
    
    @IBOutlet var detailWebView: UIWebView
    var selectedUrl:NSString = ""
    
    override func viewDidLoad() {
        
        var request:NSURLRequest = NSURLRequest(URL: NSURL(string: selectedUrl))
        
        detailWebView.loadRequest(request)
        
    }
}