//
//  Created by Tom Baranes on 17/06/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Misc

extension NotificationCenter {

    /// Creates a notification with a given name, sender, and information
    /// and posts it to the notification center from a specified thread.
    /// - Parameters:
    ///   - name: The notification `Name` that will be posted.
    ///   - object: The object posting the notification. Default value is nil.
    ///   - userInfo: Optional information about the the notification. Default value is nil.
    ///   - queue: the thread from the notification will be posted.
    public func postNotification(_ name: String,
                                 object: AnyObject? = nil,
                                 // swiftlint:disable:next discouraged_optional_collection
                                 userInfo: [NSObject: AnyObject]? = nil,
                                 queue: DispatchQueue) {
        queue.async {
            self.post(name: NSNotification.Name(rawValue: name), object: object, userInfo: userInfo)
        }
    }

}
