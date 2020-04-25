//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

extension NSObject {

    #if !os(macOS)
    /// The name of a the type inheriting of `NSObject`
    /// - Returns: String
    public var className: String {
        Self.className
    }
    #endif

    /// The name of a the type inheriting of `NSObject`
    /// - Returns: String
    public static var className: String {
        String(describing: self)
    }

}
