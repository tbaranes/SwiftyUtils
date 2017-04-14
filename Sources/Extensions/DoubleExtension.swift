//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Time Transform

extension Double {
    public var millisecond: TimeInterval { return self / 1000 }
    public var milliseconds: TimeInterval { return self / 1000 }
    public var ms: TimeInterval { return self / 1000 }

    public var second: TimeInterval { return self }
    public var seconds: TimeInterval { return self }

    public var minute: TimeInterval { return self * 60 }
    public var minutes: TimeInterval { return self * 60 }

    public var hour: TimeInterval { return self * 3600 }
    public var hours: TimeInterval { return self * 3600 }

    public var day: TimeInterval { return self * 3600 * 24 }
    public var days: TimeInterval { return self * 3600 * 24 }
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
