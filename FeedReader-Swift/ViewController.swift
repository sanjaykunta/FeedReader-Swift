//
//  ViewController.swift
//  FeedReader-Swift
//
//  Created by Sanjay Kumar Kunta on 7/10/14.
//  Copyright (c) 2014 Kent State University. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    var feedItems:NSMutableArray = []
    @IBOutlet var feedsTableView: UITableView
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        let url = "http://api.ihackernews.com/page"
        var manager = AFHTTPRequestOperationManager()

        let success: (AFHTTPRequestOperation!, AnyObject!) -> Void = {op, obj in
           
            var JSONdictionary:NSDictionary
            JSONdictionary = obj as NSDictionary
            
            var itemsArray:[NSDictionary]
            itemsArray = JSONdictionary.objectForKey("items") as [NSDictionary]
            
            var feedItemsArray:NSMutableArray = NSMutableArray()
            
            for itemDictionary in itemsArray
            {
                var feedItem = FeedItem()
                feedItem.title = itemDictionary.objectForKey("title") as NSString
                feedItem.url = itemDictionary.objectForKey("url") as NSString
                feedItem.postedBy = itemDictionary.objectForKey("postedBy") as NSString
                feedItem.postedAgo = itemDictionary.objectForKey("postedAgo") as NSString
                feedItem.commentCount = itemDictionary.objectForKey("commentCount") as NSNumber
                feedItem.points = itemDictionary.objectForKey("points") as NSNumber
                
                feedItemsArray.addObject(feedItem)
                
            }
            
            self.feedItems = feedItemsArray
            
            dispatch_async(dispatch_get_main_queue(), dispatch_block_t?
                {
                    self.feedsTableView.reloadData()
                })
            
        }
        let failure: (AFHTTPRequestOperation!, NSError!) -> Void = {op, err in println(err)}
        
        manager.GET(url, parameters:nil, success: success, failure:failure)
        
    }
    

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return feedItems.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var feedsTableViewCell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as UITableViewCell
        var obj:FeedItem = feedItems[indexPath.row] as FeedItem
        feedsTableViewCell.textLabel.text = obj.title;
        return feedsTableViewCell;
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        var dvc:DetailViewController
        dvc = segue.destinationViewController as DetailViewController
        var index:NSIndexPath =  self.feedsTableView.indexPathForSelectedRow()
        var feed:FeedItem = feedItems[index.row] as FeedItem
        dvc.selectedUrl = feed.url
        
    }
    
   

}

