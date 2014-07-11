//
//  FeedItem.swift
//  FeedReader-Swift
//
//  Created by Sanjay Kumar Kunta on 7/10/14.
//  Copyright (c) 2014 Kent State University. All rights reserved.
//

import Foundation

class FeedItem
{
    var title: NSString = ""
    var url:NSString = ""
    var commentCount:NSNumber = 0.0
    var postedBy:NSString = ""
    var postedAgo:NSString = ""
    var points:NSNumber = 0.0
    
    func description() -> String {
        return "Title: \(self.title)"
    }

}
