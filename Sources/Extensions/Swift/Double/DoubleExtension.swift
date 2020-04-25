//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Time Transform

extension Double {
    /// Convert the value to milliseconds `TimeInterval`.
    public var millisecond: TimeInterval { self / 1000 }
    /// Convert the value to milliseconds `TimeInterval`.
    public var milliseconds: TimeInterval { self / 1000 }
    /// Convert the value to milliseconds `TimeInterval`.
    public var ms: TimeInterval { self / 1000 }

    /// Convert the value to seconds `TimeInterval`.
    public var second: TimeInterval { self }
    /// Convert the value to seconds `TimeInterval`.
    public var seconds: TimeInterval { self }

    /// Convert the value to minutes `TimeInterval`.
    public var minute: TimeInterval { self * 60 }
    /// Convert the value to minutes `TimeInterval`.
    public var minutes: TimeInterval { self * 60 }

    /// Convert the value to hours `TimeInterval`.
    public var hour: TimeInterval { self * 3600 }
    /// Convert the value to hours `TimeInterval`.
    public var hours: TimeInterval { self * 3600 }

    /// Convert the value to days `TimeInterval`.
    public var day: TimeInterval { self * 3600 * 24 }
    /// Convert the value to days `TimeInterval`.
    public var days: TimeInterval { self * 3600 * 24 }
}

// MARK: - Transform

extension Double {

    /// Transforme the Double to a formatted price including currency (using the current locale).
    /// - Returns: A formatted price following the locale.
    public var formattedPrice: String {
        let formatter = SUNumberFormatter.shared
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }

}
