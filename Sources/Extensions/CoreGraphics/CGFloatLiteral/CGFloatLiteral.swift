//
//  Created by Tom Baranes on 15/09/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation
import CoreGraphics

extension IntegerLiteralType {

    // swiftlint:disable identifier_name
    /// Map an `IntegerLiteralType` to a `CGFloat`
    public var f: CGFloat {
        CGFloat(self)
    }

}

extension FloatLiteralType {

    /// Map an `FloatLiteralType` to a `CGFloat`
    public var f: CGFloat {
        CGFloat(self)
    }

}
