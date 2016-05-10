//
//  NSNotificationCenterExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public extension NSNotificationCenter {
    
    public func postNotification(name name: String, object: AnyObject? = nil, userInfo: [NSObject : AnyObject]? = nil, queue: dispatch_queue_t) {
        dispatch_async(queue) {
            self.postNotificationName(name, object: object, userInfo: userInfo)
        }
    }

}
