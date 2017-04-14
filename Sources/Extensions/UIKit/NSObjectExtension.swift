//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

extension NSObject {

    #if !os(macOS)
    public var className: String {
        return type(of: self).className
    }
    #endif

    public static var className: String {
        return String(describing: self)
    }

}
