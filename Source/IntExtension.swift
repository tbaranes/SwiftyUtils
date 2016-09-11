//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public extension Int {

    public var isEven: Bool { return (self % 2 == 0) }
    public var isOdd: Bool { return (self % 2 != 0) }
    public var isPositive: Bool { return (self > 0) }
    public var isNegative: Bool { return (self < 0) }
    public var range: Range<Int> { return 0..<self }

    public var digits: Int {
        if self == 0 {
            return 1
        } else if Int(fabs(Double(self))) <= LONG_MAX {
            return Int(log10(fabs(Double(self)))) + 1
        } else {
            return -1
        }
    }

}
