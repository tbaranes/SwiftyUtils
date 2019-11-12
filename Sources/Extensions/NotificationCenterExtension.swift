//
//  Created by Tom Baranes on 17/06/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Misc

extension NotificationCenter {

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
