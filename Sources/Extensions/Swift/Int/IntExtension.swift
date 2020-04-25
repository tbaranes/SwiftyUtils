//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Misc

extension Int {

    /// Check if the value is even or not.
    public var isEven: Bool { self.isMultiple(of: 2) }
    /// Check if the value is odd or not.
    public var isOdd: Bool { !isEven }
    /// Check if the value is positive or not.
    public var isPositive: Bool { self > 0 }
    /// Check if the value is negative or not.
    public var isNegative: Bool { !isPositive }
    /// Create a range from 0 to the current value.
    public var range: Range<Int> { 0..<self }

    /// Returns the number of digits this number.
    public var digits: Int {
        if self == 0 {
            return 1
        }
        return Int(log10(fabs(Double(self)))) + 1
    }

}

// MARK: - Transform

extension Int {

    /// Transforme the Double to a formatted price including currency (using the current locale).
    /// - Returns: A formatted price following the locale.
    public var formattedPrice: String {
        let formatter = SUNumberFormatter.shared
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }

}

// MARK: - Round

extension Int {

    /// Round the current value to the nearest dozens.
    public var nearestDozens: Int { nearest(to: 10) }
    /// Round the current value to the nearest hundreds.
    public var nearestHundreds: Int { nearest(to: 100) }
    /// Round the current value to the nearest thousands.
    public var nearestThousands: Int { nearest(to: 1000) }

    /// Caclulate the nearest below value for this number in comparison with a specified value.
    /// - Parameter value: The value that will be used to search the nearest up.
    /// - Returns: The nearest value to the speficied value.
    public func nearest(to value: Int) -> Int {
        self / value * value + (self % value) / (value / 2) * value
    }

}

// MARK: - Round below

extension Int {

    /// Round the current value to the nearest below dozens.
    public var nearestBelowDozens: Int { nearestBelow(to: 10) }
    /// Round the current value to the nearest below hundreds.
    public var nearestBelowHundreds: Int { nearestBelow(to: 100) }
    /// Round the current value to the nearest below thousands.
    public var nearestBelowThousands: Int { nearestBelow(to: 1000) }

    /// Caclulate the nearest below value for this number in comparison with a specified value.
    /// - Parameter value: The value that will be used to search the nearest up.
    /// - Returns: The nearest below value to the speficied value.
    public func nearestBelow(to value: Int) -> Int {
        self / value * value + 0 / (value / 2) * value
    }

}

// MARK: - Round Up

extension Int {

    /// Round the current value to the nearest up dozens.
    public var nearestUpDozens: Int { nearestUp(to: 10) }
    /// Round the current value to the nearest up hundreds.
    public var nearestUpHundreds: Int { nearestUp(to: 100) }
    /// Round the current value to the nearest up thousands.
    public var nearestUpThousands: Int { nearestUp(to: 1000) }

    /// Caclulate the nearest up value for this number in comparison with a specified value.
    /// - Parameter value: The value that will be used to search the nearest up.
    /// - Returns: The nearest up value to the speficied value.
    public func nearestUp(to value: Int) -> Int {
        self / value * value + (value / 2) / (value / 2) * value
    }

}
