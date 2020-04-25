//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Time Transform

extension Double {
    public var millisecond: TimeInterval { self / 1000 }
    public var milliseconds: TimeInterval { self / 1000 }
    public var ms: TimeInterval { self / 1000 }

    public var second: TimeInterval { self }
    public var seconds: TimeInterval { self }

    public var minute: TimeInterval { self * 60 }
    public var minutes: TimeInterval { self * 60 }

    public var hour: TimeInterval { self * 3600 }
    public var hours: TimeInterval { self * 3600 }

    public var day: TimeInterval { self * 3600 * 24 }
    public var days: TimeInterval { self * 3600 * 24 }
}

// MARK: - Transform

extension Double {

    public var formattedPrice: String {
        let formatter = SUNumberFormatter.shared
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }

}
